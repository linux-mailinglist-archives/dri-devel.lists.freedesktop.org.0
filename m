Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FE282C40AC
	for <lists+dri-devel@lfdr.de>; Wed, 25 Nov 2020 13:57:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DA556E991;
	Wed, 25 Nov 2020 12:57:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18F026E8BD;
 Wed, 25 Nov 2020 12:57:44 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id k4so2465741edl.0;
 Wed, 25 Nov 2020 04:57:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=TkCMhE6MscYlGdCksYjk0ow4TP437Mnx9Tw06Ae1F20=;
 b=to5U4lOKGJlPytNYaoa1L11Az/KiJVA3V2jWUBwzSpIQV/XuLyASMz+1ZJNbVsVNgT
 TiDTQOczz0aG1bt+tMwGwli5TDNjVb6fq7Ir7IYHnDoTtWx0MYJZ73lIlgp71tyEJ1Dw
 HzMiGlwLplX7GO1/fR12U9izQo+PgrmsaGjCbv5tIMjklXwrJXkgbHhi0QK9A19SVQV/
 jeQOjsJn6HaBbnSC5a4Wd1sLyMg8VobvcvsBXos4pdAYdcQeJSRNNFuuiTbcarxOmSBB
 MVbElFApLR1CIR9g5WkziY6zN7AjSz52RFmGoyznN9GzT9HX72pgBzhC/vMv5ASE99T7
 xwlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=TkCMhE6MscYlGdCksYjk0ow4TP437Mnx9Tw06Ae1F20=;
 b=C/uQh0iSFqouIxOf+W11wYLafrtaai9600FfyOl8cksWtxWSl12lsY5fdAwasXpQz1
 AtaXfDfgeFnr132VtWOifqUR69hC1GER9XmrUg06N0KB9bHLO3MimTWSFsKdxFCHChSi
 t2Aa6tYByKA+U70Hul7CZE1ouyP/+OCVz1l5ljb4cdc50eqtHR/DVz8XYz2EssTVzSSj
 XcP9JQJ0n9CucgoLAYrF1CWZZUwUDDirG/hiioovfqjTSS7gu10SucHdpaex0lk7Zk6/
 ufDdj6Chc962+cOvd0/y6Gd2Aa/wwlNap1u/m6H+gp8ZOq4G5DnYGiHCXBaoHPzAnZY8
 CJYA==
X-Gm-Message-State: AOAM532dvXNJSKgrOJLVODvPBxEdTssPSpx2cJDSvWU2FoJ3kqX/kGzT
 WTH+DH6DvJ/6Y0wfC5csxXQ=
X-Google-Smtp-Source: ABdhPJxROM/bCcgqrEF9CAk2FAtjUZqJWX8YIannw/V/24UEdvmAwIAJ98YQ36JxeduRohsvZBsi9A==
X-Received: by 2002:a05:6402:1245:: with SMTP id
 l5mr3352702edw.68.1606309062677; 
 Wed, 25 Nov 2020 04:57:42 -0800 (PST)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id a9sm1217239eds.50.2020.11.25.04.57.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Nov 2020 04:57:42 -0800 (PST)
Subject: Re: [PATCH v3 05/12] drm/ttm: Expose ttm_tt_unpopulate for driver use
To: Daniel Vetter <daniel@ffwll.ch>, christian.koenig@amd.com
References: <1605936082-3099-6-git-send-email-andrey.grodzovsky@amd.com>
 <28332cf0-612c-10bd-c64e-fff6e1f18653@gmail.com>
 <320ff94c-78f4-b9a5-4c6f-40f7ce162bd3@amd.com>
 <41b35672-2dd6-13e2-8383-c65279fdb648@gmail.com>
 <e2f4f1dc-2a2a-face-87b2-6d61ed7d3305@amd.com>
 <01280cba-56b8-77c6-b40f-d7e69a5ad4c6@amd.com>
 <0ceca974-80f8-feb3-d5e9-5182f35bb2c4@amd.com>
 <20288c45-270c-3ed7-2ac4-eeb6e5c50776@amd.com>
 <2df98c1a-8ed4-fb87-f8f7-e3962e8d9c52@amd.com>
 <041210e5-e237-b72e-dcbc-17027d057c55@gmail.com>
 <20201125104021.GV401619@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <71683ae7-f443-c15a-7003-6ba4ad3d4b15@gmail.com>
Date: Wed, 25 Nov 2020 13:57:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201125104021.GV401619@phenom.ffwll.local>
Content-Language: en-US
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
Reply-To: christian.koenig@amd.com
Cc: daniel.vetter@ffwll.ch, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, gregkh@linuxfoundation.org,
 Alexander.Deucher@amd.com, yuq825@gmail.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjUuMTEuMjAgdW0gMTE6NDAgc2NocmllYiBEYW5pZWwgVmV0dGVyOgo+IE9uIFR1ZSwgTm92
IDI0LCAyMDIwIGF0IDA1OjQ0OjA3UE0gKzAxMDAsIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6Cj4+
IEFtIDI0LjExLjIwIHVtIDE3OjIyIHNjaHJpZWIgQW5kcmV5IEdyb2R6b3Zza3k6Cj4+PiBPbiAx
MS8yNC8yMCAyOjQxIEFNLCBDaHJpc3RpYW4gS8O2bmlnIHdyb3RlOgo+Pj4+IEFtIDIzLjExLjIw
IHVtIDIyOjA4IHNjaHJpZWIgQW5kcmV5IEdyb2R6b3Zza3k6Cj4+Pj4+IE9uIDExLzIzLzIwIDM6
NDEgUE0sIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6Cj4+Pj4+PiBBbSAyMy4xMS4yMCB1bSAyMToz
OCBzY2hyaWViIEFuZHJleSBHcm9kem92c2t5Ogo+Pj4+Pj4+IE9uIDExLzIzLzIwIDM6MjAgUE0s
IENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6Cj4+Pj4+Pj4+IEFtIDIzLjExLjIwIHVtIDIxOjA1IHNj
aHJpZWIgQW5kcmV5IEdyb2R6b3Zza3k6Cj4+Pj4+Pj4+PiBPbiAxMS8yNS8yMCA1OjQyIEFNLCBD
aHJpc3RpYW4gS8O2bmlnIHdyb3RlOgo+Pj4+Pj4+Pj4+IEFtIDIxLjExLjIwIHVtIDA2OjIxIHNj
aHJpZWIgQW5kcmV5IEdyb2R6b3Zza3k6Cj4+Pj4+Pj4+Pj4+IEl0J3MgbmVlZGVkIHRvIGRyb3Ag
aW9tbXUgYmFja2VkIHBhZ2VzIG9uIGRldmljZSB1bnBsdWcKPj4+Pj4+Pj4+Pj4gYmVmb3JlIGRl
dmljZSdzIElPTU1VIGdyb3VwIGlzIHJlbGVhc2VkLgo+Pj4+Pj4+Pj4+IEl0IHdvdWxkIGJlIGNs
ZWFuZXIgaWYgd2UgY291bGQgZG8gdGhlIHdob2xlCj4+Pj4+Pj4+Pj4gaGFuZGxpbmcgaW4gVFRN
LiBJIGFsc28gbmVlZCB0byBkb3VibGUgY2hlY2sKPj4+Pj4+Pj4+PiB3aGF0IHlvdSBhcmUgZG9p
bmcgd2l0aCB0aGlzIGZ1bmN0aW9uLgo+Pj4+Pj4+Pj4+Cj4+Pj4+Pj4+Pj4gQ2hyaXN0aWFuLgo+
Pj4+Pj4+Pj4KPj4+Pj4+Pj4+IENoZWNrIHBhdGNoICJkcm0vYW1kZ3B1OiBSZWdpc3RlciBJT01N
VSB0b3BvbG9neQo+Pj4+Pj4+Pj4gbm90aWZpZXIgcGVyIGRldmljZS4iIHRvIHNlZQo+Pj4+Pj4+
Pj4gaG93IGkgdXNlIGl0LiBJIGRvbid0IHNlZSB3aHkgdGhpcyBzaG91bGQgZ28KPj4+Pj4+Pj4+
IGludG8gVFRNIG1pZC1sYXllciAtIHRoZSBzdHVmZiBJIGRvIGluc2lkZQo+Pj4+Pj4+Pj4gaXMg
dmVuZG9yIHNwZWNpZmljIGFuZCBhbHNvIEkgZG9uJ3QgdGhpbmsgVFRNIGlzCj4+Pj4+Pj4+PiBl
eHBsaWNpdGx5IGF3YXJlIG9mIElPTU1VID8KPj4+Pj4+Pj4+IERvIHlvdSBtZWFuIHlvdSBwcmVm
ZXIgdGhlIElPTU1VIG5vdGlmaWVyIHRvIGJlCj4+Pj4+Pj4+PiByZWdpc3RlcmVkIGZyb20gd2l0
aGluIFRUTQo+Pj4+Pj4+Pj4gYW5kIHRoZW4gdXNlIGEgaG9vayB0byBjYWxsIGludG8gdmVuZG9y
IHNwZWNpZmljIGhhbmRsZXIgPwo+Pj4+Pj4+PiBObywgdGhhdCBpcyByZWFsbHkgdmVuZG9yIHNw
ZWNpZmljLgo+Pj4+Pj4+Pgo+Pj4+Pj4+PiBXaGF0IEkgbWVhbnQgaXMgdG8gaGF2ZSBhIGZ1bmN0
aW9uIGxpa2UKPj4+Pj4+Pj4gdHRtX3Jlc291cmNlX21hbmFnZXJfZXZpY3RfYWxsKCkgd2hpY2gg
eW91IG9ubHkgbmVlZAo+Pj4+Pj4+PiB0byBjYWxsIGFuZCBhbGwgdHQgb2JqZWN0cyBhcmUgdW5w
b3B1bGF0ZWQuCj4+Pj4+Pj4KPj4+Pj4+PiBTbyBpbnN0ZWFkIG9mIHRoaXMgQk8gbGlzdCBpIGNy
ZWF0ZSBhbmQgbGF0ZXIgaXRlcmF0ZSBpbgo+Pj4+Pj4+IGFtZGdwdSBmcm9tIHRoZSBJT01NVSBw
YXRjaCB5b3UganVzdCB3YW50IHRvIGRvIGl0Cj4+Pj4+Pj4gd2l0aGluCj4+Pj4+Pj4gVFRNIHdp
dGggYSBzaW5nbGUgZnVuY3Rpb24gPyBNYWtlcyBtdWNoIG1vcmUgc2Vuc2UuCj4+Pj4+PiBZZXMs
IGV4YWN0bHkuCj4+Pj4+Pgo+Pj4+Pj4gVGhlIGxpc3RfZW1wdHkoKSBjaGVja3Mgd2UgaGF2ZSBp
biBUVE0gZm9yIHRoZSBMUlUgYXJlCj4+Pj4+PiBhY3R1YWxseSBub3QgdGhlIGJlc3QgaWRlYSwg
d2Ugc2hvdWxkIG5vdyBjaGVjayB0aGUKPj4+Pj4+IHBpbl9jb3VudCBpbnN0ZWFkLiBUaGlzIHdh
eSB3ZSBjb3VsZCBhbHNvIGhhdmUgYSBsaXN0IG9mIHRoZQo+Pj4+Pj4gcGlubmVkIEJPcyBpbiBU
VE0uCj4+Pj4+Cj4+Pj4+IFNvIGZyb20gbXkgSU9NTVUgdG9wb2xvZ3kgaGFuZGxlciBJIHdpbGwg
aXRlcmF0ZSB0aGUgVFRNIExSVSBmb3IKPj4+Pj4gdGhlIHVucGlubmVkIEJPcyBhbmQgdGhpcyBu
ZXcgZnVuY3Rpb24gZm9yIHRoZSBwaW5uZWQgb25lc8KgID8KPj4+Pj4gSXQncyBwcm9iYWJseSBh
IGdvb2QgaWRlYSB0byBjb21iaW5lIGJvdGggaXRlcmF0aW9ucyBpbnRvIHRoaXMKPj4+Pj4gbmV3
IGZ1bmN0aW9uIHRvIGNvdmVyIGFsbCB0aGUgQk9zIGFsbG9jYXRlZCBvbiB0aGUgZGV2aWNlLgo+
Pj4+IFllcywgdGhhdCdzIHdoYXQgSSBoYWQgaW4gbXkgbWluZCBhcyB3ZWxsLgo+Pj4+Cj4+Pj4+
Cj4+Pj4+PiBCVFc6IEhhdmUgeW91IHRob3VnaHQgYWJvdXQgd2hhdCBoYXBwZW5zIHdoZW4gd2Ug
dW5wb3B1bGF0ZQo+Pj4+Pj4gYSBCTyB3aGlsZSB3ZSBzdGlsbCB0cnkgdG8gdXNlIGEga2VybmVs
IG1hcHBpbmcgZm9yIGl0PyBUaGF0Cj4+Pj4+PiBjb3VsZCBoYXZlIHVuZm9yZXNlZW4gY29uc2Vx
dWVuY2VzLgo+Pj4+Pgo+Pj4+PiBBcmUgeW91IGFza2luZyB3aGF0IGhhcHBlbnMgdG8ga21hcCBv
ciB2bWFwIHN0eWxlIG1hcHBlZCBDUFUKPj4+Pj4gYWNjZXNzZXMgb25jZSB3ZSBkcm9wIGFsbCB0
aGUgRE1BIGJhY2tpbmcgcGFnZXMgZm9yIGEgcGFydGljdWxhcgo+Pj4+PiBCTyA/IEJlY2F1c2Ug
Zm9yIHVzZXIgbWFwcGluZ3MKPj4+Pj4gKG1tYXApIHdlIHRvb2sgY2FyZSBvZiB0aGlzIHdpdGgg
ZHVtbXkgcGFnZSByZXJvdXRlIGJ1dCBpbmRlZWQKPj4+Pj4gbm90aGluZyB3YXMgZG9uZSBmb3Ig
aW4ga2VybmVsIENQVSBtYXBwaW5ncy4KPj4+PiBZZXMgZXhhY3RseSB0aGF0Lgo+Pj4+Cj4+Pj4g
SW4gb3RoZXIgd29yZHMgd2hhdCBoYXBwZW5zIGlmIHdlIGZyZWUgdGhlIHJpbmcgYnVmZmVyIHdo
aWxlIHRoZQo+Pj4+IGtlcm5lbCBzdGlsbCB3cml0ZXMgdG8gaXQ/Cj4+Pj4KPj4+PiBDaHJpc3Rp
YW4uCj4+Pgo+Pj4gV2hpbGUgd2UgY2FuJ3QgY29udHJvbCB1c2VyIGFwcGxpY2F0aW9uIGFjY2Vz
c2VzIHRvIHRoZSBtYXBwZWQgYnVmZmVycwo+Pj4gZXhwbGljaXRseSBhbmQgaGVuY2Ugd2UgdXNl
IHBhZ2UgZmF1bHQgcmVyb3V0aW5nCj4+PiBJIGFtIHRoaW5raW5nIHRoYXQgaW4gdGhpc8KgIGNh
c2Ugd2UgbWF5IGJlIGFibGUgdG8gc3ByaW5rbGUKPj4+IGRybV9kZXZfZW50ZXIvZXhpdCBpbiBh
bnkgc3VjaCBzZW5zaXRpdmUgcGxhY2Ugd2VyZSB3ZSBtaWdodAo+Pj4gQ1BVIGFjY2VzcyBhIERN
QSBidWZmZXIgZnJvbSB0aGUga2VybmVsID8KPj4gWWVzLCBJIGZlYXIgd2UgYXJlIGdvaW5nIHRv
IG5lZWQgdGhhdC4KPiBVaCAuLi4gcHJvYmxlbSBpcyB0aGF0IGRtYV9idWZfdm1hcCBhcmUgdXN1
YWxseSBwZXJtYW5lbnQgdGhpbmdzLiBNYXliZSB3ZQo+IGNvdWxkIHN0dWZmIHRoaXMgaW50byBi
ZWdpbi9lbmRfY3B1X2FjY2VzcyAoYnV0IG9ubHkgZm9yIHRoZSBrZXJuZWwsIHNvIGEKPiBiaXQg
dHJpY2t5KT8KCk9oIHZlcnkgdmVyeSBnb29kIHBvaW50ISBJIGhhdmVuJ3QgdGhvdWdodCBhYm91
dCBETUEtYnVmIG1tYXBzIGluIHRoaXMgCmNvbnRleHQgeWV0LgoKCj4gYnR3IHRoZSBvdGhlciBp
c3N1ZSB3aXRoIGRtYS1idWYgKGFuZCBldmVuIHdvcnNlIHdpdGggZG1hX2ZlbmNlKSBpcwo+IHJl
ZmNvdW50aW5nIG9mIHRoZSB1bmRlcmx5aW5nIGRybV9kZXZpY2UuIEknZCBleHBlY3QgdGhhdCBh
bGwgeW91cgo+IGNhbGxiYWNrcyBnbyBib29tIGlmIHRoZSBkbWFfYnVmIG91dGxpdmVzIHlvdXIg
ZHJtX2RldmljZS4gVGhhdCBwYXJ0IGlzbid0Cj4geWV0IHNvbHZlZCBpbiB5b3VyIHNlcmllcyBo
ZXJlLgoKV2VsbCB0aGlua2luZyBtb3JlIGFib3V0IHRoaXMsIGl0IHNlZW1zIHRvIGJlIGEgYW5v
dGhlciByZWFsbHkgZ29vZCAKYXJndW1lbnQgd2h5IG1hcHBpbmcgcGFnZXMgZnJvbSBETUEtYnVm
cyBpbnRvIGFwcGxpY2F0aW9uIGFkZHJlc3Mgc3BhY2UgCmRpcmVjdGx5IGlzIGEgdmVyeSBiYWQg
aWRlYSA6KQoKQnV0IHllcywgd2UgZXNzZW50aWFsbHkgY2FuJ3QgcmVtb3ZlIHRoZSBkZXZpY2Ug
YXMgbG9uZyBhcyB0aGVyZSBpcyBhIApETUEtYnVmIHdpdGggbWFwcGluZ3MuIE5vIGlkZWEgaG93
IHRvIGNsZWFuIHRoYXQgb25lIHVwLgoKQ2hyaXN0aWFuLgoKPiAtRGFuaWVsCj4KPj4+IFRoaW5n
cyBsaWtlIENQVSBwYWdlIHRhYmxlIHVwZGF0ZXMsIHJpbmcgYnVmZmVyIGFjY2Vzc2VzIGFuZCBG
VyBtZW1jcHkgPwo+Pj4gSXMgdGhlcmUgb3RoZXIgcGxhY2VzID8KPj4gUHVoLCBnb29kIHF1ZXN0
aW9uLiBJIGhhdmUgbm8gaWRlYS4KPj4KPj4+IEFub3RoZXIgcG9pbnQgaXMgdGhhdCBhdCB0aGlz
IHBvaW50IHRoZSBkcml2ZXIgc2hvdWxkbid0IGFjY2VzcyBhbnkgc3VjaAo+Pj4gYnVmZmVycyBh
cyB3ZSBhcmUgYXQgdGhlIHByb2Nlc3MgZmluaXNoaW5nIHRoZSBkZXZpY2UuCj4+PiBBRkFJSyB0
aGVyZSBpcyBubyBwYWdlIGZhdWx0IG1lY2hhbmlzbSBmb3Iga2VybmVsIG1hcHBpbmdzIHNvIEkg
ZG9uJ3QKPj4+IHRoaW5rIHRoZXJlIGlzIGFueXRoaW5nIGVsc2UgdG8gZG8gPwo+PiBXZWxsIHRo
ZXJlIGlzIGEgcGFnZSBmYXVsdCBoYW5kbGVyIGZvciBrZXJuZWwgbWFwcGluZ3MsIGJ1dCB0aGF0
IG9uZSBqdXN0Cj4+IHByaW50cyB0aGUgc3RhY2sgdHJhY2UgaW50byB0aGUgc3lzdGVtIGxvZyBh
bmQgY2FsbHMgQlVHKCk7IDopCj4+Cj4+IExvbmcgc3Rvcnkgc2hvcnQgd2UgbmVlZCB0byBhdm9p
ZCBhbnkgYWNjZXNzIHRvIHJlbGVhc2VkIHBhZ2VzIGFmdGVyIHVucGx1Zy4KPj4gTm8gbWF0dGVy
IGlmIGl0J3MgZnJvbSB0aGUga2VybmVsIG9yIHVzZXJzcGFjZS4KPj4KPj4gUmVnYXJkcywKPj4g
Q2hyaXN0aWFuLgo+Pgo+Pj4gQW5kcmV5CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWwK
