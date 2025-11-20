Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8316C759EA
	for <lists+dri-devel@lfdr.de>; Thu, 20 Nov 2025 18:23:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1388510E796;
	Thu, 20 Nov 2025 17:23:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="HZVTyq5c";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010011.outbound.protection.outlook.com [52.101.61.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09A6310E796
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Nov 2025 17:23:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HIz7V006tlFCnmMJXPK8+R9hFHM6YB5OmtXL+yqVF0N006BdgrvuDLKHfI7zUID0H9SvPERSkp/NXAUZhxewWUmWeiZ3ubVMSQvvdQe1Tub2fkg3RbhFuhhLqglLgq4iqDls6inJrD0BPBiXh0En1qHUERZLG15kSL2cJLdaEjxdcC9cX89MeKRMHyOV6YShq5HgqSy/1opr6bnb47Zy/AIYEAyRGyYLNC3Sn6mjfTslxWgsVBAP4kTpjKULrEl8d/++cdW8ab5F1gSNvtgODT1FhvmjSVF9fpQmNYZ5CWxp79UjMgdTJZicPxEgA+W05zJiinpcZq1QhtcB1jMHtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+ZqFC3+8oYwTUAqqaUHWWxxhiicGXHgBaUCU8Y3yVl8=;
 b=u232i4CvhB27conyj66Oae9ckzekm6JyIs5MfAeQsv0pGoymUjmBYSmQ+fbK1aIh5ZI9DAPa7H9dlyQe5cXelwOY2mR97S9XgBLrscR0sqxWZJvH739KDoglDLIAzbQyWdoa65NWk/40yx4P7f/jwPMoAMBQPFhj6ZmAGvGbn0lwhHVCIxgej9YCj7GkNvufXCsq5zCwswCsmb7fPibUbBPcP1qOlLpzjnGDLjTGOxtauneFgYP+tDWLOsgp/kLzNDuiMc6grjcVpAzzezCIxkCTI4zdEBfEUn7Fhzl/8IoWKb9Yi26pjfwYJSPFAkEB240L2hvrRPCL9J3nSPXo2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+ZqFC3+8oYwTUAqqaUHWWxxhiicGXHgBaUCU8Y3yVl8=;
 b=HZVTyq5cwWsX+FtsPZ8TKRZvuUrMpQZt2lRGm7VcQM9MsjkaeUDYDSvscbh1+jElSdo/bTcxwBt/GqC2VmdgFAznE014rYjg7thZJtjLiB9FP9MHvSieRaNVZ86+wu8w6AWg6BOt6gp9zrj1Psl2JZaczkvYXafXmh97qxDiG/UF5GozYNpMQFZJc9Vfp7q3SHQa/Xv2hD3WlAZJlghrw3SBn/rmFhkEWYEUVo45FdTB+C914zkmYSwR/qPwt17ap6e7zeBtBezRmh4TcYN2wWsEvOYhHG44Uo6xnb5YX4xIX9zRomDFLdp9YKU5J0ip4e3o+Z3ntIM0WdwnxWzxMg==
Received: from SA1PR12MB7199.namprd12.prod.outlook.com (2603:10b6:806:2bc::21)
 by MN0PR12MB6126.namprd12.prod.outlook.com (2603:10b6:208:3c6::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.11; Thu, 20 Nov
 2025 17:23:09 +0000
Received: from SA1PR12MB7199.namprd12.prod.outlook.com
 ([fe80::928c:89d8:e8d6:72dd]) by SA1PR12MB7199.namprd12.prod.outlook.com
 ([fe80::928c:89d8:e8d6:72dd%6]) with mapi id 15.20.9343.009; Thu, 20 Nov 2025
 17:23:09 +0000
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
 <nicolinc@nvidia.com>, Vivek Kasireddy <vivek.kasireddy@intel.com>
Subject: Re: [PATCH v9 00/11] vfio/pci: Allow MMIO regions to be exported
 through dma-buf
Thread-Topic: [PATCH v9 00/11] vfio/pci: Allow MMIO regions to be exported
 through dma-buf
Thread-Index: AQHcWgAWTN39XsG3l0G2qITcS04IR7T7uNNp
Date: Thu, 20 Nov 2025 17:23:09 +0000
Message-ID: <SA1PR12MB71997E0FE7E8CD84586FD7E6B0D4A@SA1PR12MB7199.namprd12.prod.outlook.com>
References: <20251120-dmabuf-vfio-v9-0-d7f71607f371@nvidia.com>
In-Reply-To: <20251120-dmabuf-vfio-v9-0-d7f71607f371@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR12MB7199:EE_|MN0PR12MB6126:EE_
x-ms-office365-filtering-correlation-id: 88738be0-af42-418d-280b-08de28597a08
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7416014|38070700021|921020; 
x-microsoft-antispam-message-info: =?iso-8859-1?Q?wp1dBGiSZIbWH2sTAthna1qHPdq7H9MwXZgkwRyj7qFgFxngBrEjktp/fW?=
 =?iso-8859-1?Q?UOSPLuYF3FTuOb0pszaabpY3teKnosWeYr/1g74CLSg8uC7ifNa8zry88M?=
 =?iso-8859-1?Q?YvZHJ9X9ArU49ex47WTC+9SAT8ZwVEK25xDG7tdLLJWiuDwa7Da3UvEB40?=
 =?iso-8859-1?Q?S7jBhCkJi/DojY9HXFrux7MNRxvKkIQIeJ4/yQbAhafVqH/O6vP4A/pQpq?=
 =?iso-8859-1?Q?st6FuasiE4qLKyxkp5wGgVFto+HDauXBwLmwGXOTm4tfD2bB3WzD9hj5r4?=
 =?iso-8859-1?Q?pdWagM+08yfUG6yD1wuWCq9PrbBw0ua5zTROI5XtvfWN5Ytvpj9D28M1uG?=
 =?iso-8859-1?Q?MFeANUcUyJt5rbRJ3LyqiGWVwail2UjhuPa2I6odNwKshsYrhK9YNRyYHx?=
 =?iso-8859-1?Q?qYXHb7m85E8Qzi4seA+NXv+jxtHRuzCBiE2cakZngRQStvSDdTdB8hRKIN?=
 =?iso-8859-1?Q?PBhEDka6lc90EGXmDfH2EVsSMWG0U4pX9Hq5ezo9xrToEQFOkXwnKrSRGf?=
 =?iso-8859-1?Q?dZxlyKY55aQcH2+1TmrKdhfjoVguregGvjvFS67RXrsVUs1BfPcfi2w/st?=
 =?iso-8859-1?Q?QHIRNdICfelA21QL83xP+Yh2TJtCATzxkPMJTqM7GyyY4IIxuOZ+hy9M77?=
 =?iso-8859-1?Q?ZQbDd8sCXtiNIl2GmgsHwGuP3QpUrRktEOENgmglQ+cIEfoulvZJMM2a4P?=
 =?iso-8859-1?Q?UGXmKXDVxtqLabqgWOZhh+EM3G7NWLZj3ZIZrdNKwbrQeIjBue9S8/OooE?=
 =?iso-8859-1?Q?413ENrzdQENXPktnmllXAU2ITAJAxL8Zro0JfZCkUaN7V5f51pSV5XQ0ji?=
 =?iso-8859-1?Q?KjilLVh7t5MsVTtASoDhQWaz3SbkwT3kLsT/Fifqr3YlddvRhFLR6SVB88?=
 =?iso-8859-1?Q?vOIWzSJd18HVGLiNDyN/p7AMlOMaEDxVZQkvKdZ1Y2bpquoe2W4CSPfmnQ?=
 =?iso-8859-1?Q?TMN3JkxcyfGML4/fwdX5GYRbYmtphZHa4pAFkOav5TqKxJXKAR4/mktbKg?=
 =?iso-8859-1?Q?WD+RQGiMjbinDUAnz3Mb7MeiWHk684dTIp6oHNuE/J/hIlo8L2oedyPk6p?=
 =?iso-8859-1?Q?hoRkiUZLjaJwB8HKgjmwwSPmJLnL/ywhoHJQwDsAGqhIlK40piQ8f0+i3B?=
 =?iso-8859-1?Q?/isDvfVjtjthKrBlzcnB6o8BXxlzfqp1VF+PPgdzZLMYgTXAYsv7+7aUJ4?=
 =?iso-8859-1?Q?Y6adW1U4nJ+rwFRc+aLc3NihIzIDZ+7C7KQOAfIwQmJn3fQzXz7GK0E1rN?=
 =?iso-8859-1?Q?5FBwq5D4BGZgrqNlLjfAhDYp61PLgLCgVGfFufu1IxQSg3Imb4tGsZjpgJ?=
 =?iso-8859-1?Q?oju/VNVWo42RcBPk5KoxB3Y2taBq1Eg1WiZuZeEK8f7GNQrGoP87/1uYJk?=
 =?iso-8859-1?Q?tYns8XgCJQwpjTzSZwXdXGzWiuGshp2e/MgPZ0fO7/44ZBcTsjUEOQQBUj?=
 =?iso-8859-1?Q?cEk0rhj3guCKI91d3s5Bp0nLdatxbjw0kmVj/+ci51wKIu6BvO2ZhjMeo3?=
 =?iso-8859-1?Q?rL5iYk1fDrAUeRwctaINnWDOgmfH++w6dVLd3md5qNDwrMT18hd+VrvWdY?=
 =?iso-8859-1?Q?FPE+LDFQzHCR7zcBNFLCLbE2J259XCe6Dlqb760q3vjwyOio7w=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR12MB7199.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700021)(921020);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?pdxBDfvEqC7gReBpiKJOX+sk1G575btf9xgxvE6rqbZloGAXUK8D/7uWoQ?=
 =?iso-8859-1?Q?HkwFd6dKo4/z17Ck71pkRSUasFj9iHiSChVoi19lUC/es7z538jOitinNq?=
 =?iso-8859-1?Q?SxYk+A4mW+uygNr0jFUacjSqPDoQR9RKCvedwEC0x/rkn1G7rJjq5HJnoz?=
 =?iso-8859-1?Q?CXDnRs3Vi9i2r6c/d5pUBfxKyN6MScXXBy9Omy+K2IpBxZ1CF691TNkAe2?=
 =?iso-8859-1?Q?L1NQJYby8zR/kdsnvDd9ym/tLVLL2dU5btkW1TxeW9vQTRC20gG7+t/1G8?=
 =?iso-8859-1?Q?yJGPivjsfLPGnEhVNH0fiMiYqi7+eKYG1BYX3PHoaUSybiaHLKCZNN9NSp?=
 =?iso-8859-1?Q?NtIyskTZBjr/L4xzCTkGBvRXOoy0DEPALBaGuDx0jd+6e8C8NiK4uDX4pk?=
 =?iso-8859-1?Q?3OfQ/on4P0ObPqIMGDJ+65+RU+gOj9tyokhi1OpRcbWsXAB5fUUnEatWpm?=
 =?iso-8859-1?Q?5SCjV37Xti0bjGjJoiPbrUqJDj5L3jQqHG5D2/lD9xrGJNEkq6Wc4gZEp+?=
 =?iso-8859-1?Q?ZMQypV/hGNVO8Yg8AalyVJngA4t/d4Qc6edPBgKIrwkH9W7fhYywr+gcve?=
 =?iso-8859-1?Q?9UjH5dIyZdfXBA8aggs2Q7Gy3vYN6L/wD/L87o7IxHZwBnJ2ic0hUf0Wcj?=
 =?iso-8859-1?Q?UveVMTUA4Ygo5ivBWYj8bkDkC1b5jE4Q8R+f7BDNMM74COGEMIPvslmc2P?=
 =?iso-8859-1?Q?AIFbEYJGderMrWcpldyxhrHd2sS0FTwYh6dFayfFEieVsbKF+N7gHzvCAG?=
 =?iso-8859-1?Q?2UQsRT6yFqYJSkz+OzJpO8xID6gYKgzTSOPuaGpxnjEX+DWxcpcZKMEy6R?=
 =?iso-8859-1?Q?w+jR6XDMQjMs7N73fVV3DqBOTAtxF1282UH9Rv321k8fH1d99pd/3HH9T2?=
 =?iso-8859-1?Q?JS6OQ7787EGclviYOTrwjaQPO68JoRjl+D9c/FpKHKtAsDJATASQ2jhByW?=
 =?iso-8859-1?Q?y8J8myc76qLVxrTHE1ncG7R6V1YXHn0iY85ygXFsAmAnXnoEG9Wcvs7vJM?=
 =?iso-8859-1?Q?g6lE2P77ZIv3ESztlrUYZcnncY2yWrzrDa6zP+Q1QHu/nHfzpnzwi5Bh93?=
 =?iso-8859-1?Q?UHyvzzyu6cH/eZs+RzdRufil7j6lOi/8uW3WaA4tG1xcivsp6VKKJv/guo?=
 =?iso-8859-1?Q?MAN8uAwDJx5XQiTYWejnxLUAfKSZLHy6VxU9OB3igkt/wClB2vd72PBNSn?=
 =?iso-8859-1?Q?9dkR4WSmNveAQrueOYbP9DhNuQtuMrhAjyntCwhstpUMOOWKK00gXMh/Zm?=
 =?iso-8859-1?Q?srchV2w6s1hTJ1z0o0NlvyyTbmrgKuqbhWQhCZPxc63EtW/A2atH/H8rSt?=
 =?iso-8859-1?Q?SEck9wfgUY0GisId16xta4YBh4qkg9TVYahkxsSNjtF4ZYI+O1ymMPi4fi?=
 =?iso-8859-1?Q?vSt3eS3cgYUqFsH+Ya8nBrQM6g62ZdK/u0PiN5U8jbVSYSmoaMgcaLXZUo?=
 =?iso-8859-1?Q?0hqcYQVpM07zT1U75h2wS9LrJ0kzHII+bNn77T4SMm9pbXh/eUDpLZE449?=
 =?iso-8859-1?Q?e4oXPo+pPBNIhO69A/6Yl+Oz/JMLP/BTvX2+RibRNrKLwmPd6BmIlIZbyQ?=
 =?iso-8859-1?Q?/QqBJ2cSsEoNu4tGGGOWRdERlWXDEZj8Xth3EchIaTzR48xIUCk8jLbdkD?=
 =?iso-8859-1?Q?/lrCt+vcxH3q8=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB7199.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88738be0-af42-418d-280b-08de28597a08
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Nov 2025 17:23:09.6878 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KC7D/VTeVrmvf6/f0WMVdoJULq3MysawiYlZxIvbVml3VZ7rbr5VCWe3ZVIDsOt01CZgA3sUzKBrwXOKvr1dWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6126
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

> This series extends the VFIO PCI subsystem to support exporting MMIO=0A=
> regions from PCI device BARs as dma-buf objects, enabling safe sharing of=
=0A=
> non-struct page memory with controlled lifetime management. This allows R=
DMA=0A=
> and other subsystems to import dma-buf FDs and build them into memory reg=
ions=0A=
> for PCI P2P operations.=0A=
>=0A=
> The series supports a use case for SPDK where a NVMe device will be=0A=
> owned by SPDK through VFIO but interacting with a RDMA device. The RDMA=
=0A=
> device may directly access the NVMe CMB or directly manipulate the NVMe=
=0A=
> device's doorbell using PCI P2P.=0A=
>=0A=
> However, as a general mechanism, it can support many other scenarios with=
=0A=
> VFIO. This dmabuf approach can be usable by iommufd as well for generic=
=0A=
> and safe P2P mappings.=0A=
>=0A=
> In addition to the SPDK use-case mentioned above, the capability added=0A=
> in this patch series can also be useful when a buffer (located in device=
=0A=
> memory such as VRAM) needs to be shared between any two dGPU devices or=
=0A=
> instances (assuming one of them is bound to VFIO PCI) as long as they=0A=
> are P2P DMA compatible.=0A=
>=0A=
> The implementation provides a revocable attachment mechanism using dma-bu=
f=0A=
> move operations. MMIO regions are normally pinned as BARs don't change=0A=
> physical addresses, but access is revoked when the VFIO device is closed=
=0A=
> or a PCI reset is issued. This ensures kernel self-defense against=0A=
> potentially hostile userspace.=0A=
>=0A=
> The series includes significant refactoring of the PCI P2PDMA subsystem=
=0A=
> to separate core P2P functionality from memory allocation features,=0A=
> making it more modular and suitable for VFIO use cases that don't need=0A=
> struct page support.=0A=
>=0A=
> -----------------------------------------------------------------------=
=0A=
> The series is based originally on=0A=
> https://lore.kernel.org/all/20250307052248.405803-1-vivek.kasireddy@intel=
.com/=0A=
> but heavily rewritten to be based on DMA physical API.=0A=
> -----------------------------------------------------------------------=
=0A=
> The WIP branch can be found here:=0A=
> https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git/log/?=
h=3Ddmabuf-vfio-v9=0A=
=0A=
Acked-by: Ankit Agrawal <ankita@nvidia.com>=
