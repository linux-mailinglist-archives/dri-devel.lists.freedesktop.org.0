Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F815493FAF
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jan 2022 19:12:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20AB810E90A;
	Wed, 19 Jan 2022 18:12:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from na01-obe.outbound.protection.outlook.com
 (mail-centralusazon11021026.outbound.protection.outlook.com [52.101.62.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AD3310E90A
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jan 2022 18:12:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U44hIUUmMwbVMnttlzCYij6BLdbJqY5rksZnM47hC2VzwuZHBqyUI8HIBfTaPOWL+4mjK24yOCyiQa9+AeiJ/zXlALxIrwkvraK1Y4ixLVVKGfPwXo3QksvzR52BXpvOarmujKpKe0Eveb2KrAinOs7UeA5sYasj9R44sX0VeTEDVmCNDSVO/b2wXHxij6ogHIxHExzZlq/3G85moq7Mj0jVR/QBdO2i4KBg9pkgRsCYKa8MmCjUufiPI/ZA54v4Qh4wZKykd3hvenEqP4yu2jT5008lxRsf5En9icwyyttEA+edseOUWKdYMBSRev6lfXhaIp/9mhbtc3MfUtLIlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uYDIdJK+ZJvQ8JUnbWP0YDh7lNHeRQDU3Q6aCIp6hAY=;
 b=FxuV9pqxP0e0U/k7kfTTeYhblumjmBGAiOB9s+MtD6Q0U6koUrzvSgD7yeR7V/zJjdym8baRh+XDLsBF2u8tVLT9JLYPszbFRhx7JIf5DYZoLLYNT2er6sqiyHw9MAzKwmpbC8x8Oz+QjcrxqyYgPjw71E+N627pRvMuCA2i+pOeq1EZhmEBMtEHk3c2mMHLtOT1SMJxbtoPnw/KIJz/mYIMV21vsB+PEdlnFp0+MUbpV4OEiD+uBKVqV4j5YSmLHQFMWN0FhZEflgfsGB8spHkOqEjSu39oXlMEWuL3ArtCdx1ZIoAyp0I9R3Yw7IiM7XK0bU9iEUHSWVmpwi563A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uYDIdJK+ZJvQ8JUnbWP0YDh7lNHeRQDU3Q6aCIp6hAY=;
 b=KhWy2DcmtsrbIBUW0YzyBnuaMyM6oZ+AQ1IwNQ35y+vkfU7wX3nmvlQh5q3VrVbq+3CV5tvIpSuJkvn1stlO8N7AW9OjJ9kV5iKdR4rFvjbEoC0E/POrCnNt7RZoMnoaK57pmugH9KbD3HDpyi15KA4lQXSRtDLOsqTlgqg5MaA=
Received: from CY4PR21MB1586.namprd21.prod.outlook.com (2603:10b6:910:90::10)
 by CO1PR21MB1329.namprd21.prod.outlook.com (2603:10b6:303:150::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.3; Wed, 19 Jan
 2022 18:12:42 +0000
Received: from CY4PR21MB1586.namprd21.prod.outlook.com
 ([fe80::b508:1cc:47b2:db82]) by CY4PR21MB1586.namprd21.prod.outlook.com
 ([fe80::b508:1cc:47b2:db82%2]) with mapi id 15.20.4930.004; Wed, 19 Jan 2022
 18:12:42 +0000
From: "Michael Kelley (LINUX)" <mikelley@microsoft.com>
To: Wei Liu <wei.liu@kernel.org>, Andrea Parri <parri.andrea@gmail.com>
Subject: RE: [PATCH v2] hv: account for packet descriptor in maximum packet
 size
Thread-Topic: [PATCH v2] hv: account for packet descriptor in maximum packet
 size
Thread-Index: AQHYBbs9Z9MCDPVXTEy3Gdtosh0+p6xi6g+AgAe+98A=
Date: Wed, 19 Jan 2022 18:12:42 +0000
Message-ID: <CY4PR21MB1586D30C6CEC81EFC37A9848D7599@CY4PR21MB1586.namprd21.prod.outlook.com>
References: <20220109095516.3250392-1-yanminglr@gmail.com>
 <20220110004419.GA435914@anparri>
 <20220114191307.uu2oel7wbxhiqe56@liuwe-devbox-debian-v2>
In-Reply-To: <20220114191307.uu2oel7wbxhiqe56@liuwe-devbox-debian-v2>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ActionId=52998894-518c-4106-a338-c17fa10f8f23;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ContentBits=0;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=true;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Method=Standard;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=Internal;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2022-01-19T17:30:25Z;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microsoft.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a0367a0d-9cc9-4b0d-581d-08d9db77494d
x-ms-traffictypediagnostic: CO1PR21MB1329:EE_
x-ms-exchange-atpmessageproperties: SA|SL
x-microsoft-antispam-prvs: <CO1PR21MB1329DC5976D7B7DE2E4097D4D7599@CO1PR21MB1329.namprd21.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ownrK0A/dtZCX6Dk7pRkTQgjQF0GqcCz5DyoMtzLZquY20mrQonkgj7eNnCsEGUYX3KOarZ15mVQhPdVf21zyY1Jc8oX6ahZpnEkYTd+fsgohC8RF6jcJ8NAWTFhWqj920R0y0L28JajzcbJrgf42LZg9C9r4qrp4wtF1C7i0LLmgrjc+JjwcsNovIptN0G4MTmulR4JLAxSzCXqA0Gmi4nkV5+/d5+noAP2CN3WYz8hlYlXcnh1egKN5AW/h5BtC7nMceWk6/Xj76veyK1Hv6H/8sWaQrjR48Ztwj/9RTuHIM5Gd2CT50X54RcktZojEuZSyBMjfhn1xtDlheG3sELCVJfw5U3NH/JZSHjD8u+ye4vK4zow9gsjJtgjuiu92cjVDauO/OE4MxO6Yaqb5J5nMCJIgVJOm5oxpxpoXI17Iyzxez0GuKPuQJZtgqNlIksRWhb/R44ntmlrM8ttGCGRw6q+RDVfOp7N6CosUQ+/VWnciFSJIG/cjFsb37wf/Bkcdsj6Jq03aA5EoEhiOn7QQcsGL1aZKpS35IHGMm3Wlegoq7DgPUZeqKEjwwP8zt18GYwE/jvCGlqh42XWAi2Sx0zxTtbkA57NthGtWUSorZ4fvKAvvMcEkW/fyutM0vF9poKorjGz4v4VOIvSF7jJxNAuEv1/QFu4MqMjSDwlyf2Yci0qUIeBla3wWYezcRXLwGvotbd5igp/fhlhfSdOjRYQPwlaB7fAmUol4EIuxNb8hxWWnYjIdgtcy3Dx
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR21MB1586.namprd21.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(10290500003)(38100700002)(86362001)(122000001)(4326008)(66556008)(64756008)(66476007)(8676002)(508600001)(66446008)(54906003)(316002)(66946007)(76116006)(38070700005)(83380400001)(110136005)(55016003)(8936002)(186003)(6506007)(5660300002)(9686003)(7696005)(52536014)(33656002)(26005)(15650500001)(8990500004)(2906002)(82950400001)(82960400001)(7416002)(71200400001)(20210929001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?YF8GBI8DTVEjU4b2fjZu9qT61MFPIXEA+8EFhNzSYTBT9f8VdyxRec0b0AqQ?=
 =?us-ascii?Q?fa/F3EOSbWV4g9OQDIayhEiiKAixt9vf3/dZdE0r+jdDVhHWXhKqCYR2f/dn?=
 =?us-ascii?Q?5h6yX5BMiJRWEqWWLgKTGe9zitNbbiCALMOWCVWhsKMTqi4mBiDaZbxSyD8V?=
 =?us-ascii?Q?dJaupblgY1wamEcWclDlyvaWw029CKDWat2F8Txmz5KRnu5VhLg44rwWDTF8?=
 =?us-ascii?Q?jo70gO4BHV8949befeE+LUm4p+x6ANNng0EilHQ0goEBpnPmEiTUnqOm6gZT?=
 =?us-ascii?Q?4nyDaS7OoSlztPZ6OKS1h9Rf5SYCb2PxGSgCTxCfzxikf0OymUKx+Ukwerxy?=
 =?us-ascii?Q?JYkD4bhUXzuZziJa4vEipfj5JAU4D3ZpMl6yleYm3EOsKB9NQX2ivM7/rWLj?=
 =?us-ascii?Q?gm39VYSFVO/muBCp85Ky9yRhwuupezsj/s0NRKsO+HotNVjOYo4um6/thFmM?=
 =?us-ascii?Q?IA2hdYhchIPGfKn0yhcURtqhBBa9Noe++amXJNew6CTlIYzXEws2sUikTUWd?=
 =?us-ascii?Q?npeEWLOr2gHNPTc/BodNYW8mVYqZzxYLjezeU6FBb3zfrPt/7eLOjPCmUEGO?=
 =?us-ascii?Q?xkztMFv6cseZh/2F34z9OEkMr5GouMy3VgdE9u7G5tJHkfF7iWZb97XStieX?=
 =?us-ascii?Q?fHY48o535mRVdbE0Krs//ze2Y0yO5RVzcMC5vZ78mDiIdfbi258x68L8aaEN?=
 =?us-ascii?Q?n8HRsmEFU6wFU22QiRzrOm5ONkrazOWcy9MoTGPKRQgi6pmlicQ7t0NcYgxr?=
 =?us-ascii?Q?AWSoMO22cqdgr8dWenafmNtAMmfhv/zl7JVVi9o5OsGW2Mz1cnd61LvPiq/W?=
 =?us-ascii?Q?gf4nI+OCDNNUuyQXYW/jXq+RmpxWOeGkdHrwciF0G673R1dPj/779ZUw53pu?=
 =?us-ascii?Q?0xoK9HCTX2QD8yP5r7CtalVoBWiHzm0Baf98imX4AAxyfLPF4ciotv3ZNFKk?=
 =?us-ascii?Q?v5XhXwHwDCwTj2J1ZOhuF/eO2KgwaDDzffp/ozJiwrkGG+7gNTjPTJB2p0gs?=
 =?us-ascii?Q?45zlYoom4HKRMJ7yptsvjR2uoFRgahNs5w8t3IrttJonL7xxuArgKb26B39M?=
 =?us-ascii?Q?R7g27vOaDbkGwL6H5pLX0WYwPEsHvfdD5GEeJ07nunaX+n18z1UAAX2QNS2A?=
 =?us-ascii?Q?Ts5FOuyaEb3GP9ZJ1Lx0+vW26cTs1J64bPIMnA4pdVXFHVOVYMtxe2a6xxJg?=
 =?us-ascii?Q?zRuL/KMDDh3E1tnU8DiWu9EMTJjgCo7xbiou0h+vjQYWpg/6MlalPQ5zGwEy?=
 =?us-ascii?Q?GH/hjr/lDxXkgtf0u4boVjs1Aragenc6X5yieCzKAXTYYwLbsV1x8q6u3XYQ?=
 =?us-ascii?Q?h8KaySoK6q2axulTCyY7iyzyuLq+zP9y5Ld+EUblh6pFMLBrmP8rTvtpU59c?=
 =?us-ascii?Q?hijgNx/+pN2OkNnFwhsWbdIGB3hbrXSpyG4bVlXOa2Y3Lqi0RdfsTqnaYY5T?=
 =?us-ascii?Q?HrDjRm7rT2sSNM5j1LldhfrYh1H+5UCbM8m5ZI7HCWqQXcp9A795WOZ40cXP?=
 =?us-ascii?Q?yniDkgRhCJQ5iQffp4jj8bAE7Myaxrsnp3N4QvAE7U604tN40iC8albs+Yw5?=
 =?us-ascii?Q?0qD6XZrvbw2Ankx0VwQBATEZ0Ocr/SUXpNj/DhykealQVp9LPlYoGgQxKYjs?=
 =?us-ascii?Q?/iUH1ARbxJHlbpPC315XGs4bNdEPVZdCXVR7e8Csd9hGaFcPaviWhsiyOBm7?=
 =?us-ascii?Q?SfRhgg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR21MB1586.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0367a0d-9cc9-4b0d-581d-08d9db77494d
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jan 2022 18:12:42.4439 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PrWNuZZCKg7/xuANkNPE2aUw4/QErpG3pJ80iIDp1dSOtngJDPvNrbtqvfyKhjW6ndHwofC10Mi+9vvlaxA3Mal4P8frHaoI90y7We5O+wE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR21MB1329
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
Cc: "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
 Stephen Hemminger <sthemmin@microsoft.com>,
 "lkmlabelt@gmail.com" <lkmlabelt@gmail.com>,
 "airlied@linux.ie" <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Haiyang Zhang <haiyangz@microsoft.com>, Dexuan Cui <decui@microsoft.com>,
 "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Yanming Liu <yanminglr@gmail.com>,
 "drawat.floss@gmail.com" <drawat.floss@gmail.com>,
 KY Srinivasan <kys@microsoft.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Wei Liu <wei.liu@kernel.org> Sent: Friday, January 14, 2022 11:13 AM
>=20
> On Mon, Jan 10, 2022 at 01:44:19AM +0100, Andrea Parri wrote:
> > (Extending Cc: list,)
> >
> > On Sun, Jan 09, 2022 at 05:55:16PM +0800, Yanming Liu wrote:
> > > Commit adae1e931acd ("Drivers: hv: vmbus: Copy packets sent by Hyper-=
V
> > > out of the ring buffer") introduced a notion of maximum packet size i=
n
> > > vmbus channel and used that size to initialize a buffer holding all
> > > incoming packet along with their vmbus packet header. Currently, some
> > > vmbus drivers set max_pkt_size to the size of their receive buffer
> > > passed to vmbus_recvpacket, however vmbus_open expects this size to a=
lso
> > > include vmbus packet header. This leads to corruption of the ring buf=
fer
> > > state when receiving a maximum sized packet.
> > >
> > > Specifically, in hv_balloon I have observed of a dm_unballoon_request
> > > message of 4096 bytes being truncated to 4080 bytes. When the driver
> > > tries to read next packet it starts from a wrong read_index, receives
> > > garbage and prints a lot of "Unhandled message: type: <garbage>" in
> > > dmesg.
> > >
> > > The same mismatch also happens in hv_fcopy, hv_kvp, hv_snapshot,
> > > hv_util, hyperv_drm and hyperv_fb, though bad cases are not observed
> > > yet.
> > >
> > > Allocate the buffer with HV_HYP_PAGE_SIZE more bytes to make room for
> > > the descriptor, assuming the vmbus packet header will never be larger
> > > than HV_HYP_PAGE_SIZE. This is essentially free compared to just addi=
ng
> > > 'sizeof(struct vmpacket_descriptor)' because these buffers are all mo=
re
> > > than HV_HYP_PAGE_SIZE bytes so kmalloc rounds them up anyway.
> > >
> > > Fixes: adae1e931acd ("Drivers: hv: vmbus: Copy packets sent by Hyper-=
V out of the ring buffer")
> > > Suggested-by: Andrea Parri (Microsoft) <parri.andrea@gmail.com>
> > > Signed-off-by: Yanming Liu <yanminglr@gmail.com>
> >
> > Thanks for sorting this out; the patch looks good to me:
> >
> > Reviewed-by: Andrea Parri (Microsoft) <parri.andrea@gmail.com>
> >
>=20
> Thanks. I will pick this up after 5.17-rc1 is out.
>=20
> Wei.

I'm NACK'ing this set of changes.  I've spent some further time investigati=
ng,
so let me explain.

I'm good with the overall approach of fixing individual drivers to set the
max_pkt_size to account for the VMbus packet header, as this is an
important aspect that was missed in the original coding.   But interestingl=
y,
all but one of the miscellaneous VMbus drivers allocate significantly more
receive buffer space than is actually needed, and the max_pkt_size matching
that receive buffer size is already bigger than needed.  In all these
cases, there is already plenty of space for the VMbus packet header.

These hv-util.c drivers allocate a receive buffer 4 Kbytes in size, and all
receive only small fixed-size packets:  heartbeat, shutdown, timesync.
I don't think any changes are needed for these drivers because the default
max_pkt_size value of 4 Kbytes bytes is plenty of space even when
accounting for the VMbus packet header.

The VSS driver in hv_snapshot.c allocates a receive buffer of 8 Kbytes
and sets max_pkt_size to 8 Kbytes.  But the received messages are
all fixed size and small.  I don't know why the driver uses an 8 Kbyte
receive buffer instead of 4 Kbytes, but the current settings are
more than sufficient.

The FCOPY driver in hv_fcopy.c allocates a receive buffer of 8 Kbytes
and sets max_pkt_size to 8 Kbytes.  The received messages have
some header overhead plus up to 6 Kbytes of data, so the 8 Kbyte
receive buffer is definitely needed.  And while this one is a little
closer to filling up the available receive space than the previous
ones, there's still plenty of room for the VMbus packet header.  I
don't think any changes are needed.

The KVP driver in hv_kvp.c allocates a receive buffer of 16 Kbytes
and sets max_pkt_size to 16 Kbytes.  From what I can tell, the
received messages max out at close to 4 Kbytes.   Key exchange
messages have 512 bytes of key name and 2048 bytes of key
value, plus some header overhead.   ipaddr_value messages
are the largest, with 3 IP addresses @ 1024 bytes each, plus
a gateway with 512 bytes, and an adapter ID with 128 bytes.
But altogether, that is still less than 4096.  I don't know why
the receive buffer is 16 Kbytes, but it is plenty big and no
changes are needed.

The two frame buffer drivers also use 16 Kbyte receive buffers
and set max_pkt_size to 16 Kbytes.  Again, this looks to be overkill
as the messages received are mostly fixed size.  One message
returns a variable size list of supported screen resolutions, but
each entry in the list is only 4 bytes, and we're looking at a few
tens of resolutions at the very most.  Again, no changes are
needed.

After all this analysis, the balloon driver is the only one that
needs changing.   It uses a 4 Kbyte receive buffer, and indeed
Hyper-V may fill that receive buffer in the case of unballoon
messages.   And that where the original problem was observed.

Two other aspects for completeness.  First, all these drivers
do protocol version negotiation with the Hyper-V host.  The
negotiation includes a variable-size list of supported versions.
Each version in the list takes 4 bytes, but there would never
be enough different versions to come close to filling a 4 Kbyte
buffer.  So there's no problem here.

The other lurking issue is the 'offset8' field in the VMbus
packet header, which says where the payload starts relative
to the VMbus packet header.  In practice, this value is always
small, so there's no significant additional space to account
for.  While it's theoretically possible that Hyper-V could use
a much larger value, and cause max_pkt_size to be exceeded,
there's no real way to fix this problem.  Adding an extra page
to max_pkt_size, as it done in this patch, certainly provides
some extra room, but doesn't guarantee the problem can't
happen.  But since there's no indication Hyper-V would ever
put a big value into offset8, I don't think we need to worry
about the possibility.

My bottom-line:  Let's fix the balloon driver.  But now
that we know the other drivers are safe "as is", let's leave
them unchanged and not waste the additional memory.

Michael
