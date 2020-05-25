Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A5A11E1C2B
	for <lists+dri-devel@lfdr.de>; Tue, 26 May 2020 09:26:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E66B489CF9;
	Tue, 26 May 2020 07:26:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2834989C48
 for <dri-devel@lists.freedesktop.org>; Mon, 25 May 2020 15:35:04 +0000 (UTC)
Received: from fsav109.sakura.ne.jp (fsav109.sakura.ne.jp [27.133.134.236])
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 04PFYwe6010367;
 Tue, 26 May 2020 00:34:58 +0900 (JST)
 (envelope-from penguin-kernel@i-love.sakura.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav109.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav109.sakura.ne.jp);
 Tue, 26 May 2020 00:34:58 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav109.sakura.ne.jp)
Received: from [192.168.1.9] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
 (authenticated bits=0)
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 04PFYvw7010363
 (version=TLSv1.2 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
 Tue, 26 May 2020 00:34:57 +0900 (JST)
 (envelope-from penguin-kernel@i-love.sakura.ne.jp)
Subject: Re: [PATCH] drm/vkms: Don't warn hrtimer_forward_now failure.
To: Daniel Vetter <daniel@ffwll.ch>
References: <20200525143849.4964-1-penguin-kernel@I-love.SAKURA.ne.jp>
 <20200525152119.GL206103@phenom.ffwll.local>
From: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Message-ID: <b3715721-4982-83d9-dd6f-2a87e3b02a40@i-love.sakura.ne.jp>
Date: Tue, 26 May 2020 00:34:58 +0900
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <20200525152119.GL206103@phenom.ffwll.local>
Content-Language: en-US
X-Mailman-Approved-At: Tue, 26 May 2020 07:26:30 +0000
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: Shayenne Moura <shayenneluzmoura@gmail.com>,
 syzbot+0871b14ca2e2fb64f6e3@syzkaller.appspotmail.com,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 DRI <dri-devel@lists.freedesktop.org>, Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020/05/26 0:21, Daniel Vetter wrote:
> On Mon, May 25, 2020 at 11:38:49PM +0900, Tetsuo Handa wrote:
>> Commit 3a0709928b172a41 ("drm/vkms: Add vblank events simulated by
>> hrtimers") introduced ret_overrun variable. And that variable was an
>> unused-but-set-variable until commit 09ef09b4ab95dc40 ("drm/vkms:
>> WARN when hrtimer_forward_now fails") added WARN_ON(ret_overrun != 1).
>>
>> Now, syzbot is hitting this WARN_ON() using a simple reproducer that
>> does open("/dev/dri/card1") followed by ioctl(DRM_IOCTL_WAIT_VBLANK),
>> and a debug printk() patch says that syzbot is getting
>>
>>    output->vblank_hrtimer.base->get_time()=93531904774 (which is uptime)
>>    output->period_ns=0
>>    ret_overrun=216994
>>
>> . I can't understand what "verify the hrtimer_forward_now return" in
>> that commit wants to say. hrtimer_forward_now() must return, and the
>> return value of hrtimer_forward_now() is not a boolean. Why comparing
>> with 1 ? Anyway, this failure is not something that worth crashing the
>> system. Let's remove the ret_overrun variable and WARN_ON() test.
> 
> Uh we're not crashing the system, it's a warning backtrace.

syzbot uses panic_on_warn=1, and this bug is currently the 8th top crasher.

> 
> And we've spent a few months hunting the races here, so just removing that
> check isn't really a good idea. The correct thing to do is figure out why
> we're hitting this. It could be that we're having a missing check
> somewhere, or missing initialization, and that's what syzbot is hitting.
> Removing this check here just papers over the bug.

Here is a reproducer which syzbot is using.

----------
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <sys/ioctl.h>
#include <drm/drm.h>

int main(int argc, char *argv[])
{
	union drm_wait_vblank arg;
	int fd = open("/dev/dri/card1", O_RDONLY);

	arg.request.type = 0;
	arg.request.sequence = 0xffff;
	arg.request.signal = 0x21;
	ioctl(fd, DRM_IOCTL_WAIT_VBLANK, &arg);
	return 0;
}
----------

Debug printk() patch shows that hrtimer_forward_now() can return larger than 1.
What is the reason you are expecting hrtimer_forward_now() to always return 1 ?

> 
> If the vkms driver is loaded, and there's nothing else going on, then what
> I expect to happen is that this virtual hw is entirely off. And in that
> case, the vblank ioctl should be rejected outright. So there's definitely
> something fishy going on to begin with.
> 
> If otoh the virtual hw is somehow on (maybe fbcon gets loaded, no idea),
> then the vblank wait shouldn't just blow up like this.
> -Daniel
> 
>>
>> Link: https://syzkaller.appspot.com/bug?id=0ba17d70d062b2595e1f061231474800f076c7cb
>> Signed-off-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
>> Reported-by: syzbot+0871b14ca2e2fb64f6e3@syzkaller.appspotmail.com
>> Fixes: 09ef09b4ab95dc40 ("drm/vkms: WARN when hrtimer_forward_now fails")
>> ---
>>  drivers/gpu/drm/vkms/vkms_crtc.c | 5 +----
>>  1 file changed, 1 insertion(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/vkms/vkms_crtc.c b/drivers/gpu/drm/vkms/vkms_crtc.c
>> index ac85e17428f8..cc1811ce6092 100644
>> --- a/drivers/gpu/drm/vkms/vkms_crtc.c
>> +++ b/drivers/gpu/drm/vkms/vkms_crtc.c
>> @@ -13,12 +13,9 @@ static enum hrtimer_restart vkms_vblank_simulate(struct hrtimer *timer)
>>  						  vblank_hrtimer);
>>  	struct drm_crtc *crtc = &output->crtc;
>>  	struct vkms_crtc_state *state;
>> -	u64 ret_overrun;
>>  	bool ret;
>>  
>> -	ret_overrun = hrtimer_forward_now(&output->vblank_hrtimer,
>> -					  output->period_ns);
>> -	WARN_ON(ret_overrun != 1);
>> +	hrtimer_forward_now(&output->vblank_hrtimer, output->period_ns);
>>  
>>  	spin_lock(&output->lock);
>>  	ret = drm_crtc_handle_vblank(crtc);
>> -- 
>> 2.18.2
>>
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
