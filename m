Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 738322D72F0
	for <lists+dri-devel@lfdr.de>; Fri, 11 Dec 2020 10:37:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C14C6ED03;
	Fri, 11 Dec 2020 09:37:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ste-pvt-msa2.bahnhof.se (ste-pvt-msa2.bahnhof.se
 [213.80.101.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16FD86ED03
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Dec 2020 09:37:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTP id 256CD3F672;
 Fri, 11 Dec 2020 10:36:53 +0100 (CET)
Authentication-Results: ste-pvt-msa2.bahnhof.se; dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=fetPxTN+; 
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.1
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 URIBL_BLOCKED=0.001] autolearn=ham autolearn_force=no
Authentication-Results: ste-ftg-msa2.bahnhof.se (amavisd-new);
 dkim=pass (1024-bit key) header.d=shipmail.org
Received: from ste-pvt-msa2.bahnhof.se ([127.0.0.1])
 by localhost (ste-ftg-msa2.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QD65P9756AlI; Fri, 11 Dec 2020 10:36:52 +0100 (CET)
Received: by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id BA6643F3BF;
 Fri, 11 Dec 2020 10:36:51 +0100 (CET)
Received: from [10.252.11.189] (unknown [192.198.151.44])
 by mail1.shipmail.org (Postfix) with ESMTPSA id C9D21360076;
 Fri, 11 Dec 2020 10:37:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1607679435; bh=Jjy1M+f0vJYDqrpGouHpavKapGnF4ltjQB2kfsW6f2U=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=fetPxTN+6OmMKsY8wqsUvDCtkhlw+W1Zlm3zyEwPC4vun4C2iUtEjga6z+iO8qZgF
 Hn6h5afS5uHph6BXm8rNiFVv3iYwm/HxQYISGdRjjQikQuPIdrhNy/a+gHx1Nyxjxt
 icFSqvLGzJ6uUcHvBtKd8mwejw5RGtFuICaakzx4=
Subject: Re: Fence wait in mmu_interval_notifier_ops::invalidate
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Jason Gunthorpe <jgg@nvidia.com>
References: <912c29f1-4e17-8b66-419b-1854d03845fd@shipmail.org>
 <20201209163731.GU552508@nvidia.com>
 <b4018af1-998f-dc79-c83a-8eac95cb1ceb@shipmail.org>
 <1b52322f-569e-f523-3baa-ffb822cb72c2@amd.com>
 <7be4d61e-c82f-6acf-a618-9db29d05094a@shipmail.org>
 <806af8e8-7dfb-bdbb-0d68-c2229dd88b40@amd.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>
Message-ID: <de9e1d60-347b-7246-22a5-135c4b01eb23@shipmail.org>
Date: Fri, 11 Dec 2020 10:37:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <806af8e8-7dfb-bdbb-0d68-c2229dd88b40@amd.com>
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
Cc: DRI Development <dri-devel@lists.freedesktop.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDEyLzExLzIwIDk6NTcgQU0sIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6Cj4gQW0gMTEuMTIu
MjAgdW0gMDg6NTAgc2NocmllYiBUaG9tYXMgSGVsbHN0csO2bSAoSW50ZWwpOgo+PiBIaSwgQ2hy
aXN0aWFuCj4+Cj4+IFRoYW5rcyBmb3IgdGhlIHJlcGx5Lgo+Pgo+PiBPbiAxMi8xMC8yMCAxMTo1
MyBBTSwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToKPj4+IEFtIDA5LjEyLjIwIHVtIDE3OjQ2IHNj
aHJpZWIgVGhvbWFzIEhlbGxzdHLDtm0gKEludGVsKToKPj4+Pgo+Pj4+IE9uIDEyLzkvMjAgNToz
NyBQTSwgSmFzb24gR3VudGhvcnBlIHdyb3RlOgo+Pj4+PiBPbiBXZWQsIERlYyAwOSwgMjAyMCBh
dCAwNTozNjoxNlBNICswMTAwLCBUaG9tYXMgSGVsbHN0csO2bSAoSW50ZWwpIAo+Pj4+PiB3cm90
ZToKPj4+Pj4+IEphc29uLCBDaHJpc3RpYW4KPj4+Pj4+Cj4+Pj4+PiBJbiBtb3N0IGltcGxlbWVu
dGF0aW9ucyBvZiB0aGUgY2FsbGJhY2sgbWVudGlvbmVkIGluIHRoZSBzdWJqZWN0IAo+Pj4+Pj4g
dGhlcmUncyBhCj4+Pj4+PiBmZW5jZSB3YWl0Lgo+Pj4+Pj4gV2hhdCBleGFjdGx5IGlzIGl0IG5l
ZWRlZCBmb3I/Cj4+Pj4+IEludmFsaWRhdGUgbXVzdCBzdG9wIERNQSBiZWZvcmUgcmV0dXJuaW5n
LCBzbyBwcmVzdW1hYmx5IGRyaXZlcnMgCj4+Pj4+IHVzaW5nCj4+Pj4+IGEgZG1hIGZlbmNlIGFy
ZSByZWx5aW5nIG9uIGEgZG1hIGZlbmNlIG1lY2hhbmlzbSB0byBzdG9wIERNQS4KPj4+Pgo+Pj4+
IFllcywgc28gZmFyIEkgZm9sbG93LCBidXQgd2hhdCdzIHRoZSByZWFzb24gZHJpdmVycyBuZWVk
IHRvIHN0b3AgRE1BPwo+Pj4KPj4+IFdlbGwgaW4gZ2VuZXJhbCBhbiBpbnZhbGlkYXRpb24gbWVh
bnMgdGhhdCB0aGUgc3BlY2lmaWVkIHBhcnQgb2YgdGhlIAo+Pj4gcGFnZSB0YWJsZXMgYXJlIHVw
ZGF0ZWQsIGVpdGhlciB3aXRoIG5ldyBhZGRyZXNzZXMgb3IgbmV3IGFjY2VzcyBmbGFncy4KPj4+
Cj4+PiBJbiBib3RoIGNhc2VzIHlvdSBuZWVkIHRvIHN0b3AgdGhlIERNQSBiZWNhdXNlIHlvdSBj
b3VsZCBvdGhlcndpc2UgCj4+PiB3b3JrIHdpdGggc3RhbGUgZGF0YSwgZS5nLiByZWFkL3dyaXRl
IHdpdGggdGhlIHdyb25nIGFkZHJlc3NlcyBvciAKPj4+IHdyaXRlIHRvIGEgcmVhZCBvbmx5IHJl
Z2lvbiBldGMuLi4KPj4KPj4gWWVzLiBUaGF0J3MgY2xlYXIuIEknbSBqdXN0IHRyeWluZyB0byB1
bmRlcnN0YW5kIHRoZSBjb21wbGV0ZSAKPj4gaW1wbGljYXRpb25zIG9mIGRvaW5nIHRoYXQuCj4+
Cj4+Pgo+Pj4+IElzIGl0IGZvciBpbnZsaWRhdGlvbiBiZWZvcmUgYnJlYWtpbmcgQ09XIGFmdGVy
IGZvcmsgb3Igc29tZXRoaW5nIAo+Pj4+IHJlbGF0ZWQ/Cj4+Pgo+Pj4gVGhpcyBpcyBqdXN0IG9u
ZSBvZiBtYW55IHVzZSBjYXNlcyB3aGljaCBjb3VsZCBpbnZhbGlkYXRlIGEgcmFuZ2UuIAo+Pj4g
QnV0IHRoZXJlIGFyZSBtYW55IG1vcmUsIGJvdGggZnJvbSB0aGUga2VybmVsIGFzIHdlbGwgYXMg
dXNlcnNwYWNlLgo+Pj4KPj4+IEp1c3QgaW1hZ2luZyB0aGF0IHVzZXJzcGFjZSBmaXJzdCBtbWFw
cygpIHNvbWUgYW5vbnltb3VzIG1lbW9yeSByL3csIAo+Pj4gc3RhcnRzIGEgRE1BIHRvIGl0IGFu
ZCB3aGlsZSB0aGUgRE1BIGlzIG9uZ29pbmcgZG9lcyBhIHJlYWRvbmx5IAo+Pj4gbW1hcCgpIG9m
IGxpYmMgdG8gdGhlIHNhbWUgbG9jYXRpb24uCj4+Cj4+IE15IHVuZGVyc3RhbmRpbmcgb2YgdGhp
cyBwYXJ0aWN1bGFyIGNhc2UgaXMgdGhhdCBoYXJkd2FyZSB3b3VsZCAKPj4gY29udGludWUgdG8g
RE1BIHRvIG9ycGhhbmVkIHBhZ2VzIHRoYXQgYXJlIHBpbm5lZCB1bnRpbCB0aGUgZHJpdmVyIGlz
IAo+PiBkb25lIHdpdGggRE1BLCB1bmxlc3MgaGFyZHdhcmUgd291bGQgc29tZWhvdyBpbi1mbGln
aHQgcGljayB1cCB0aGUgCj4+IG5ldyBQVEUgYWRkcmVzc2VzIHBvaW50aW5nIHRvIGxpYmMgYnV0
IG5vdCB0aGUgcHJvdGVjdGlvbj8KPgo+IEV4YWN0bHkgdGhhdCBpcyBub3QgZ3VhcmFudGVlZCB1
bmRlciBhbGwgY2lyY3Vtc3RhbmNlcy4gRXNwZWNpYWxseSAKPiBzaW5jZSBITU0gdHJpZXMgdG8g
YXZvaWQgZ3JhYmJpbmcgYSByZWZlcmVuY2UgdG8gdGhlIHVuZGVybHlpbmcgcGFnZXMuIAo+IEFu
ZCBpdCBkZXBlbmRzIHdoZW4gdGhlIGRlc3RpbmF0aW9uIGFkZHJlc3NlcyBvZiB0aGUgRE1BIGFy
ZSByZWFkIGFuZCAKPiB3aGVuIHRoZSBhY2Nlc3MgZmxhZ3MgYXJlIGV2YWx1YXRlZC4KPgo+IEJ1
dCBldmVuIHdoZW4gaXQgY2F1c2VzIG5vIHNlY3VyaXR5IHByb2JsZW0gdGhlIHJlcXVpcmVtZW50
IHdlIGhhdmUgdG8gCj4gZnVsZmlsbCBoZXJlIGlzIHRoYXQgdGhlIERNQSBpcyBjb2hlcmVudC4g
SW4gb3RoZXIgd29yZHMgd2UgZWl0aGVyIAo+IGhhdmUgdG8gZGVsYXkgdXBkYXRlcyB0byB0aGUg
cGFnZSB0YWJsZXMgdW50aWwgdGhlIERNQSBvcGVyYXRpb24gaXMgCj4gY29tcGxldGVkIG9yIGFw
cGx5IGJvdGggYWRkcmVzcyBhbmQgYWNjZXNzIGZsYWcgY2hhbmdlcyBpbiBhIHdheSB0aGUgCj4g
RE1BIG9wZXJhdGlvbiBpbW1lZGlhdGVseSBzZWVzIGl0IGFzIHdlbGwuCj4KPiBSZWdhcmRzLAo+
IENocmlzdGlhbi4KPgpHb3QgaXQuCgpUaGFua3MhClRob21hcwoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
