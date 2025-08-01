Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F96EB18400
	for <lists+dri-devel@lfdr.de>; Fri,  1 Aug 2025 16:37:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45AC210E889;
	Fri,  1 Aug 2025 14:37:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=siemens.com header.i=@siemens.com header.b="IziG/fVt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazon11010007.outbound.protection.outlook.com [52.101.84.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8711510E889;
 Fri,  1 Aug 2025 14:37:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JOmMhB6vgBoV52JU9E1CucgXOJNpaXbrBiVSUELf55Ge/A6fYD4ZRzTx/p6sbUnzVJRC2laSqtdJP+vuoynzTpnFuXwG+smbvQwTCqPQk7hyWm3haF2jRsx9AR3y3gJgFUgHGE3aYNEkchNvy4ZqE15c6Zc4vuJfZmwh4JoLOodpXI5YMCyJaWPUHZ/xzStBJntLPQVkMcfCWVvYy7DuI+9L1vEnBfmCTl/yEZVrjVkPEKr2dd602VitFJfgNx3J1aeAefWgh7MErJx6v9SFgOHy34+7BynZ0bYjv8zKRnDi2me8S9+xB8BjhG4OQfDtrwsNpFKmxfKTVhiX/l4BZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NeswODzYUUmfqe5P/T/uSHeKXjQqSlFhGM5H6HglSZM=;
 b=UD7I7YA/IeybwT7caHBrtvgrCyjEcxwj42JVmdJ8UTr41pSPbsj0B+Q9vKBAnm7uqhgPa9+jf1S4hDLa5AebkiZaDtoBth+jBBP8dCov0e1sM2A5WJVmsXaA2DbY7i7zPOe3A9sEFYsgQaYJWNpuuzoU+Q+igIASXCAr4kaKdrY9JkU/7MSUvT08+Z0upIMLMFNt4ucYjXq2vqlKt92IfmH+vFl1igO5JG99QAXPv6QTsRlCrcRbcZ2BYMul7CdR+IUkBprYREuE/Hzztgl8EvqGDmBAXd+KlXOaITOoQNfccPTsgV5PuJ1L76zEzGX7kQgVCuXkQjPbJiz930FgWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NeswODzYUUmfqe5P/T/uSHeKXjQqSlFhGM5H6HglSZM=;
 b=IziG/fVt9GvDU4FKO7q76R9bYUmsUwD95VijEX/JP7Au2v44RNl+cRx1I2WyymRaFc6PQvDh4I7fsTzxcgW2P1/yNVWXQXaeKYWhOC3yrcWS4ohmboEfaKUO7pGhnccb5w2Ezv89PycUweh/oDUTKwo9gR+whADH1UhHEjtRPgOt/DhdZ9KbN0vGkB/7yroAimfDnMtT3KzfTAL0Vh6v+FxfwNajz111amOLv+Ca+gf4rrUi5U61CETdZzHs8cJth0+/l0LeZjjO7Bkp0abyri1c6JEE3gbeoX6WvXKCoaAX9bdeiTiZ3Tigg/VDS4BegnIW39V/m2TtDUzWemMWLA==
Received: from DB3SPRMB0006.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:436::7) by
 AS4PR10MB6304.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:58f::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8989.16; Fri, 1 Aug 2025 14:37:04 +0000
Received: from DB3SPRMB0006.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::7fc6:5d80:5e9c:246c]) by DB3SPRMB0006.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::7fc6:5d80:5e9c:246c%2]) with mapi id 15.20.8964.030; Fri, 1 Aug 2025
 14:37:04 +0000
From: "nicusor.huhulea@siemens.com" <nicusor.huhulea@siemens.com>
To: "imre.deak@intel.com" <imre.deak@intel.com>
CC: "stable@vger.kernel.org" <stable@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "cip-dev@lists.cip-project.org" <cip-dev@lists.cip-project.org>,
 "jouni.hogander@intel.com" <jouni.hogander@intel.com>,
 "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
 "jani.nikula@linux.intel.com" <jani.nikula@linux.intel.com>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>, "tzimmermann@suse.de"
 <tzimmermann@suse.de>, "airlied@gmail.com" <airlied@gmail.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, "joonas.lahtinen@linux.intel.com"
 <joonas.lahtinen@linux.intel.com>, "rodrigo.vivi@intel.com"
 <rodrigo.vivi@intel.com>, "tvrtko.ursulin@linux.intel.com"
 <tvrtko.ursulin@linux.intel.com>, "laurentiu.palcu@oss.nxp.com"
 <laurentiu.palcu@oss.nxp.com>, "cedric.hombourger@siemens.com"
 <cedric.hombourger@siemens.com>, "shrikant.bobade@siemens.com"
 <shrikant.bobade@siemens.com>
Subject: RE: [PATCH 0/5] drm/i915: fixes for i915 Hot Plug Detection and
 build/runtime issues
Thread-Topic: [PATCH 0/5] drm/i915: fixes for i915 Hot Plug Detection and
 build/runtime issues
Thread-Index: AQHcAWzy3t50zo5SAEmpHcCyMXGHRrRLFuMAgALIj8A=
Date: Fri, 1 Aug 2025 14:37:04 +0000
Message-ID: <DB3SPRMB000631927D36A721EAE657F3E626A@DB3SPRMB0006.EURPRD10.PROD.OUTLOOK.COM>
References: <20250730161106.80725-1-nicusor.huhulea@siemens.com>
 <aIp6UgiwtDU1Ktmp@ideak-desk>
In-Reply-To: <aIp6UgiwtDU1Ktmp@ideak-desk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=7a45d62f-ef00-4b33-a332-ed51e405b6d6;
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2025-08-01T14:32:46Z;
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10, 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB3SPRMB0006:EE_|AS4PR10MB6304:EE_
x-ms-office365-filtering-correlation-id: 6b3b0b62-ed43-4a16-7b7c-08ddd108e246
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|366016|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?Uqp6XI/v2jXPbCbPTDYnCZ+zlTnrXd5Rem4rRb5WvW1AySfWwJ0+GsGzbGUA?=
 =?us-ascii?Q?OfH9Q/X5Rcj4bARzCJp/nJcGztLDeiEwGcVx8tyYrUa5ok6kLt8b5fb/s2pN?=
 =?us-ascii?Q?0Rb6mjAbxCbNvXR++1LWJMwVblWguSQB0qHRzC1gfQ4R1devcms7QXDrUiH5?=
 =?us-ascii?Q?11RqnZvOgn09HdSfeCONye5i4ftXelU+BO6+t1ymuLV87XOueOF6u6PwqAPb?=
 =?us-ascii?Q?b/V9MSDzq4Uf3K/MvksGVPKN1vMrostla2K3nARgwycKAf//PYf6KL9mM26F?=
 =?us-ascii?Q?HWzQhva7w25o0/PqxfgDtq3X/47gqzCrARGFmggAUJzH2h2+flC7F4OKvdnC?=
 =?us-ascii?Q?uKpe8QHhjO1PaKVUND6x7dshUIQFRgsdLyqI7QugmVub69rlVD+MB+PYtoQ6?=
 =?us-ascii?Q?ztAI0mfi4jEhsrH8R01P9AA9LHFFW5fc7ErjVu1P++6Cr1PjGMDI0O79+d7n?=
 =?us-ascii?Q?r2CDFe9On31kGLWBZf16mDn69J1ijF92jyolbo1bJA+769GSxQosAnaZCSrV?=
 =?us-ascii?Q?cVYObNeYT/XT3bMpcgfh5pp7aOnRO4izdDvQISo+dZVjNAac+607la3dm/BX?=
 =?us-ascii?Q?W8e5M5mYEAvQG2m7Kg9PZFOO5QlFKjpfK5HFpYtxUZ5i8jh/A56jMfEu2GQm?=
 =?us-ascii?Q?x0ZML7LyXLlACc8qYn/wr4JJIkJzM/5bmRQd/MdyWy8bpBOaF/Gvcz7CF44U?=
 =?us-ascii?Q?ieAHa70l2wALbDBKO/burIQ0EbEJ/O3RcBOLGiVB13aQsAkJ2S7HE7/BA4wv?=
 =?us-ascii?Q?BKYUDv46nQ2C5/CcoUw1tpUU0B3sxUkjcO9GphRp0nLFmJ/MD0JFMe5Km6gh?=
 =?us-ascii?Q?BWyzqLrzEu11YLMvx919DdhGI64WOsuuNxk+LmumZMWbbSxHv9QLvcWrXqGz?=
 =?us-ascii?Q?jkkWHuG1nEV3wtmrlO9MxGEF5HruRdHu3znqSTZAXb2LtRVAjRNIHP6LPaqC?=
 =?us-ascii?Q?Rd3yNmuhP8WFaIjot4/xVcHTJuAB5hRbnJqHt2RXyu5YLX1KQeJ8ZQ41834S?=
 =?us-ascii?Q?LRDOxW8RkONd12MplunqmHt3u7R72xmvPTSI5iA5yVYlUWBWFeUk69uYL7Ld?=
 =?us-ascii?Q?gOHFbdciVnAqvViEGw4SRFgmh8gfJTku2Xpoy+SY4o2JLctJEasktGtBOTwP?=
 =?us-ascii?Q?+mAyx4m0BScJHumvy6O4UwH9Jlum1fc7xGGi/SrfqX77MwB6M9m+tDaJ+CiS?=
 =?us-ascii?Q?MqcyNnWZeRsdpMsJomsTs37ar8qSMm4ZMtmL1Ysja/u0mQfuwKTC4nk2YjLI?=
 =?us-ascii?Q?wjo5HWJpfO47LWlfe8IWqP8o97U/P1HmIFwp8GxCGE5pKSDJjiF58nsZ9GsZ?=
 =?us-ascii?Q?fOHLdk2BCUJzZNwF2Ypy/nTX1JwUY9pS29v+R/uOitwvFgEfKQre6KVcmHZU?=
 =?us-ascii?Q?cc2hYMePRzKd7RhL9whNHItzPDJHFLbes9DYjuf+xk+ha8Z+DCd4tSV9JDUm?=
 =?us-ascii?Q?lVC7y1u7SsE=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB3SPRMB0006.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?SeVZoxAVsSz0DMMDNaoqfNERviNmkeboBBmn3Us2W81vJMwy2qX6DWnr7h2Z?=
 =?us-ascii?Q?k9Z8lvoG4hid5knDcQ/zz1024CEPeT4MPNpVTtedEYBAR739Qe/uckrwKcvl?=
 =?us-ascii?Q?CfevTY3GQF7cg4mVGYPrmNyvFZmz97haAvFzSKJ0I46e+zZXMnIVXcA0tWtP?=
 =?us-ascii?Q?SluV7DlwYLmLM6w1+FanM0SOfJkevpTH8o891O3v7T2yu01BmLQDyEIy8rqG?=
 =?us-ascii?Q?Ip5U6tnPhauv9t3Hg/3qiaTVcbJUWpgIXgJU3TT15HVwgR48gB4tJGMOmmPH?=
 =?us-ascii?Q?QTIOS0Bl5/+o2Mt9uLgRaOyLJO1IGYOMYwqlwUs7OLkRLQbbe03MnYS6bhX2?=
 =?us-ascii?Q?PMKJmnSeEqWcfain7blkLAeo4N+cLO3r9vRSQ6sTcRLFYyqb04tWqSSjnq7m?=
 =?us-ascii?Q?r9aLFiQRJHooXbI1321PtKi3vH8Htadnu9JNsCmw+6vKlDlsOWwS0qj4XUQB?=
 =?us-ascii?Q?NNRwUQToEpaGgotSRhXDNyaUjvP/MxF8oOsOvoU620G6A4BicJBp94doa3qw?=
 =?us-ascii?Q?9yyMg48PK6TpAFxPtvKcLuOvvwrQZ2fYuHMHyHsMDu7Q8DYRIJIoFCwuxM9j?=
 =?us-ascii?Q?FWkaSiAZ4kqJb4Wp+rse+AClyNq1W0FQR+1sxBHu3aDdbJGhwqPC8SiqGN20?=
 =?us-ascii?Q?xJ4D84A4hc7wClY09p/G2AMYCh4ucS/FzUIZmHVJ/lkR+aAgYOQDiHjUfO8L?=
 =?us-ascii?Q?dfa6BIdYL/CTWRYUY8U9axxJeAIJnGFAmlYkv1UGl9Dea1xZATpVQBHZrU8R?=
 =?us-ascii?Q?L+HD7O5yhQFaxK0/1EpkEQkpvHyk7lYXy/lbl8PyrgfcKacc1vc26rluyjSl?=
 =?us-ascii?Q?6YuDSlRpkkf+zGQUQxjtyFbbJVwC+e2rFayL+1QMHWSry5sJTj21YuiO69mp?=
 =?us-ascii?Q?fUPQOyS1rmFfDQCPlNyJ+8nn6haKIDK10IMtIgjtaXym+KhW5N+dFLvigCo0?=
 =?us-ascii?Q?FhvW75i9czhXQeVynVxGzFgLbxmb/JuS2qSUKcLlOyzfDQKbLIbTrhl/I8Rd?=
 =?us-ascii?Q?PkVH97G5TbdJfbWx+iXUvMJpTAU6X+HFt955X7LSaf+ZXTA1aHfuvS55xku1?=
 =?us-ascii?Q?VFwZ/S4eA8AbNllylpoYZGx8KkKsIEj2he4D8I9Zv6FKNfgoDVGKVrK7cZ3/?=
 =?us-ascii?Q?g8RgPlMTOVO9hARd5g3mdcM0vPnPOG2CenrWzlUbd+w/qKYQEHd0ll3RurWp?=
 =?us-ascii?Q?kZI9zFrxfjSRpOj2ovi6Gq3+IGknC/u1954TNmRhFQ6cvLRVGZwjJ0xl2uHa?=
 =?us-ascii?Q?QpNkdPExHybzfQOqFypbmg51zLMKbzu6HaD2bO0ul4Lq/p5cCGes+WSTjtch?=
 =?us-ascii?Q?48mGi2lIILlgee53Hv9SGVeOo+UqnqvzvtDvxlZIWDYt+/9TPJ8Ai2mRIsT2?=
 =?us-ascii?Q?oQuOthkAxyfXGmBTo9bxLZGYa2q5swFrBUchgNOOFjbcj5CF3prCpWcC0Bhz?=
 =?us-ascii?Q?36UcfTYzNQTm+q5CLq0Z9R83xH6C+/1GUtBTu2qg5PCUnD5k8zECG/TfIYdV?=
 =?us-ascii?Q?RJfFrMfX4JhmvQSTaPVdRDBMZKHmYgDTanhCleaviGpt8+oFDn7mdhMQqg3V?=
 =?us-ascii?Q?4OAPihQvh22iddh0tPucNFZsxiwoiybHM2a7joBpDCYoicRZGyPtKKs3S9zo?=
 =?us-ascii?Q?AA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB3SPRMB0006.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b3b0b62-ed43-4a16-7b7c-08ddd108e246
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Aug 2025 14:37:04.2012 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HWKh0HooznNaiVWV1alyoY12F94NxSGVwIZ/wMcEg6SnLNZN/Scmgq08Zrpp+0Wc5WdlquNUDx9G4NpUq6g10CPYt0ap0uGI5HxYl0L+7Hc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR10MB6304
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



>>-----Original Message-----
>>From: Imre Deak <imre.deak@intel.com>
>>Sent: Wednesday, July 30, 2025 11:02 PM
>>To: Huhulea, Nicusor Liviu (FT FDS CES LX PBU 1)
>><nicusor.huhulea@siemens.com>
>>Cc: stable@vger.kernel.org; dri-devel@lists.freedesktop.org; intel-
>>gfx@lists.freedesktop.org; cip-dev@lists.cip-project.org;
>>jouni.hogander@intel.com; neil.armstrong@linaro.org; jani.nikula@linux.in=
tel.com;
>>maarten.lankhorst@linux.intel.com; mripard@kernel.org; tzimmermann@suse.d=
e;
>>airlied@gmail.com; daniel@ffwll.ch; joonas.lahtinen@linux.intel.com;
>>rodrigo.vivi@intel.com; tvrtko.ursulin@linux.intel.com;
>>laurentiu.palcu@oss.nxp.com; Hombourger, Cedric (FT FDS CES LX)
>><cedric.hombourger@siemens.com>; Bobade, Shrikant Krishnarao (FT FDS CES
>>LX PBU 1) <shrikant.bobade@siemens.com>
>>Subject: Re: [PATCH 0/5] drm/i915: fixes for i915 Hot Plug Detection and
>>build/runtime issues
>>
>>Hi Nicusor,
>>
>>thanks for the report and the root causing effort. The patchset itself ha=
s a few
>>issues:
>>
>>- commit cfd48ad8c4a9 ("drm/i915: Fix HPD polling, reenabling the output
>>  poll work as needed") you backport fixes d33a54e3991d
>>  ("drm/probe_helper: sort out poll_running vs poll_enabled"), but this
>>  fixed commit is not part of the 6.1.y stable tree which you are
>>  targeting.
>>
>>  Similarly commit d33a54e3991d fixes c8268795c9a9 ("drm/probe-helper:
>>  enable and disable HPD on connectors"), which is not part of 6.1.y
>>  either.
>>
>>  This means the issue commit cfd48ad8c4a9 is fixing is not present in
>>  the 6.1.y tree, as the changes introducing that issue are not present
>>  in that tree either.
>>
>>- The compile errors the patches in your patchset introduce would
>>  prevent bisection, so fixing up these compile errors only at the end
>>  of the patchset is not ok; the tree should compile without errors at
>>  each patch/commit.
>>
>>Looking at v6.1.y and the patchset I suspect the actual issue is the
>>
>>commit 4ad8d57d902f ("drm: Check output polling initialized before
>>disabling") backport in v6.1.y, which had the
>>
>>-       if (!dev->mode_config.poll_enabled || !drm_kms_helper_poll)
>>+       if (drm_WARN_ON_ONCE(dev, !dev->mode_config.poll_enabled) ||
>>+           !drm_kms_helper_poll || dev->mode_config.poll_running)
>>
>>change, not part of the original
>>
>>commit 5abffb66d12b ("drm: Check output polling initialized before disabl=
ing"). i.e.
>>the original patch didn't add the check for
>>dev->mode_config.poll_running. So could you try on top of v6.1.147
>>(w/o the changes in the patchset you posted):
>>
>>diff --git a/drivers/gpu/drm/drm_probe_helper.c
>>b/drivers/gpu/drm/drm_probe_helper.c
>>index 0e5eadc6d44d..a515b78f839e 100644
>>--- a/drivers/gpu/drm/drm_probe_helper.c
>>+++ b/drivers/gpu/drm/drm_probe_helper.c
>>@@ -250,7 +250,7 @@ void drm_kms_helper_poll_enable(struct drm_device *de=
v)
>>        unsigned long delay =3D DRM_OUTPUT_POLL_PERIOD;
>>
>>        if (drm_WARN_ON_ONCE(dev, !dev->mode_config.poll_enabled) ||
>>-           !drm_kms_helper_poll || dev->mode_config.poll_running)
>>+           !drm_kms_helper_poll)
>>                return;
>>
>>        drm_connector_list_iter_begin(dev, &conn_iter);

Thank you for your thorough explanation, especially regarding the bisecting=
 issue. I hadn't anticipated that by fixing compile errors only at the end =
of the series, I would make bisection unreliable.

I have tested your idea/fix and it works. HPD polling works reliably on bot=
h devices. I can see the polling in logs when display cable is not connecte=
d.

Since this fix is mostly your solution, would you prefer to submit yourself=
, or would you like me to resubmit it as a v2 and credit you appropriately =
?

>>
>>If this doesn't resolve the issue, I think we need to figure out the actu=
al root cause,
>>for that could you please open at a ticket at
>>
>>https://gitlab.freed/
>>esktop.org%2Fdrm%2Fi915%2Fkernel%2F-
>>%2Fissues%2Fnew&data=3D05%7C02%7Cnicusor.huhulea%40siemens.com%7Cd78
>>e534c4c604c981c9108ddcfa41f44%7C38ae3bcd95794fd4addab42e1495d55a%7C1
>>%7C0%7C638895025993788215%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1h
>>cGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyf
>>Q%3D%3D%7C0%7C%7C%7C&sdata=3Dnss8VV88cJo9qDB5YSlr1OKAYXMo6epa
>>HcR1p355Lns%3D&reserved=3D0
>>
>>attaching a dmesg log booting v6.1.147 and if possible also the latest dr=
m-tip
>>kernel with the drm.debug=3D0xe kernel parameter?
>>
>>Thanks,
>>Imre
>>
>>On Wed, Jul 30, 2025 at 07:11:01PM +0300, Nicusor Huhulea wrote:
>>> Hello maintainers,
>>>
>>> This series addresses a defect observed on certain hardware platforms
>>> using Linux kernel 6.1.147 with the i915 driver. The issue concerns hot=
 plug
>>detection (HPD) logic, leading to unreliable or missed detection events o=
n affected
>>hardware. This is happening on some specific devices.
>>>
>>> ### Background
>>>
>>> Issue:
>>>     On Simatic IPC227E, we observed unreliable or missing hot plug dete=
ction
>>events, while on Simatic IPC227G (otherwise similar platform), expected h=
ot plug
>>behavior was maintained.
>>> Affected kernel:
>>>     This patch series is intended for the Linux 6.1.y stable tree only =
(tested on
>>6.1.147)
>>>     Most of the tests were conducted on 6.1.147 (manual/standalone kern=
el build,
>>CIP/Isar context).
>>> Root cause analysis:
>>>     I do not have access to hardware signal traces or scope data to con=
clusively
>>prove the root cause at electrical level. My understanding is based on ob=
served
>>driver behavior and logs.
>>>     Therefore my assumption as to the real cause is that on IPC227G, HP=
D IRQ
>>storms are apparently not occurring, so the standard HPD IRQ-based detect=
ion
>>works as expected. On IPC227E,
>>>     frequent HPD interrupts trigger the i915 driver's storm detection l=
ogic, causing
>>it to switch to polling mode. Therefore polling does not resume correctly=
, leading
>>to the hotplug
>>>     issue this series addresses. Device IPC227E's behavior triggers thi=
s kernel
>>edge case, likely due to slight variations in signal integrity, electrica=
l margins, or
>>internal component timing.
>>>     Device IPC227G, functions as expected, possibly due to cleaner elec=
trical
>>signaling or more optimal timing characteristics, thus avoiding the trigg=
ering
>>condition.
>>> Conclusion:
>>>     This points to a hardware-software interaction where kernel code as=
sumes
>>nicer signaling or margins than IPC227E is able to provide, exposing logi=
c gaps
>>not visible on more robust hardware.
>>>
>>> ### Patches
>>>
>>> Patches 1-4:
>>>     - Partial backports of upstream commits; only the relevant logic or=
 fixes are
>>applied, with other code omitted due to downstream divergence.
>>>     - Applied minimal merging without exhaustive backport of all interm=
ediate
>>upstream changes.
>>> Patch 5:
>>>     - Contains cherry-picked logic plus context/compatibility amendment=
s as
>>needed. Ensures that the driver builds.
>>>     - Together these fixes greatly improve reliability of hotplug detec=
tion on both
>>devices, with no regression detected in our setups.
>>>
>>> Thank you for your review,
>>> Nicusor Huhulea
>>>
>>> This patch series contains the following changes:
>>>
>>> Dmitry Baryshkov (2):
>>>   drm/probe_helper: extract two helper functions
>>>   drm/probe-helper: enable and disable HPD on connectors
>>>
>>> Imre Deak (2):
>>>   drm/i915: Fix HPD polling, reenabling the output poll work as needed
>>>   drm: Add an HPD poll helper to reschedule the poll work
>>>
>>> Nicusor Huhulea (1):
>>>   drm/i915: fixes for i915 Hot Plug Detection and build/runtime issues
>>>
>>>  drivers/gpu/drm/drm_probe_helper.c           | 127 ++++++++++++++-----
>>>  drivers/gpu/drm/i915/display/intel_hotplug.c |   4 +-
>>>  include/drm/drm_modeset_helper_vtables.h     |  22 ++++
>>>  include/drm/drm_probe_helper.h               |   1 +
>>>  4 files changed, 122 insertions(+), 32 deletions(-)
>>>
>>> --
>>> 2.39.2
>>>
