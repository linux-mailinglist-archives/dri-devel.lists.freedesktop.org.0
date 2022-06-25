Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73E1B55AB3D
	for <lists+dri-devel@lfdr.de>; Sat, 25 Jun 2022 17:14:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2758B1124E5;
	Sat, 25 Jun 2022 15:14:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09F371124E5
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Jun 2022 15:14:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1656170080;
 bh=0LIV8KyxzGhecjJ//nKSW79oHrBrKnACeHdTdjDQjH8=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=KUtZXdH87AWXx0EESvFW7SS22Ikac02GXlFzx64s9G3O2//6X31+KXChNwyezZAWu
 URE7L/K5By/pYbid3GP2iYdQzFXMmS7MwfqmVbN/gwDNYTbiZAt+h3YxWzQgkokQok
 cVr5Vyzys9TAFZol/Lf2qdwsRiqtoIm0VPWNIo7c=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.162.44]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MbzuH-1nWL2l2UwR-00dZjx; Sat, 25
 Jun 2022 17:14:40 +0200
Message-ID: <d4fce87f-919b-0a44-f10f-b108f36ade09@gmx.de>
Date: Sat, 25 Jun 2022 17:14:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 2/4] fbcon: Add fbcon_modechange_possible() check
Content-Language: en-US
To: Daniel Vetter <daniel@ffwll.ch>
References: <20220625122502.68095-1-deller@gmx.de>
 <20220625122502.68095-3-deller@gmx.de> <YrcFrYfmOqT7WNyR@phenom.ffwll.local>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <YrcFrYfmOqT7WNyR@phenom.ffwll.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Val58dD8jR/JhfgoW+AEohEh6eWY+JMBAQ24icMIpAFe07dFWeS
 Z0W7CTIhv24Xku8ksRth3+QXgLWEEcBY2RfdEM20IRRyqefjX+0La1yXL7oHwzZnWlAmbcB
 8Ym846HYfoYOhuOukXassOm58C5/WAlRLhGOvXgE+FjMkqy+umRweWDpz37GZGlxysKrdcw
 +7PAGbAl6TnO5nbr0oAiQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:LvpWeGMe02I=:oNpx4pLkkL+ONgPMngZRYh
 rS4Xekm/fWlMn+7dYKKO6vBMoWOCqEaOFCTK5GDLh2uMPXeIWd8R4x6xRCHYmUMB3/GMjQcWy
 feaYaSQMQbOuR8fPX7vsSWjpJ7aedK4rEh1mnAOCXjtJxvfTTUOBjTbRDxPwGWXA9DWDI/3KV
 Qt7PBrmBfngM7/bQypyCcpm3AnaxjjPIt5aan8Bozoe/piopQt1AEjcRNMpbdfUndKhstd6nj
 TP582RLrvikUTKVBRYrt9bcVm3uNqeuIoZ+m3lbNGz7jnbdAdAxu/hSEbt8GPoOuioH5jO7gw
 8WLh93D5Q46n9gly9rTGKZbxxedo7pFH7fxKgYfnKY6NNwIvDIKACjz840FM5QINanp5X3moe
 GWAGU/XgYHyKgQaqciWwdf/fs//tUsJJhuvyGj2dHJHOWsARmC62rMC/CuVHwxGvhPEoyHIWA
 ONCs2zjEbGp5/NhEpCpJPDYf17WwnEaeHTNIeb5pKzs+0K4G4YYCllOAO2Wsfu8q3d7UJ0oTY
 sHQFlPTidHOtRnRJ21s7mpVJQJS/JoO9w03d1QK1QzhrkNr7vFnX3cPuET10I9ZvdOkpBTLuY
 TU/9O/xomrhzhbV4kmmAdHr5KDjiImO8cNo0MgFLWgIRa3mCzowriBgoUVJbLXneRIiS9eqLE
 eBsldYHiJ9nQZ3jh0RbQmzPxHNaHfDenZbyqJzMCSNmPnIH/78yplbhhOpHKHabsS+EOjCiSD
 UiOsVFqX7D0rzuyVx18yxnlJAiO5Gz3T/WalTvI0igOCqxnp34Tz0Zwsyy7+5n6ldPweYDoNg
 PcjQ8Ep1+qfiUYI9z/0viJMECe8KyHQIXy/c2DZ4Y4vSBNTyRHZLXpYbnlrS0tuZr05dpdX0X
 Z+a5GUANWHq7eBkD5lsM4uTp8oujM/iZ3uqdqjsGyDYTxgJb4cXoiAmX/vVdZr2JBgOJ1SHkr
 BplIwp2OwRHdsU/NVF0dRGiV4bqp0jO7StxPUOHJljk839kYN0emz1dOl6zjNKldPD7jHoWdK
 ecN59kpR0ENi+QMAaqrChC1tFkpMuW+lGHfzQMr2oLY+SqVhP+k3w9WYVU/XefqM5d9GyplQK
 DbvxEDWqLBZ/jjOAnnPcJsOrmW3EtDMchodQerzncxImLFdXIvjJGqNRQ==
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
Cc: daniel.vetter@ffwll.ch, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 6/25/22 14:55, Daniel Vetter wrote:
> On Sat, Jun 25, 2022 at 02:25:00PM +0200, Helge Deller wrote:
>> We need to prevent that users configure a screen size which is smaller =
than the
>> currently selected font size. Otherwise rendering chars on the screen w=
ill
>> access memory outside the graphics memory region.
>>
>> This patch adds a new function fbcon_modechange_possible() which implem=
ents
>> this check and which may be extended with other checks later if necessa=
ry.  The
>> new function will be called from the FBIOPUT_VSCREENINFO ioctl handler =
in
>> fbmem.c, which will then return -EINVAL to the user if the new screen s=
ize is
>> too small.
>>
>> Signed-off-by: Helge Deller <deller@gmx.de>
>> Cc: stable@vger.kernel.org # v5.4+
>> ---
>>  drivers/video/fbdev/core/fbcon.c | 26 ++++++++++++++++++++++++++
>>  include/linux/fbcon.h            |  4 ++++
>>  2 files changed, 30 insertions(+)
>>
>> diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/cor=
e/fbcon.c
>> index e162d5e753e5..e4cc4841ed7f 100644
>> --- a/drivers/video/fbdev/core/fbcon.c
>> +++ b/drivers/video/fbdev/core/fbcon.c
>> @@ -2736,6 +2736,32 @@ void fbcon_update_vcs(struct fb_info *info, bool=
 all)
>>  }
>>  EXPORT_SYMBOL(fbcon_update_vcs);
>>
>> +/* let fbcon check if it supports a new screen resolution */
>> +int fbcon_modechange_possible(struct fb_info *info, struct fb_var_scre=
eninfo *var)
>> +{
>> +	struct fbcon_ops *ops =3D info->fbcon_par;
>> +	struct vc_data *vc;
>> +	int i;
>
> 	WARN_CONSOLE_UNLOCKED();
> here please.

Yes, good idea.

>> +
>> +	if (!ops || ops->currcon < 0)
>> +		return -EINVAL;
>> +
>> +	/* prevent setting a screen size which is smaller than font size */
>> +	for (i =3D first_fb_vc; i <=3D last_fb_vc; i++) {
>
> Maybe a follow up patch to make this an interator? Kinda like what I've
> done for fbcon_for_each_registered_fb, maybe call it fbcon_for_each_fb_v=
c
> or so.

Yes, that would be possible later on.
Right now I'd like to limit changes to minimum to make backporting easy.


>> +		vc =3D vc_cons[i].d;
>> +		if (!vc || vc->vc_mode !=3D KD_TEXT ||
>
> I don't think it's good to filter for !KD_TEXT here, because then we'd
> need to recheck fonts when Xorg would try to switch back to text mode, a=
nd
> if that then fails we kinda broke the system.
>
> I can't think of a use-case where you'd want to upload a font which brea=
ks
> your console that Xorg is using right now, so best to just drop this
> check.

Yes, probably right.
Will drop that.

>> +		    fbcon_info_from_console(i) !=3D info)
>
> So I think, but not 100% sure, that with my recent rework for
> fbcon_info_from_console this should be impossible, since the races are
> gone. I guess it doesn't hurt to cargo-cult this, but a follow up patch =
to
> roll out fbcon_for_each_fb_vc and then delete this check from all of the
> loop iterations would be really good to make this clear.
>
> If you're not sure this is safe we could add this consistency check in a
> if (WARN_ON(fbcon_info_from_console(i))!=3D info) continue; into the loo=
p
> iterator itself.

Since we now added the WARN_CONSOLE_UNLOCKED() as suggested by you above
I don't think more additional checks are needed.

>
>> +			continue;
>> +
>> +		if (FBCON_SWAP(var->rotate, var->xres, var->yres) < vc->vc_font.widt=
h ||
>> +		    FBCON_SWAP(var->rotate, var->yres, var->xres) < vc->vc_font.heig=
ht)
>
> Bit a bikeshed, but please do the check the same way around as in the
> other place.

Fixed in upcoming series now.

Helge

> Maybe even extract a helper that you pass the vc and the var
> struct too and it checks that it fits, and then use it here and in the
> previous patch.
>
> Cheers, Daniel
>
>> +			return -EINVAL;
>> +	}
>> +
>> +	return 0;
>> +}
>> +EXPORT_SYMBOL(fbcon_modechange_possible);
>> +
>>  int fbcon_mode_deleted(struct fb_info *info,
>>  		       struct fb_videomode *mode)
>>  {
>> diff --git a/include/linux/fbcon.h b/include/linux/fbcon.h
>> index ff5596dd30f8..2382dec6d6ab 100644
>> --- a/include/linux/fbcon.h
>> +++ b/include/linux/fbcon.h
>> @@ -15,6 +15,8 @@ void fbcon_new_modelist(struct fb_info *info);
>>  void fbcon_get_requirement(struct fb_info *info,
>>  			   struct fb_blit_caps *caps);
>>  void fbcon_fb_blanked(struct fb_info *info, int blank);
>> +int  fbcon_modechange_possible(struct fb_info *info,
>> +			       struct fb_var_screeninfo *var);
>>  void fbcon_update_vcs(struct fb_info *info, bool all);
>>  void fbcon_remap_all(struct fb_info *info);
>>  int fbcon_set_con2fb_map_ioctl(void __user *argp);
>> @@ -33,6 +35,8 @@ static inline void fbcon_new_modelist(struct fb_info =
*info) {}
>>  static inline void fbcon_get_requirement(struct fb_info *info,
>>  					 struct fb_blit_caps *caps) {}
>>  static inline void fbcon_fb_blanked(struct fb_info *info, int blank) {=
}
>> +static inline int  fbcon_modechange_possible(struct fb_info *info,
>> +				struct fb_var_screeninfo *var) { return 0; }
>>  static inline void fbcon_update_vcs(struct fb_info *info, bool all) {}
>>  static inline void fbcon_remap_all(struct fb_info *info) {}
>>  static inline int fbcon_set_con2fb_map_ioctl(void __user *argp) { retu=
rn 0; }
>> --
>> 2.35.3
>>
>

