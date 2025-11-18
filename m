Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B55CDC6816D
	for <lists+dri-devel@lfdr.de>; Tue, 18 Nov 2025 08:59:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B8A510E420;
	Tue, 18 Nov 2025 07:59:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="thh3eOwR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011000.outbound.protection.outlook.com [40.107.208.0])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59C8710E41C
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 07:59:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Wr0gWv2VsUWAp1wHUdFC0ua9CxJNit/MEaY4g1HdECj3GFdECYwLFpb4mGpnh7XfRomoCueowlaFZiKlLlild8QgTrnTNDM372hzehroS+jRtFKWHVgjOT9HYGoOzW+vGgtd2yiLsuC0sQKxsTIb7DrWTWhS4FsP6GzFUSivubs8i191ZQVyXqK2it8LWzRjFxUc7z80L1Y7JRkyzm7jD2JKI2SQ3G4rq0JVyLXA6m0xwUUhmWTF+uhlJ1No3HszTDDYV8GEb2b+25Hed5rZaWCA1z9wva4F3nf08R3umQTQjkhDJSeuTRXEHCyqoAl96YiibmCIhCBCI8XFVsNRgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VGgJKSJS8HO1P18sKsT+ALREKZePZzfExHrZ3CVL4Ko=;
 b=LoQVNdICqwGwqQVH/yL84dBa1pzoxdrZSMdSfzjflEeUlKByYukdmZ6hIqiecDzYP9Cf2uHF/g77BMMbpgs1IuqGrRqZWyga/41Fni8wboTK6MP8BrcBzW4GtC55TB33TXTd1eqo/vpH2M86zzZoCUSVkxAwFono1IyHzL8dE2sXUkhtHR3wcpjHuZKrRM6YAarZz/iQ2dnto0NJNEJ/Ywlge1ZC9lR9IQEPOtcT8kdm6zpJB5qxU/Rf9gkFpvof3jkuGWFzwZpeo0eP2YmRKYDK6GbeMk7he6LSsuHyyPDWAC1RtUWDyC1VRbrRl2A/3gi+3F9EpK034kz8wgRaUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VGgJKSJS8HO1P18sKsT+ALREKZePZzfExHrZ3CVL4Ko=;
 b=thh3eOwRUheNgrLS+JfhmosA8jqYmNaElYb2N3EVKWOclCRBSKL0kgdW99UHI1PFA8RugfsA0aHq5LibdwatU37VCwmnwE1m0gqjyL7eBHhOqlTZqH8KXI2aHb8wmv/qTbrUyE/+kDSjoiR0VDMvdCbmzWpmgF5jml88n2JiLD/nO89G+JHdbu2Qm5NPz5qS9Ja8G6jLrpa0JjMTRyku6Wi/NvxFqmJJyDuoGOFLIvwKiyAuKgSmviCWB/wlXUoqGCKOex1aT8ULIKUL3FYusmaIYzDZqF8bTuLLWpaKEJBTEdKPCnT/FFQehrp7HEa+R3fVfyLEzaIsopCI9lSwug==
Received: from SA1PR12MB7199.namprd12.prod.outlook.com (2603:10b6:806:2bc::21)
 by PH7PR12MB8796.namprd12.prod.outlook.com (2603:10b6:510:272::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.21; Tue, 18 Nov
 2025 07:59:20 +0000
Received: from SA1PR12MB7199.namprd12.prod.outlook.com
 ([fe80::928c:89d8:e8d6:72dd]) by SA1PR12MB7199.namprd12.prod.outlook.com
 ([fe80::928c:89d8:e8d6:72dd%6]) with mapi id 15.20.9320.021; Tue, 18 Nov 2025
 07:59:20 +0000
From: Ankit Agrawal <ankita@nvidia.com>
To: Leon Romanovsky <leon@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Logan Gunthorpe <logang@deltatee.com>, Jens Axboe <axboe@kernel.dk>, Robin
 Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, Will Deacon
 <will@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, Jason
 Gunthorpe <jgg@ziepe.ca>, Andrew Morton <akpm@linux-foundation.org>, Jonathan
 Corbet <corbet@lwn.net>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?iso-8859-1?Q?Christian_K=F6nig?= <christian.koenig@amd.com>, Kees Cook
 <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, Yishai
 Hadas <yishaih@nvidia.com>, Shameer Kolothum <skolothumtho@nvidia.com>, Kevin
 Tian <kevin.tian@intel.com>, Alex Williamson <alex@shazbot.org>
CC: Krishnakant Jaju <kjaju@nvidia.com>, Matt Ochs <mochs@nvidia.com>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
 "iommu@lists.linux.dev" <iommu@lists.linux.dev>, "linux-mm@kvack.org"
 <linux-mm@kvack.org>, "linux-doc@vger.kernel.org"
 <linux-doc@vger.kernel.org>, "linux-media@vger.kernel.org"
 <linux-media@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linaro-mm-sig@lists.linaro.org"
 <linaro-mm-sig@lists.linaro.org>, "kvm@vger.kernel.org"
 <kvm@vger.kernel.org>, "linux-hardening@vger.kernel.org"
 <linux-hardening@vger.kernel.org>, Alex Mastro <amastro@fb.com>, Nicolin Chen
 <nicolinc@nvidia.com>
Subject: Re: [PATCH v8 11/11] vfio/nvgrace: Support get_dmabuf_phys
Thread-Topic: [PATCH v8 11/11] vfio/nvgrace: Support get_dmabuf_phys
Thread-Index: AQHcUvHEG6GIBgha/EW1FY2tAPLvh7T4GiZE
Date: Tue, 18 Nov 2025 07:59:20 +0000
Message-ID: <SA1PR12MB7199A8A0D17CDC980F819CC6B0D6A@SA1PR12MB7199.namprd12.prod.outlook.com>
References: <20251111-dmabuf-vfio-v8-0-fd9aa5df478f@nvidia.com>
 <20251111-dmabuf-vfio-v8-11-fd9aa5df478f@nvidia.com>
In-Reply-To: <20251111-dmabuf-vfio-v8-11-fd9aa5df478f@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR12MB7199:EE_|PH7PR12MB8796:EE_
x-ms-office365-filtering-correlation-id: bec107fb-824f-4403-0d6f-08de26786145
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|38070700021|921020; 
x-microsoft-antispam-message-info: =?iso-8859-1?Q?7bm8jZpHiSV0/4xXwO/M7LDsKMq8aUZ4S52bNCiKWvWLRE4mUUvOHUkH9B?=
 =?iso-8859-1?Q?yl9VazyjMdJtwZH819xxNTmF1h8DUzflQzG6RyHmaeJf4+NDpdAts1ZfE0?=
 =?iso-8859-1?Q?o8ygCLMDgyvUAc9NdHKWUzbjFYXSojwue/rosH+EDbexRaVuzOqkvUJnOy?=
 =?iso-8859-1?Q?kQOxqHbqKSy45VYzUy1i49Lk253hamqRcGlbFuuWnSHyMl1opQ8UiPIwsi?=
 =?iso-8859-1?Q?GXz3/VyxIh9AXSrkdPZC5zWEff/A1Me6Sm4t5Mo6jYXnn9+hsbb25iPs30?=
 =?iso-8859-1?Q?BxDOqTlYzy0YHQvkwRtvTvMtJ4dl6xXKXK55X6uZ8YlxV5ch15GIsNUqjx?=
 =?iso-8859-1?Q?zG7zFF+5BsiHNoZzwMI3iJE1Vkx56AwGjCKAHPpORW9nueA2/orrSzvEW7?=
 =?iso-8859-1?Q?342EV+5yB+Iu0jZI4PVC5J99dP0edHUEBRAVvyTjfhih/J/pk5KtM10yE2?=
 =?iso-8859-1?Q?keP8kd6byMArLNuWWUfNAOe+zIfACoYDcuqFhuX1f+qTL8UUp5bwYwmEuQ?=
 =?iso-8859-1?Q?xtQN3vQ46sdQbyA5BYHJu3sftyr5rRF6QUXoM4wWFiUfrb1TQXS7DrSNKO?=
 =?iso-8859-1?Q?uSPj313R//HCMHehe4epuSMBMrBQLviV+TfjHCp68pAREmr2K2+/jw87Sg?=
 =?iso-8859-1?Q?m9asUDjO3NYE1kDx2EvhDpj67ts4ep6SfeR3/hF9eHhAA5tq96V9s2I8jn?=
 =?iso-8859-1?Q?+pXbLDIItucoNjlG4+Z9dQz8rW2lLglCRGfh1df7o9qEcL/cCdEC4ddzW2?=
 =?iso-8859-1?Q?09RSBLMEG9EbpbVAHmjnQ8ufoD6pPJSM+/oBYoD9PZ+e/JrbRWG676NwHl?=
 =?iso-8859-1?Q?gC69ZjK4ScL2jAX/KQOP9fj4Cj5ZJGjI/yCmL1p+fSNyIANzg5J1U8h59e?=
 =?iso-8859-1?Q?IFEiUGciYwWGEKZYjWpYrvLSydvuM6uVaORz7J1nqor8fgY3GxYtMfHfRn?=
 =?iso-8859-1?Q?QNzlNQAHFuSy2YcLz/BpXcq5/VF+hXqUlYJlMEk0oFgMf0sUdYNt26Wpi7?=
 =?iso-8859-1?Q?U68dRpsuNoTrcoB6pHAqZHALVJcOFqeAVOQH0qsMaKwRIu73I1VIMHbuDL?=
 =?iso-8859-1?Q?Q/44+0coqZTO1rp0y163UOpaFAa+AMsbAeAZNXgBwKfXTyu9X9NEYodOYa?=
 =?iso-8859-1?Q?FDRlK0K2LYwyaIwYTG7bKmsxZ9xbfmySt5NW2qxxSEyw9hAnP2atGoH8Pm?=
 =?iso-8859-1?Q?mdy7D1RdxS0oJIksejIV4sQgbpkYeLiw90eUf+nInS/tWuk7dIy57FsjvG?=
 =?iso-8859-1?Q?6bjYWpcrN8DCRNRK2DZ3dk+F4p7iFvVywYeGDUDmSwAkFBZno/gwQjzudt?=
 =?iso-8859-1?Q?uRzTBCgcwj8YgP7ckd+cEBveqzGCgXQS3CfW9+zgl5t8Jf+36dZVR7U4GT?=
 =?iso-8859-1?Q?D0gCR4kB1m1k7x/NPDtkn5uSOr86Px1GfvqFVuERN7R+NcOh+0xwPMOX3i?=
 =?iso-8859-1?Q?9VriLdrOAadnVtMo1LR2SlBMeFkkhmxcwI4GRYDjm4PaM9Zb3Oethm8dGz?=
 =?iso-8859-1?Q?eAnMMi8aBN1CTf8qVAo2+00DY0FS0hDQQVfYQavb6jGGvcUIrQh8ctGaM5?=
 =?iso-8859-1?Q?tQqLXq6V3+1jt/h0IaWm0Wb1r3xouGyHfVcPN2My+2S85gYeoQ=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR12MB7199.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700021)(921020);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?euFfucWZ/MBFEPd1KmvjmN6RDR9Cli1Y7WXunzwfLCwBkAAhZNalb5QK7N?=
 =?iso-8859-1?Q?UlYZz2p17/I2Y6hmlwR1o0lYEFYIozA7mkGwcYgDBRRRKZkGo8rXTJVeVv?=
 =?iso-8859-1?Q?rNegigw4saSqmwIywgzKHTnQy6vITmuxBFyxOORkJzYAA0V37LKkLj9tyD?=
 =?iso-8859-1?Q?P01j+mANLH7EJeqxQ1cPAf7ykGDO++T2VPmyoMiKtShh7M2ixZicvdUT/D?=
 =?iso-8859-1?Q?BFFNljkmnaKg3okjMjPQ/rXU1BUaGgYyWbUObM5vwDmWK1C+VzmwXAkzcU?=
 =?iso-8859-1?Q?LT8IWTter3hfdYjz2/y54VqHPZ3f7M2tbEkoTdVqoXxCKhW0vKwLei77xz?=
 =?iso-8859-1?Q?zypuhaHb8oI3gctHaXVvUIc4Crbglj+n7b0DpIfsWXzhHXPtFuihGzAjjW?=
 =?iso-8859-1?Q?6NWS36hSMCz8LvcWABJOZFafgGrGyvwR6OsMb6dw8Lg/vymxyS3zQQPQlD?=
 =?iso-8859-1?Q?hwGqofRs1tsOMqJRgDA4A00oe7MBcWeePpRq3xX0OAYnuSYPzCgabRR8Yo?=
 =?iso-8859-1?Q?Rra5V8DclDw5xOivyjlU+aNA/IcgN1xYA6/NqfNvLKPlu/85z1902wgufO?=
 =?iso-8859-1?Q?zNgJEHtLujjQo5Lxb4C3D7WqvZik4AiSEe2uuNcmVwVf8ziKx+KsRpDJkC?=
 =?iso-8859-1?Q?S5BE71O169VceBlTiBm8TrSVcdxkFmDdfCCEGKjihhfxV2xW6lm6CODilJ?=
 =?iso-8859-1?Q?slOo5qZLGJGXMxDFqNuuPX8LahHRw7hIKwnyUfV7U8LMsdCQd4XXsgufMY?=
 =?iso-8859-1?Q?9zkO4tI6ettMEWCAg/Gn3idLkDPl2zE1p3M5ZgoQhJ9WeeZAQlOkNouxKA?=
 =?iso-8859-1?Q?yNi05uMO8yfs89sGeAIbJzznE59Ml5VlRrrnVXkjEaPk58uQmyOXAM38AZ?=
 =?iso-8859-1?Q?r+J0U5QR0dRH9LbgsNXgGr9WoeAqseAwOOcwWqvrglLiqbQnJBhgiDDJTi?=
 =?iso-8859-1?Q?MfEdzge7gaOPIc1d6HK5MaM2+25u9Zk5B7mbSFYWpZq53T6DtDqEkc/T+j?=
 =?iso-8859-1?Q?0B2vg8JoYyx9j/2IjsoIXbLZPk+88iDbBVjO5Kluy7X75rE2DAZVwKgMay?=
 =?iso-8859-1?Q?9MOHkY+2/q3IbqVInOSSH2nXdNPJQTfGfazJ7ZT6lwZ00Vrjr2dBrsNcDe?=
 =?iso-8859-1?Q?paSZkNZOiMUkkxNvHgq102iudFBcI9ebf7sqadHx2EaJA9fpiArBc5vSlS?=
 =?iso-8859-1?Q?5UIfWikmcPO62LxSiyIt0OFhPov2cECLyljYNTxhJoicBXukRFC7Fs6NAb?=
 =?iso-8859-1?Q?61Mpos7lqJVRg0GAs740HAcWFRLsk0ovQaYI/URsrvF7XALukSsxoKz0bJ?=
 =?iso-8859-1?Q?pQ4Gaqg8QmFZib6XITpTEmpYY/FxCRALZdwqFU4Vq7ngCtDJoG7RwsYwGK?=
 =?iso-8859-1?Q?hVYSod0V4xbCZwE6nxfd1Pte24qqJ5AcNULO3G7s2X9MBU71DmK5DZrgx3?=
 =?iso-8859-1?Q?l8peaDNtiUG07cAOSZ7028l5e8fvm4eM3Gyle/XS0Mm3tAEDmg1Mfk2Tom?=
 =?iso-8859-1?Q?oi0hZe9yy6vFqW71B4/xDlEKdKO/zzGGVDSIEtr1SYmQVU+yDn9cTkobMl?=
 =?iso-8859-1?Q?7AXA/iNzbbXeVhMD3L/v++JjIZXK2IM3Zpa7iXVMLXJCBWuUUf0E8bv/xB?=
 =?iso-8859-1?Q?N7SkaSKykjsVM=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB7199.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bec107fb-824f-4403-0d6f-08de26786145
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Nov 2025 07:59:20.2749 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DfDyZdulZf8pON/1fknIJmxboNkTBa7r4G0MOyMsI6QaeUkbAfBqOjMBw/dyxwtlXVTj5tticujCZ7miu02X3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8796
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

+=A0=A0=A0=A0=A0=A0 if (nvdev->resmem.memlength && region_index =3D=3D RESM=
EM_REGION_INDEX) {=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 /*=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 * The P2P properties of the =
non-BAR memory is the same as the=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 * BAR memory, so just use th=
e provider for index 0. Someday=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 * when CXL gets P2P support =
we could create CXLish providers=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 * for the non-BAR memory.=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 */=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 mem_region =3D &nvdev->resmem;=
=0A=
+=A0=A0=A0=A0=A0=A0 } else if (region_index =3D=3D USEMEM_REGION_INDEX) {=
=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 /*=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 * This is actually cachable =
memory and isn't treated as P2P in=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 * the chip. For now we have =
no way to push cachable memory=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 * through everything and the=
 Grace HW doesn't care what caching=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 * attribute is programmed in=
to the SMMU. So use BAR 0.=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 */=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 mem_region =3D &nvdev->usemem;=
=0A=
+=A0=A0=A0=A0=A0=A0 }=0A=
+=0A=
=0A=
Can we replace this with nvgrace_gpu_memregion()?=0A=
=0A=
=0A=
=0A=
