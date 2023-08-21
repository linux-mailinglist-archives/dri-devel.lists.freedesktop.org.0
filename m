Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 54D0378243E
	for <lists+dri-devel@lfdr.de>; Mon, 21 Aug 2023 09:16:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7847610E1F8;
	Mon, 21 Aug 2023 07:16:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.nfschina.com (unknown [42.101.60.195])
 by gabe.freedesktop.org (Postfix) with SMTP id 4F9A410E1F8
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Aug 2023 07:16:24 +0000 (UTC)
Received: from [172.30.11.106] (unknown [180.167.10.98])
 by mail.nfschina.com (Maildata Gateway V2.8.8) with ESMTPSA id D8355606212E9; 
 Mon, 21 Aug 2023 15:16:21 +0800 (CST)
Message-ID: <07ffd0f9-853c-8aca-d2b6-8f643f83c940@nfschina.com>
Date: Mon, 21 Aug 2023 15:16:21 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] drm/ast: Avoid possible NULL dereference
Content-Language: en-US
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, airlied@redhat.com,
 tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch
X-MD-Sfrom: suhui@nfschina.com
X-MD-SrcIP: 180.167.10.98
From: Su Hui <suhui@nfschina.com>
In-Reply-To: <38503377-ec27-09dd-dc6b-836a9ac0a5df@wanadoo.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: eich@suse.de, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023/8/21 15:04, Christophe JAILLET wrote:
> Le 21/08/2023 à 08:22, Su Hui a écrit :
>> smatch error:
>> drivers/gpu/drm/ast/ast_dp501.c:227 ast_launch_m68k() error:
>> we previously assumed 'ast->dp501_fw' could be null (see line 223)
>>
>> when "!ast->dp501_fw" and "ast_load_dp501_microcode(dev) >= 0" is true,
>> there will be a NULL dereference of 'ast->dp501_fw'.
>>
>> Fixes: 12f8030e05c6 ("drm/ast: Actually load DP501 firmware when 
>> required")
>> Signed-off-by: Su Hui <suhui@nfschina.com>
>> ---
>>   drivers/gpu/drm/ast/ast_dp501.c | 6 ++++--
>>   1 file changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/ast/ast_dp501.c 
>> b/drivers/gpu/drm/ast/ast_dp501.c
>> index 1bc35a992369..d9f3a0786a6f 100644
>> --- a/drivers/gpu/drm/ast/ast_dp501.c
>> +++ b/drivers/gpu/drm/ast/ast_dp501.c
>> @@ -224,8 +224,10 @@ static bool ast_launch_m68k(struct drm_device *dev)
>>                   ast_load_dp501_microcode(dev) < 0)
>>                   return false;
>>   -            fw_addr = (u8 *)ast->dp501_fw->data;
>> -            len = ast->dp501_fw->size;
>> +            if (ast->dp501_fw) {
>> +                fw_addr = (u8 *)ast->dp501_fw->data;
>> +                len = ast->dp501_fw->size;
>> +            }
>>           }
>>           /* Get BootAddress */
>>           ast_moutdwm(ast, 0x1e6e2000, 0x1688a8a8);
>
> Hi,
>
> this looks like a false positive.
>
> If "!ast->dp501_fw", and ast_load_dp501_microcode()>=0, then 
> ast_load_dp501_microcode() will set a valid value in ast->dp501_fw.

Hi,

Sorry for the noise, you are right, this is a false positive.
I will take more careful next time.

Su Hui

>
> CJ
