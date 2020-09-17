Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5611826DD80
	for <lists+dri-devel@lfdr.de>; Thu, 17 Sep 2020 16:07:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93C156EC25;
	Thu, 17 Sep 2020 14:07:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C85CB6E13B
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Sep 2020 12:19:00 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id o5so1881396qke.12
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Sep 2020 05:19:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=bVH4jGgQihKj5QSekUnZ2zb+7aLw+KLxMSJUC/hbv48=;
 b=Fhg6lAOjlbLyEga2rG8pPURoI3htqOr2pKe+vNBAihwLsY1v7CQoxRX/649FEzDXL0
 39FqlveIvSVsbxnDqRrLJG066HQKp6GPqRPvv7sINamdCEVmQVcfibTDwqQ3GZ9hu48e
 bJWC0truOv3or+gTqYMGK8Nk/aI7LVNws/zxpIKCCcVnOEN096VUQVtTCuEGqpL/bs0b
 b7qBpYAC22kVivdgl0u4A8/znqNgMdzttibfzOG7nl4p+6OR1ajRt59PhYyeJJCeqC0/
 zbtfT2ps/ucVP4yscFeka54htZL+4FqrDY02jJyOzHv7rkq5iYcsVSz5CsB5kWcbLufb
 HzAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=bVH4jGgQihKj5QSekUnZ2zb+7aLw+KLxMSJUC/hbv48=;
 b=iwvb3DAPNm9XyBmxTEaTGwCvVeFaci+xrkz9kDEBDFEsOl+r9AK40rxj5RATbrOH6W
 iw6ctaPhb7Nd4JDLkZPd1YvM52Q2PvacFv9UdLpWgjHpTILujP8kp7eNsv+9ZumjFLhU
 urmo3TbxUZPw7fUzfOc1eC6Mz09I/LXsY7bs79EOt+/YupUb6tr2b+WqE7cR6rfWPde2
 AMOqBFn+8OEI9SEo1txNI/fGhHYXgva6NCtGRXMhTwVoG36+vIVAn52t6I3sn9E799PU
 +66/5ExKi6pEMW+CnjPGCdCNA3nHBFUedi+SnN90rntvXrtJaIpwYSTKb/cq5R5/LxLs
 slMQ==
X-Gm-Message-State: AOAM5330ugN0jIW7DvrS1VlilrTv5GWjGb66kdsEiZXJI1fjUmpTmRLV
 DwTb2PYkmAxgpoNtXawCRAFzaA==
X-Google-Smtp-Source: ABdhPJz0GJRdg0Id6c/JdQbGUXlRLa+Wdw0oKs6yW4L3DgyAUr2dNjQnoWL5C3nALl2/OucOloGmLA==
X-Received: by 2002:a05:620a:a45:: with SMTP id
 j5mr28227082qka.367.1600345139834; 
 Thu, 17 Sep 2020 05:18:59 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-48-30.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.48.30])
 by smtp.gmail.com with ESMTPSA id 145sm22054177qkf.18.2020.09.17.05.18.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Sep 2020 05:18:59 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1kIssM-000R84-9L; Thu, 17 Sep 2020 09:18:58 -0300
Date: Thu, 17 Sep 2020 09:18:58 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: christian.koenig@amd.com
Subject: Re: [Linaro-mm-sig] Changing vma->vm_file in dma_buf_mmap()
Message-ID: <20200917121858.GF8409@ziepe.ca>
References: <20200916095359.GD438822@phenom.ffwll.local>
 <20200916140710.GA8409@ziepe.ca>
 <8db2474f-ecb7-0e17-5f5b-145708fe44d5@amd.com>
 <CAKMK7uFdwrT3HACPh3ADAKvhXJ-Hf3dExZmgJVAQ1KKjSai_0w@mail.gmail.com>
 <aa953b09-53b1-104b-dc4b-156ad8a75e62@gmail.com>
 <CAKMK7uHJNRzCJfWVSmMrLmGXE0qo+OCXiMd+zPTOkeG2pnVrmQ@mail.gmail.com>
 <8d8693db-a3f0-4f5f-3e32-57d23ca620f8@amd.com>
 <CAKMK7uE=UqZD3PVC8XZAXrgGH-VsUF_-YQD3MLV8KK1kpxO4yQ@mail.gmail.com>
 <20200917113110.GE8409@ziepe.ca>
 <6fd74b84-959c-8b3b-c27b-e9fbf66396c7@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6fd74b84-959c-8b3b-c27b-e9fbf66396c7@gmail.com>
X-Mailman-Approved-At: Thu, 17 Sep 2020 14:07:28 +0000
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
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Linux MM <linux-mm@kvack.org>, Andrew Morton <akpm@linux-foundation.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBTZXAgMTcsIDIwMjAgYXQgMDI6MDM6NDhQTSArMDIwMCwgQ2hyaXN0aWFuIEvDtm5p
ZyB3cm90ZToKPiBBbSAxNy4wOS4yMCB1bSAxMzozMSBzY2hyaWViIEphc29uIEd1bnRob3JwZToK
PiA+IE9uIFRodSwgU2VwIDE3LCAyMDIwIGF0IDEwOjA5OjEyQU0gKzAyMDAsIERhbmllbCBWZXR0
ZXIgd3JvdGU6Cj4gPiAKPiA+ID4gWWVhaCwgYnV0IGl0IGRvZXNuJ3Qgd29yayB3aGVuIGZvcndh
cmRpbmcgZnJvbSB0aGUgZHJtIGNoYXJkZXYgdG8gdGhlCj4gPiA+IGRtYS1idWYgb24gdGhlIGlt
cG9ydGVyIHNpZGUsIHNpbmNlIHlvdSdkIG5lZWQgYSB0b24gb2YgZGlmZmVyZW50Cj4gPiA+IGFk
ZHJlc3Mgc3BhY2VzLiBBbmQgeW91IHN0aWxsIHJlbHkgb24gdGhlIGNvcmUgY29kZSBwaWNraW5n
IHVwIHlvdXIKPiA+ID4gcGdvZmYgbWFuZ2xpbmcsIHdoaWNoIGZlZWxzIGFib3V0IGFzIHJpc2t5
IHRvIG1lIGFzIHRoZSB2bWEgZmlsZQo+ID4gPiBwb2ludGVyIHdyYW5nbGluZyAtIGlmIGl0J3Mg
bm90IGNvbnNpc3RlbnRseSBhcHBsaWVkIHRoZSByZXZlcnNlIG1hcAo+ID4gPiBpcyB0b2FzdCBh
bmQgdW5tYXBfbWFwcGluZ19yYW5nZSBkb2Vzbid0IHdvcmsgY29ycmVjdGx5IGZvciBvdXIgbmVl
ZHMuCj4gPiBJIHdvdWxkIHRoaW5rIHRoZSBwZ29mZiBoYXMgdG8gYmUgdHJhbnNsYXRlZCBhdCB0
aGUgc2FtZSB0aW1lIHRoZQo+ID4gdm0tPnZtX2ZpbGUgaXMgY2hhbmdlZD8KPiA+IAo+ID4gVGhl
IG93bmVyIG9mIHRoZSBkbWFfYnVmIHNob3VsZCBoYXZlIG9uZSB2aXJ0dWFsIGFkZHJlc3Mgc3Bh
Y2UgYW5kIEZELAo+ID4gYWxsIGl0cyBkbWEgYnVmcyBzaG91bGQgYmUgbGlua2VkIHRvIGl0LCBh
bmQgYWxsIHBnb2ZmcyB0cmFuc2xhdGVkIHRvCj4gPiB0aGF0IHNwYWNlLgo+IAo+IFllYWgsIHRo
YXQgaXMgZXhhY3RseSBsaWtlIGFtZGdwdSBpcyBkb2luZyBpdC4KPiAKPiBHb2luZyB0byBkb2N1
bWVudCB0aGF0IHNvbWVob3cgd2hlbiBJJ20gZG9uZSB3aXRoIFRUTSBjbGVhbnVwcy4KCkJUVywg
d2hpbGUgcGVvcGxlIGFyZSBsb29raW5nIGF0IHRoaXMsIGlzIHRoZXJlIGEgd2F5IHRvIGdvIGZy
b20gYSBWTUEKdG8gYSBkbWFfYnVmIHRoYXQgb3ducyBpdD8KCkphc29uCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
