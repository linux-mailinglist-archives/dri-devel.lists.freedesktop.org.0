Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F71139F2B0
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jun 2021 11:43:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70E736EB82;
	Tue,  8 Jun 2021 09:43:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 373 seconds by postgrey-1.36 at gabe;
 Tue, 08 Jun 2021 09:43:29 UTC
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B42E16EB82
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Jun 2021 09:43:29 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20210608093714euoutp012397148f3239f009f7af954aa6bb4b3a~Gkc8ykFhz1434014340euoutp015
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Jun 2021 09:37:14 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20210608093714euoutp012397148f3239f009f7af954aa6bb4b3a~Gkc8ykFhz1434014340euoutp015
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1623145034;
 bh=wsEjWU0qsU04tvYh6SGUhwy6yYWs5+wf8v9dCBxlicw=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=KSeuEJ7Xdj4WjYrgbAV/lqXS2Jzlmh9W32TuAmqRHRaJEYunXejotffugPtfkGBI9
 vwb0QJG7ItZpxg7DAw+XZxPXvU9Y3qbm/1VVVLgwwpzejRdfP2I22Lw3bmPVJvL3UA
 MiEOkcttALvkE27+y85LEnlQHnkPF2n/5LDeGvw0=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20210608093714eucas1p1c710163fb668a40c64e7acc4e2db4482~Gkc8YJqJF2909929099eucas1p1h;
 Tue,  8 Jun 2021 09:37:14 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id E6.79.09444.A4A3FB06; Tue,  8
 Jun 2021 10:37:14 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20210608093713eucas1p1f80bd23f2361de5c86440c1153d3c99b~Gkc70O_OD1048510485eucas1p1Y;
 Tue,  8 Jun 2021 09:37:13 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20210608093713eusmtrp13769ec15bed28af3f19d003dbe01b827~Gkc7zPcqz2077520775eusmtrp1u;
 Tue,  8 Jun 2021 09:37:13 +0000 (GMT)
X-AuditID: cbfec7f4-dbdff700000024e4-8f-60bf3a4a4b3e
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 70.35.08705.94A3FB06; Tue,  8
 Jun 2021 10:37:13 +0100 (BST)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20210608093713eusmtip1b0cb1e253e6570be2a78da65fc468548~Gkc7JWX4t2099420994eusmtip1L;
 Tue,  8 Jun 2021 09:37:12 +0000 (GMT)
Subject: Re: [PATCH] drm/vc4: fix vc4_atomic_commit_tail() logic
To: Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
From: Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <7255595b-d85b-7f5c-7a77-c5e8f9cb9395@samsung.com>
Date: Tue, 8 Jun 2021 11:37:12 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <20210608085513.2069-1-mark.rutland@arm.com>
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrCKsWRmVeSWpSXmKPExsWy7djPc7peVvsTDO71C1j0njvJZPF30jF2
 i/fLehgt/m+byGxx5et7Nou5+x4wWWx6fI3V4vKuOWwWS69fZLKY8eMfo0XLHVMHbo+m98fY
 PNbMW8Po8fvXJEaPO+fOs3ns/baAxWPTqk42j+3fHrB63O8+zuSxeUm9x+dNcgFcUVw2Kak5
 mWWpRfp2CVwZJ9bNZi/Yqlpx5sccpgbGJ3JdjBwcEgImEh+3BncxcnEICaxglDj55xAThPOF
 UeLNwZusXYycQM5nRonfXVkgNkjDzv3LGSGKljNKPJ/9mRGi6COjxL/rESBThQUcJDq3V4CY
 IgK5EucfpYCUMwvMYJJ48uMX2Ew2AUOJrrddbCA2r4CdxMynT1hAbBYBFYmHi/ewgvSKCiRL
 /N6oC1EiKHFyJkQJp4ClxKWJa9lBbGYBeYntb+cwQ9jiEreezAe7X0JgPqfE9e07WCCedJE4
 2scOcb6wxKvjW6BsGYnTk3tYIOqbGSUengMZCuL0MEpcbprBCFFlLXHn3C82kEHMApoS63fp
 Q4QdJVpfvGeFmM8nceOtIMQNfBKTtk1nhgjzSnS0CUFUq0nMOr4Obu3BC5eYJzAqzULy2Swk
 38xC8s0shL0LGFlWMYqnlhbnpqcWG+WllusVJ+YWl+al6yXn525iBCa00/+Of9nBuPzVR71D
 jEwcjIcYJTiYlUR4ywz3JQjxpiRWVqUW5ccXleakFh9ilOZgURLnTdqyJl5IID2xJDU7NbUg
 tQgmy8TBKdXAtOIXd9SbfQqibmscS35wLL703DLfZdnfDJ5yvzlpLkuUJlYfM9G9USMgHp9S
 l3ZgoiTz31x5lpn/lj61E+M06MvZ8e4TU5H/Js0nHVsV6xg3Cb5n4V1wRjM123H2ClEl2QsH
 r0v0W3gELNeIfCB9mcFRxGzChnJ7/dtNtuJOMjsSLueyMPB462xoyzgrt752nY/SqnpNcWvW
 TWk9LlXXtNRFnpTEr53hpZVk2qawxKNKW3v9vqsWR/lqk7XUnl79ts3p+eawj+c5RDb7hHx8
 Gtd18MIC48uqk1hk42rZbgTNeXJbrbz/uoLIz3W3swrfimqorTt5UuHbm08cr5prrH7zKPoc
 nMNRJaDl8FWJpTgj0VCLuag4EQCpALkP1wMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrFIsWRmVeSWpSXmKPExsVy+t/xu7qeVvsTDB7c0bToPXeSyeLvpGPs
 Fu+X9TBa/N82kdniytf3bBZz9z1gstj0+BqrxeVdc9gsll6/yGQx48c/RouWO6YO3B5N74+x
 eayZt4bR4/evSYwed86dZ/PY+20Bi8emVZ1sHtu/PWD1uN99nMlj85J6j8+b5AK4ovRsivJL
 S1IVMvKLS2yVog0tjPQMLS30jEws9QyNzWOtjEyV9O1sUlJzMstSi/TtEvQyTqybzV6wVbXi
 zI85TA2MT+S6GDk5JARMJHbuX87YxcjFISSwlFFi3p8eFoiEjMTJaQ2sELawxJ9rXWwQRe8Z
 JV6c/cXUxcjBISzgING5vQLEFBHIlXiyNAmkhFlgGpPE+iuHwOYICVhI9E07wgZiswkYSnS9
 7QKzeQXsJGY+fQJWwyKgIvFw8R6wXaICyRIb2v+zQtQISpycCVHDKWApcWniWnYQm1nATGLe
 5ofMELa8xPa3c6BscYlbT+YzTWAUmoWkfRaSlllIWmYhaVnAyLKKUSS1tDg3PbfYUK84Mbe4
 NC9dLzk/dxMjMJK3Hfu5eQfjvFcf9Q4xMnEwHmKU4GBWEuEtM9yXIMSbklhZlVqUH19UmpNa
 fIjRFOificxSosn5wFSSVxJvaGZgamhiZmlgamlmrCTOu3XumnghgfTEktTs1NSC1CKYPiYO
 TqkGph06HbLuYgIzXVe9abf99Dgueeq/3Y6SoiZlbdxvHwpaHFp9clfd3cKDnLs+nTtku730
 zxKLkvQjYi/cJe9cn3He2tq2aPU/VyG9W89ebJeMny+976zF3b0OJsl3t19Q9P4afXSe2MaZ
 fWwxZSIhTUasEat6uttmOK6VYzdxzjv35XlYwTxL1TsHFk9J8lzaM8fN0VpaM3vf+atNl5i+
 KTFwJkyd23x02WXNL/OWCwQe/qRyZP8TlwevEp3/aDF2bNn/oXpb+eGPD/eGK1+XvlDw98d5
 iczyRfH6VjINlck+M47n/AqcJ5lt0bT6x36DvZdmzXSfsT512iKD5McTmkReSSs3uG5RP/55
 l5KTOr8SS3FGoqEWc1FxIgBjjW+dbQMAAA==
X-CMS-MailID: 20210608093713eucas1p1f80bd23f2361de5c86440c1153d3c99b
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20210608093713eucas1p1f80bd23f2361de5c86440c1153d3c99b
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20210608093713eucas1p1f80bd23f2361de5c86440c1153d3c99b
References: <20210608085513.2069-1-mark.rutland@arm.com>
 <CGME20210608093713eucas1p1f80bd23f2361de5c86440c1153d3c99b@eucas1p1.samsung.com>
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
Cc: Emma Anholt <emma@anholt.net>, Arnd Bergmann <arnd@arndb.de>,
 David Airlie <airlied@linux.ie>, Catalin Marinas <catalin.marinas@arm.com>,
 dri-devel@lists.freedesktop.org, Maxime Ripard <maxime@cerno.tech>,
 Will Deacon <will@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 08.06.2021 10:55, Mark Rutland wrote:
> In vc4_atomic_commit_tail() we iterate of the set of old CRTCs, and
> attempt to wait on any channels which are still in use. When we iterate
> over the CRTCs, we have:
>
> * `i` - the index of the CRTC
> * `channel` - the channel a CRTC is using
>
> When we check the channel state, we consult:
>
>    old_hvs_state->fifo_state[channel].in_use
>
> ... but when we wait for the channel, we erroneously wait on:
>
>    old_hvs_state->fifo_state[i].pending_commit
>
> ... rather than:
>
>     old_hvs_state->fifo_state[channel].pending_commit
>
> ... and this bogus access has been observed to result in boot-time hangs
> on some arm64 configurations, and can be detected using KASAN. FIx this
> by using the correct index.
>
> I've tested this on a Raspberry Pi 3 model B v1.2 with KASAN.
>
> Trimmed KASAN splat:
>
> | ==================================================================
> | BUG: KASAN: slab-out-of-bounds in vc4_atomic_commit_tail+0x1cc/0x910
> | Read of size 8 at addr ffff000007360440 by task kworker/u8:0/7
> | CPU: 2 PID: 7 Comm: kworker/u8:0 Not tainted 5.13.0-rc3-00009-g694c523e7267 #3
> |
> | Hardware name: Raspberry Pi 3 Model B (DT)
> | Workqueue: events_unbound deferred_probe_work_func
> | Call trace:
> |  dump_backtrace+0x0/0x2b4
> |  show_stack+0x1c/0x30
> |  dump_stack+0xfc/0x168
> |  print_address_description.constprop.0+0x2c/0x2c0
> |  kasan_report+0x1dc/0x240
> |  __asan_load8+0x98/0xd4
> |  vc4_atomic_commit_tail+0x1cc/0x910
> |  commit_tail+0x100/0x210
> | ...
> |
> | Allocated by task 7:
> |  kasan_save_stack+0x2c/0x60
> |  __kasan_kmalloc+0x90/0xb4
> |  vc4_hvs_channels_duplicate_state+0x60/0x1a0
> |  drm_atomic_get_private_obj_state+0x144/0x230
> |  vc4_atomic_check+0x40/0x73c
> |  drm_atomic_check_only+0x998/0xe60
> |  drm_atomic_commit+0x34/0x94
> |  drm_client_modeset_commit_atomic+0x2f4/0x3a0
> |  drm_client_modeset_commit_locked+0x8c/0x230
> |  drm_client_modeset_commit+0x38/0x60
> |  drm_fb_helper_set_par+0x104/0x17c
> |  fbcon_init+0x43c/0x970
> |  visual_init+0x14c/0x1e4
> | ...
> |
> | The buggy address belongs to the object at ffff000007360400
> |  which belongs to the cache kmalloc-128 of size 128
> | The buggy address is located 64 bytes inside of
> |  128-byte region [ffff000007360400, ffff000007360480)
> | The buggy address belongs to the page:
> | page:(____ptrval____) refcount:1 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x7360
> | flags: 0x3fffc0000000200(slab|node=0|zone=0|lastcpupid=0xffff)
> | raw: 03fffc0000000200 dead000000000100 dead000000000122 ffff000004c02300
> | raw: 0000000000000000 0000000000100010 00000001ffffffff 0000000000000000
> | page dumped because: kasan: bad access detected
> |
> | Memory state around the buggy address:
> |  ffff000007360300: fa fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
> |  ffff000007360380: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
> | >ffff000007360400: 00 00 00 00 00 00 00 fc fc fc fc fc fc fc fc fc
> |                                            ^
> |  ffff000007360480: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
> |  ffff000007360500: fa fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
> | ==================================================================
>
> Link: https://lore.kernel.org/r/4d0c8318-bad8-2be7-e292-fc8f70c198de@samsung.com
> Link: https://lore.kernel.org/linux-arm-kernel/20210607151740.moncryl5zv3ahq4s@gilmour
> Signed-off-by: Mark Rutland <mark.rutland@arm.com>
> Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Emma Anholt <emma@anholt.net>
> Cc: Maxime Ripard <maxime@cerno.tech>
> Cc: Will Deacon <will@kernel.org>
> Cc: dri-devel@lists.freedesktop.org
Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>   drivers/gpu/drm/vc4/vc4_kms.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/vc4/vc4_kms.c b/drivers/gpu/drm/vc4/vc4_kms.c
> index bb5529a7a9c2..948b3a58aad1 100644
> --- a/drivers/gpu/drm/vc4/vc4_kms.c
> +++ b/drivers/gpu/drm/vc4/vc4_kms.c
> @@ -372,7 +372,7 @@ static void vc4_atomic_commit_tail(struct drm_atomic_state *state)
>   		if (!old_hvs_state->fifo_state[channel].in_use)
>   			continue;
>   
> -		ret = drm_crtc_commit_wait(old_hvs_state->fifo_state[i].pending_commit);
> +		ret = drm_crtc_commit_wait(old_hvs_state->fifo_state[channel].pending_commit);
>   		if (ret)
>   			drm_err(dev, "Timed out waiting for commit\n");
>   	}

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

