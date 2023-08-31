Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EA43791203
	for <lists+dri-devel@lfdr.de>; Mon,  4 Sep 2023 09:24:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0754010E2A9;
	Mon,  4 Sep 2023 07:24:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20631.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8a::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D075810E680
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Aug 2023 13:51:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lWc3OoXa/GPRTCnzFCiwhGqRKQiGxo9nOvGrXp8UunzKX6JwDo7yRZW2ha1TEbjzrxXBdzIaEO3pBx/Pfui2foaI8JUePASGl+NdyETMHEi3KNxNDHrsANjWBp72HWEuj1V3uEkzCGXJP5Sohgs0gmb5P4gprECj+zHgJHjRfzK63nSwuQOP/OPboiU/VffkFydFC36z64QZgMvIJcMvRlqNEAsep0Ch4++qOafeoIxi3gIBmzokeHPOPiQRZqigT0E4fsY2yn3nrU5n2LLdkWwoh4gSW71Xb0RJXN2wRi8onlysBhR8GjyktAQ92ppQ2RWlel4vtCoy7pRmK3Hoeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BI8JUnkkK2dFiFtho9y7jiRPKgNnO/EeIKD6hTmRfGQ=;
 b=YZjl810M6C5KYinSiiG5NzdK5Ceix3yMKXPWDl/1NvTU0A+6XSTDcCU12u49jhRjTcbFKV+o4IG4y+Lf536txgDOXthYTdaD2n1f5WXhoFFbaf27b4+TKCox/mhlV18tX16+QuzQ883d0MhDDOAcwlQt8cKzLvsz0ytcpxlShqrOZEfAA18dZdiLPYDXBHlZZ4zJue8npeZXz8ldDhQb8VmhKeUZVJpa14mBDbV31pHHvxciRfN3WfRfWmXN2vBTMwVb9D1+JUPXfffuyqzfcddOvqRDKSV4hwmGSvSp2wExaZ+Ygo4sLoY1HBe4UrPQ8vz7ROoi/VIS3TyCt/S0dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BI8JUnkkK2dFiFtho9y7jiRPKgNnO/EeIKD6hTmRfGQ=;
 b=N0lV30lEFobs7rYkj2N6tfld3gxIFX5vuh1c4zCfb19fNNGSYhmlEAIscA39d2/Mv2UlPjnVOi1b3tP6PoUjqXx1qGzQBzSwVhu0iEfC0P8L1tH5/2mIZReI08aZ+xiX8OXR6264hGDTLtCw+nzeuv1DZ+ch76do1KxLv3vqY1gkR3bR1fwf7yppoqM+Yh0QcWxCnCtCPj8zZePGFSWR+ulzejOHnYfxb5WOf9yQFIh04+aFfTyMtgFzqGaFUe1XfgXaNS+O2BJzQvUWfyBeBE9T8+Uo6RmUVaEpqz2U/NCjgXSCLJODgPZJc80MMKsoLqI+v3IoItac3TxfL9+myQ==
Received: from BY5PR12MB3763.namprd12.prod.outlook.com (2603:10b6:a03:1a8::24)
 by SN7PR12MB6715.namprd12.prod.outlook.com (2603:10b6:806:271::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.20; Thu, 31 Aug
 2023 13:51:12 +0000
Received: from BY5PR12MB3763.namprd12.prod.outlook.com
 ([fe80::9e7a:4853:fa35:a060]) by BY5PR12MB3763.namprd12.prod.outlook.com
 ([fe80::9e7a:4853:fa35:a060%2]) with mapi id 15.20.6745.022; Thu, 31 Aug 2023
 13:51:11 +0000
From: Ankit Agrawal <ankita@nvidia.com>
To: Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH v7 1/1] vfio/nvgpu: Add vfio pci variant module for grace
 hopper
Thread-Topic: [PATCH v7 1/1] vfio/nvgpu: Add vfio pci variant module for grace
 hopper
Thread-Index: AQHZ1TZ6Nms5b5NPG0K9tyfNGGuGJbAC53YAgAAeVICAAVyHgIAAFo2K
Date: Thu, 31 Aug 2023 13:51:11 +0000
Message-ID: <BY5PR12MB37631B2F41DB62CBDD7B1F69B0E5A@BY5PR12MB3763.namprd12.prod.outlook.com>
References: <20230822202303.19661-1-ankita@nvidia.com>
 <ZO9JKKurjv4PsmXh@infradead.org> <ZO9imcoN5l28GE9+@nvidia.com>
 <ZPCG9/P0fm88E2Zi@infradead.org>
In-Reply-To: <ZPCG9/P0fm88E2Zi@infradead.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY5PR12MB3763:EE_|SN7PR12MB6715:EE_
x-ms-office365-filtering-correlation-id: b0e5e999-3ea3-40e2-bf38-08dbaa29561c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: HK419EEvC8l+XFqkGuE528E1gATpzg9UVcpCSkxQy6k37PDlzlLjKECB1Qgg8yJQWm/0X9DEQ45LVQTx9B7q7EQqApijClvP8WQOrNs/YOTCzuTK8TPSBFXWj/1l3B39DyXDhb5A22f5L+UAbgqL5CXwq3VZX9vKvvPyCLJyJ869D7dDsxzNykJs94y/SA5/Fc4m2vg3v0u84b8xYaohaGJpmOA07uE0nbKEzyfKs3qHtw7mcDQMwZ6F+puY2CEUCqHHOhqPWkfmaGpuAROxNiF7hNGHRTcw0IPwWFVjJwNqmiNlqdEimbA1+b8qeqGFcjjKVXx1WVR90y315Fn9we0gLscX3w0cSC4X1rkQYmVv7kb62zgSFM1YuxguimJv3dTdMzr0fxmMoAtNcugiUN44XXF0Qns2kMKIoq6c70Q5irsZ/9ZySe/OOCctk6N5q0V8qDCWHjGRKqyGGh5Bi64Vc5HrmSTv8KZaR3p8uuLVefvDbPU1rrpBIEliOafCLvG/zj00Q2N2LIdMNlt1xoaqEMYE8WNe0QVYQ2YLk9U/pMTUpq9Lc/uENXV7DqwvZBV6HGs3QxXDM4d5gyQ2PX9V/lJM2yhOhiEl3HeNsXbuqdkGywJZkFrN8oPGlzAmN/pr5l9LWq5DwVczPt+7YldCD5Y6FH9wHo6caambuN0=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR12MB3763.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(39860400002)(136003)(396003)(366004)(346002)(186009)(1800799009)(451199024)(41300700001)(8936002)(55016003)(64756008)(66556008)(8676002)(4326008)(478600001)(66476007)(71200400001)(91956017)(6636002)(66946007)(110136005)(76116006)(316002)(6506007)(54906003)(7696005)(26005)(66446008)(9686003)(2906002)(38100700002)(38070700005)(122000001)(52536014)(5660300002)(33656002)(7416002)(558084003)(86362001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?s9Uh8o+s7DmO97KoyYHUvGu9B/OxO2u5kezX8UmvV9AgV56lMwNvdgydae?=
 =?iso-8859-1?Q?6h6BYtqIzzt/+V3vtFmyO2YYpldCfkgORS+li8DWNXyL7TDVab1NloBcOn?=
 =?iso-8859-1?Q?wLit5+dYoSDw5NW5i7u4DhBR+LMPvuBj4omuCPYuW3a7x1dsV96kINC+Fi?=
 =?iso-8859-1?Q?1d3/kxXnODsli4vgq5NQY3kd8nZvavYypkXThnbtGKVCnWhZutoxjmPhmt?=
 =?iso-8859-1?Q?flxr3kfSsvxEXepy1OuBI57aDVqOxYwUyHV6T9OKZlMudInvWxWDcROi6J?=
 =?iso-8859-1?Q?q8kFrJ6g264FCeWWP8WLxgfXF/jTLFfFQGFYiMJn1zW4d/V8weCbL42eAP?=
 =?iso-8859-1?Q?MYv79f4VT7EhFni+7zMGGYt0TxSX96olENh01Oi6y7h0slEEBi8gA78RY1?=
 =?iso-8859-1?Q?AvQmuZnlHQbpqSpodtpsY0SbsUoBfuAWErEiCGcVCQU0shZH0nrqlosQBE?=
 =?iso-8859-1?Q?l2cSeVz3Ns7MatIJJfky3Fl05TJfYVE9jx0PXEhSuHdPzitmeArG9rxHV4?=
 =?iso-8859-1?Q?Bht/tdZzhYfj4xGeXYbpo3uP+tuUyfDySH7f46rGp6FFlDQt23/ewifzET?=
 =?iso-8859-1?Q?xO/qu6UTtC4qICYokEVETXSq52W5duD2Dbv8UlpdF7wVky0RTt5+IRWpQm?=
 =?iso-8859-1?Q?mHkhaJvcSKfIc3iOfH/7UIw7F6egmbNMXIo3mmvLfLtxk3E5sy2qpOXOKq?=
 =?iso-8859-1?Q?Vp3FPKzgKuaiDf/Kt9t67IxBfdBUB1wNGIP7QrnANR6bkRhLlKclP+ivbN?=
 =?iso-8859-1?Q?oHMvyPG9NpKZgCQcg2DNGQ02rNOJp46UQBRZqvVW0X0LlbMxG+0Zg6+por?=
 =?iso-8859-1?Q?j01pODRBn4pV4cbrskBsc//JSa4LyvIC0IwyMd+/iHuqCFsNubspvZmDpG?=
 =?iso-8859-1?Q?EhrIibtrX4uixLdtnYLpeoonh5/uLlPI68ZunYw/ZrGkgAHViKzdlPErCu?=
 =?iso-8859-1?Q?pk8577+R+P3npHAOzyC6RN6quGuxFzFptzHkIKPNkv5xZ3ZC8aPQTzVXDQ?=
 =?iso-8859-1?Q?RdzMSMs4ZUuDGIs/7OURJrlrYbOootsAbUUCYO6OEnvABSOPvTTNpK0Mfr?=
 =?iso-8859-1?Q?c9cqlpOkSb6yjz++WECv+7PkqbJ2DoYqHAd/RTrqvb2+oYfJCGryorVnq0?=
 =?iso-8859-1?Q?pvj44sUtKcYJyRvB88H5SWVG3admdZ/VyP1ilHB2OxOmtR5wDEmZdbu19Q?=
 =?iso-8859-1?Q?da7WqU7tyIRdWndqYJ2FBGOK6K5qN/vN3oSKWwMBdYIJ/PmWymY+NKBLaX?=
 =?iso-8859-1?Q?x2pzjxJHm5rd93urUq8Fat5Vyz43HC1TbfYsrKAL2MxCrCdMC6dk2Vk0Mz?=
 =?iso-8859-1?Q?8HXKQaMY08CfzJXB9QuGcIwppDNPNN7YwqZf/mOOBZjWb74R9KPV5Em+Nv?=
 =?iso-8859-1?Q?CeIYrJRYp1O1ne0mSKWCQqIbTv5hyK78BkVtXCzEgsL8jmG06HImjli+Fr?=
 =?iso-8859-1?Q?ME7nbaBvmOjWJZJvOWF/xrjitDbXHJsYQpwW4KyV5bbjozr/wPMi6uIJr3?=
 =?iso-8859-1?Q?lMfqVOzfa7t+ML7MR7FYDnL5L2oVx9kv1RTl8crHpmKezAM62X3QFSonug?=
 =?iso-8859-1?Q?B7s6BokXfEh8SuLPHn22JSjbO7iXyZvYhbnWwEJMW3sJfu4m+JjyDIqUmj?=
 =?iso-8859-1?Q?wnCyoxAS2EDR0=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB3763.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0e5e999-3ea3-40e2-bf38-08dbaa29561c
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Aug 2023 13:51:11.7735 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Q7KU1EnqFJrRna47/tRIP0iG37cX60HMR7I78mCz4QS2CmQcs7PD8BfF9VyBEz8/DidxvUAcT2YUzywFCYDxtQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6715
X-Mailman-Approved-At: Mon, 04 Sep 2023 07:24:28 +0000
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
Cc: Andy Currid <acurrid@nvidia.com>,
 "kevin.tian@intel.com" <kevin.tian@intel.com>,
 Yishai Hadas <yishaih@nvidia.com>, Neo Jia <cjia@nvidia.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 John Hubbard <jhubbard@nvidia.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Alistair Popple <apopple@nvidia.com>, Kirti Wankhede <kwankhede@nvidia.com>,
 "shameerali.kolothum.thodi@huawei.com" <shameerali.kolothum.thodi@huawei.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Vikram Sethi <vsethi@nvidia.com>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>, "Tarun Gupta
 \(SW-GPU\)" <targupta@nvidia.com>, Aniket Agashe <aniketa@nvidia.com>,
 David Airlie <airlied@redhat.com>, Dan Williams <danw@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Christoph,=0A=
=0A=
>Whats the actual consumer running in a qemu VM here?=0A=
The primary use case in the VM is to run the open source Nvidia=0A=
driver (https://github.com/NVIDIA/open-gpu-kernel-modules)=0A=
and workloads.=0A=
