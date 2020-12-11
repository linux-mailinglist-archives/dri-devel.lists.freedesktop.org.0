Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B6D72D8011
	for <lists+dri-devel@lfdr.de>; Fri, 11 Dec 2020 21:36:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3556E6E462;
	Fri, 11 Dec 2020 20:36:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 21906 seconds by postgrey-1.36 at gabe;
 Fri, 11 Dec 2020 20:36:36 UTC
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 687936E462;
 Fri, 11 Dec 2020 20:36:36 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0BBEK3q4153543;
 Fri, 11 Dec 2020 14:29:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=XwmNJXsce0biO7XLe+zGaIsjtrmRfK/vTz0mYn6nQBU=;
 b=bR7yH4+1kTFS/uaRb9qwsHTyFm2EoNVmWnQB/6uOrO708u+eqNtBobFpmn1ttrRdH1ys
 eWZmcv+9rBDGS0S9dxVH7WJEjVIq3kan/8A2J+2JEfl4cmi6SdTHDxhFZ9FOjgghK0i/
 gSlqjyBs3FtwP3+ZAOMx//Xrh2s4GGZVNmZZvw8Dg7A8ucgqyFuZ1jZz6HYR0R/QX3KB
 jq1go8jZfLC3JdZILS9AqGFwicAYPALMmwsEwRd+5bZO9goG03a6o19lTH5pgGTEdXEs
 I4ECgSmCCiTYqeMDSavCaEpGT9QkWsYwEp7lVPsTzWiLDfHkK38lg3Q5ATAnYCJ8Q3TZ zQ== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by userp2130.oracle.com with ESMTP id 3581mratkd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 11 Dec 2020 14:29:21 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0BBEPIII069767;
 Fri, 11 Dec 2020 14:29:20 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by aserp3030.oracle.com with ESMTP id 358kstfcjw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 11 Dec 2020 14:29:20 +0000
Received: from abhmp0008.oracle.com (abhmp0008.oracle.com [141.146.116.14])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 0BBETD7i006093;
 Fri, 11 Dec 2020 14:29:13 GMT
Received: from [10.39.222.144] (/10.39.222.144)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Fri, 11 Dec 2020 06:29:13 -0800
Subject: Re: [patch 27/30] xen/events: Only force affinity mask for percpu
 interrupts
To: Thomas Gleixner <tglx@linutronix.de>, =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?=
 <jgross@suse.com>, LKML <linux-kernel@vger.kernel.org>
References: <20201210192536.118432146@linutronix.de>
 <20201210194045.250321315@linutronix.de>
 <7f7af60f-567f-cdef-f8db-8062a44758ce@oracle.com>
 <2164a0ce-0e0d-c7dc-ac97-87c8f384ad82@suse.com>
 <871rfwiknd.fsf@nanos.tec.linutronix.de>
From: boris.ostrovsky@oracle.com
Organization: Oracle Corporation
Message-ID: <9806692f-24a3-4b6f-ae55-86bd66481271@oracle.com>
Date: Fri, 11 Dec 2020 09:29:09 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <871rfwiknd.fsf@nanos.tec.linutronix.de>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9831
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 suspectscore=0
 bulkscore=0 malwarescore=0 phishscore=0 mlxscore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012110094
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9831
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 mlxlogscore=999
 clxscore=1015 malwarescore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 impostorscore=0 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012110093
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Karthikeyan Mitran <m.karthikeyan@mobiveil.co.in>,
 Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>, dri-devel@lists.freedesktop.org,
 Chris Wilson <chris@chris-wilson.co.uk>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Saeed Mahameed <saeedm@nvidia.com>, netdev@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Will Deacon <will@kernel.org>,
 Michal Simek <michal.simek@xilinx.com>, linux-s390@vger.kernel.org,
 afzal mohammed <afzal.mohd.ma@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Dave Jiang <dave.jiang@intel.com>,
 Leon Romanovsky <leon@kernel.org>, linux-rdma@vger.kernel.org,
 Marc Zyngier <maz@kernel.org>, Helge Deller <deller@gmx.de>,
 Russell King <linux@armlinux.org.uk>,
 Christian Borntraeger <borntraeger@de.ibm.com>, linux-pci@vger.kernel.org,
 xen-devel@lists.xenproject.org, Heiko Carstens <hca@linux.ibm.com>,
 Wambui Karuga <wambui.karugax@gmail.com>, Allen Hubbe <allenbh@gmail.com>,
 David Airlie <airlied@linux.ie>, linux-gpio@vger.kernel.org,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Lee Jones <lee.jones@linaro.org>, linux-arm-kernel@lists.infradead.org,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, linux-parisc@vger.kernel.org,
 Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>,
 Hou Zhiqiang <Zhiqiang.Hou@nxp.com>, Tariq Toukan <tariqt@nvidia.com>,
 Jon Mason <jdmason@kudzu.us>, linux-ntb@googlegroups.com,
 intel-gfx@lists.freedesktop.org, "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDEyLzExLzIwIDc6MzcgQU0sIFRob21hcyBHbGVpeG5lciB3cm90ZToKPiBPbiBGcmksIERl
YyAxMSAyMDIwIGF0IDEzOjEwLCBKw7xyZ2VuIEdyb8OfIHdyb3RlOgo+PiBPbiAxMS4xMi4yMCAw
MDoyMCwgYm9yaXMub3N0cm92c2t5QG9yYWNsZS5jb20gd3JvdGU6Cj4+PiBPbiAxMi8xMC8yMCAy
OjI2IFBNLCBUaG9tYXMgR2xlaXhuZXIgd3JvdGU6Cj4+Pj4gQWxsIGV2ZW50IGNoYW5uZWwgc2V0
dXBzIGJpbmQgdGhlIGludGVycnVwdCBvbiBDUFUwIG9yIHRoZSB0YXJnZXQgQ1BVIGZvcgo+Pj4+
IHBlcmNwdSBpbnRlcnJ1cHRzIGFuZCBvdmVyd3JpdGUgdGhlIGFmZmluaXR5IG1hc2sgd2l0aCB0
aGUgY29ycmVzcG9uZGluZwo+Pj4+IGNwdW1hc2suIFRoYXQgZG9lcyBub3QgbWFrZSBzZW5zZS4K
Pj4+Pgo+Pj4+IFRoZSBYRU4gaW1wbGVtZW50YXRpb24gb2YgaXJxY2hpcDo6aXJxX3NldF9hZmZp
bml0eSgpIGFscmVhZHkgcGlja3MgYQo+Pj4+IHNpbmdsZSB0YXJnZXQgQ1BVIG91dCBvZiB0aGUg
YWZmaW5pdHkgbWFzayBhbmQgdGhlIGFjdHVhbCB0YXJnZXQgaXMgc3RvcmVkCj4+Pj4gaW4gdGhl
IGVmZmVjdGl2ZSBDUFUgbWFzaywgc28gZGVzdHJveWluZyB0aGUgdXNlciBjaG9zZW4gYWZmaW5p
dHkgbWFzawo+Pj4+IHdoaWNoIG1pZ2h0IGNvbnRhaW4gbW9yZSB0aGFuIG9uZSBDUFUgaXMgd3Jv
bmcuCj4+Pj4KPj4+PiBDaGFuZ2UgdGhlIGltcGxlbWVudGF0aW9uIHNvIHRoYXQgdGhlIGNoYW5u
ZWwgaXMgYm91bmQgdG8gQ1BVMCBhdCB0aGUgWEVOCj4+Pj4gbGV2ZWwgYW5kIGxlYXZlIHRoZSBh
ZmZpbml0eSBtYXNrIGFsb25lLiBBdCBzdGFydHVwIG9mIHRoZSBpbnRlcnJ1cHQKPj4+PiBhZmZp
bml0eSB3aWxsIGJlIGFzc2lnbmVkIG91dCBvZiB0aGUgYWZmaW5pdHkgbWFzayBhbmQgdGhlIFhF
TiBiaW5kaW5nIHdpbGwKPj4+PiBiZSB1cGRhdGVkLgo+Pj4KPj4+IElmIHRoYXQncyB0aGUgY2Fz
ZSB0aGVuIEkgd29uZGVyIHdoZXRoZXIgd2UgbmVlZCB0aGlzIGNhbGwgYXQgYWxsIGFuZCBpbnN0
ZWFkIGJpbmQgYXQgc3RhcnR1cCB0aW1lLgo+PiBBZnRlciBzb21lIGRpc2N1c3Npb24gd2l0aCBU
aG9tYXMgb24gSVJDIGFuZCB4ZW4tZGV2ZWwgYXJjaGFlb2xvZ3kgdGhlCj4+IHJlc3VsdCBpczog
dGhpcyB3aWxsIGJlIG5lZWRlZCBlc3BlY2lhbGx5IGZvciBzeXN0ZW1zIHJ1bm5pbmcgb24gYQo+
PiBzaW5nbGUgdmNwdSAoZS5nLiBzbWFsbCBndWVzdHMpLCBhcyB0aGUgLmlycV9zZXRfYWZmaW5p
dHkoKSBjYWxsYmFjawo+PiB3b24ndCBiZSBjYWxsZWQgaW4gdGhpcyBjYXNlIHdoZW4gc3RhcnRp
bmcgdGhlIGlycS4KCgpPbiBVUCBhcmUgd2Ugbm90IHRoZW4gZ29pbmcgdG8gZW5kIHVwIHdpdGgg
YW4gZW1wdHkgYWZmaW5pdHkgbWFzaz8gT3IgYXJlIHdlIGd1YXJhbnRlZWQgdG8gaGF2ZSBpdCBz
ZXQgdG8gMSBieSBpbnRlcnJ1cHQgZ2VuZXJpYyBjb2RlPwoKClRoaXMgaXMgYWN0dWFsbHkgd2h5
IEkgYnJvdWdodCB0aGlzIHVwIGluIHRoZSBmaXJzdCBwbGFjZSAtLS0gYSBwb3RlbnRpYWwgbWlz
bWF0Y2ggYmV0d2VlbiB0aGUgYWZmaW5pdHkgbWFzayBhbmQgWGVuLXNwZWNpZmljIGRhdGEgKGUu
Zy4gaW5mby0+Y3B1IGFuZCB0aGVuIHByb3RvY29sLXNwZWNpZmljIGRhdGEgaW4gZXZlbnQgY2hh
bm5lbCBjb2RlKS4gRXZlbiBpZiB0aGV5IGFyZSByZS1zeW5jaHJvbml6ZWQgbGF0ZXIsIGF0IHN0
YXJ0dXAgdGltZSAoZm9yIFNNUCkuCgoKSSBkb24ndCBzZWUgYW55dGhpbmcgdGhhdCB3b3VsZCBj
YXVzZSBhIHByb2JsZW0gcmlnaHQgbm93IGJ1dCBJIHdvcnJ5IHRoYXQgdGhpcyBpbmNvbnNpc3Rl
bmN5IG1heSBjb21lIHVwIGF0IHNvbWUgcG9pbnQuCgoKLWJvcmlzCgoKPiBUaGF0J3MgcmlnaHQs
IGJ1dCBub3QgbGltaXRlZCB0byBBUk0uIFRoZSBzYW1lIHByb2JsZW0gZXhpc3RzIG9uIHg4NiBV
UC4KPiBTbyB5ZXMsIHRoZSBjYWxsIG1ha2VzIHNlbnNlLCBidXQgdGhlIGNoYW5nZWxvZyBpcyBu
b3QgcmVhbGx5IHVzZWZ1bC4KPiBMZXQgbWUgYWRkIGEgY29tbWVudCB0byB0aGlzLgo+Cj4gVGhh
bmtzLAo+Cj4gICAgICAgICB0Z2x4Cj4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVsCg==
