Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C140375ABCF
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jul 2023 12:21:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78DAB10E0DE;
	Thu, 20 Jul 2023 10:21:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7688A10E0DE
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jul 2023 10:21:34 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.43])
 by gateway (Coremail) with SMTP id _____8AxDOusCrlkMp0HAA--.14112S3;
 Thu, 20 Jul 2023 18:21:32 +0800 (CST)
Received: from [10.20.42.43] (unknown [10.20.42.43])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8DxJ8ydCrlkgG41AA--.41250S3; 
 Thu, 20 Jul 2023 18:21:31 +0800 (CST)
Message-ID: <20cd98b9-23da-62d5-e8b2-4fa18217f326@loongson.cn>
Date: Thu, 20 Jul 2023 18:21:17 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [05/11] drm/tests: helpers: Create an helper to allocate a
 locking ctx
To: Maxime Ripard <mripard@kernel.org>,
 Javier Martinez Canillas <javierm@redhat.com>
References: <20230710-kms-kunit-actions-rework-v1-5-722c58d72c72@kernel.org>
 <970f4a65-25dc-1805-3776-6447a61f77c5@loongson.cn>
 <87o7k7hg1d.fsf@minerva.mail-host-address-is-not-set>
 <5khgq6xy4ztci45qtxzo7fyvmdj3i6rrnl5yuny3gusgeeumdq@eobkes722rky>
Content-Language: en-US
From: suijingfeng <suijingfeng@loongson.cn>
In-Reply-To: <5khgq6xy4ztci45qtxzo7fyvmdj3i6rrnl5yuny3gusgeeumdq@eobkes722rky>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf8DxJ8ydCrlkgG41AA--.41250S3
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj93XoW7tF45uw48ZFWDGry7Cw4rZwc_yoW8KF45pr
 48JayjkrWUtryUCw1vvw18u3sa9rWfWrnrWw1ktry3CFZ0qF9xKFW5tr1YkFyfCryDWF1j
 va15Ary7uF98AFgCm3ZEXasCq-sJn29KB7ZKAUJUUUUr529EdanIXcx71UUUUU7KY7ZEXa
 sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
 0xBIdaVrnRJUUUBvb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
 IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
 e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
 0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
 xVW8Jr0_Cr1UM2kKe7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07
 AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWU
 XVWUAwAv7VC2z280aVAFwI0_Gr1j6F4UJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64
 vIr41lc7I2V7IY0VAS07AlzVAYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkE
 bVWUJVW8JwCFI7km07C267AKxVWUXVWUAwC20s026c02F40E14v26r1j6r18MI8I3I0E74
 80Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0
 I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04
 k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4UJVWxJr1lIxAIcVC2z280aVCY
 1x0267AKxVW8Jr0_Cr1UYxBIdaVFxhVjvjDU0xZFpf9x07jn3ktUUUUU=
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
Cc: Emma Anholt <emma@anholt.net>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,


On 2023/7/20 18:07, Maxime Ripard wrote:
> On Wed, Jul 19, 2023 at 09:12:14PM +0200, Javier Martinez Canillas wrote:
>> suijingfeng <suijingfeng@loongson.cn> writes:
>>
>>> Hi,
>>>
>>> On 2023/7/10 15:47, Maxime Ripard wrote:
>> [...]
>>
>>>> +
>>>> +/**
>>>> + * drm_kunit_helper_context_alloc - Allocates an acquire context
>>>> + * @test: The test context object
>>>> + *
>>>> + * Allocates and initializes a modeset acquire context.
>>>> + *
>>>> + * The context is tied to the kunit test context, so we must not call
>>>> + * drm_modeset_acquire_fini() on it, it will be done so automatically.
>>>> + *
>>>> + * Returns:
>>>> + * An ERR_PTR on error, a pointer to the newly allocated context otherwise
>>>> + */
>>>> +struct drm_modeset_acquire_ctx *
>>>> +drm_kunit_helper_acquire_ctx_alloc(struct kunit *test)
>>>> +{
>>>> +	struct drm_modeset_acquire_ctx *ctx;
>>>> +	int ret;
>>>> +
>>>> +	ctx = kunit_kzalloc(test, sizeof(*ctx), GFP_KERNEL);
>>>> +	KUNIT_ASSERT_NOT_NULL(test, ctx);
>>>> +
>>>> +	drm_modeset_acquire_init(ctx, 0);
>>>> +
>>>> +	ret = kunit_add_action_or_reset(test,
>>>> +					action_drm_release_context,
>>>> +					ctx);
>>>> +	if (ret)
>>>> +		return ERR_PTR(ret);
>>>> +
>>>> +	return ctx;
>>>> +}
>>>> +EXPORT_SYMBOL_GPL(drm_kunit_helper_acquire_ctx_alloc);
>>>> +
>>> I think all of the patch inside this series are quite well.
>>>
>>> Personally, I can't find problems in it.
>>>
>>>
>>> But I still want to ask a question:
>>>
>>> Should the managed functions you introduced be prefixed with drmm_
>>> (instead of drm_) ?
>>>
>> That's a good question. But personally I think that the drmm_ prefix
>> should be reserved for drm_device managed resources and helpers.
> Yeah, to me drmm functions are meant for resources that are tied to the
> DRM device lifetime. These resources are tied to the test lifetime, so
> they shouldn't share the same prefix.


Okay then,

Thanks for reply.


>>> As mindless programmer may still want to call drm_modeset_acquire_fini()
>>> on the pointer returned by
>>>
>>> drm_kunit_helper_acquire_ctx_alloc()?
>>>
>> The function kernel-doc already mentions that there's no need to do that
>> and that will be done automatically by kunit. So shouldn't be different of
>> other functions helper where the programmer didn't read the documentation.
> Right
>
> Maxime

