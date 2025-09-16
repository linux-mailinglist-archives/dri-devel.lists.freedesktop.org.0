Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F31DB59FD9
	for <lists+dri-devel@lfdr.de>; Tue, 16 Sep 2025 19:57:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CAA010E282;
	Tue, 16 Sep 2025 17:57:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="eCZDGuX5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010061.outbound.protection.outlook.com [52.101.56.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5889110E282;
 Tue, 16 Sep 2025 17:57:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YcS1XOgFav05BZ+cHahM1LRQKyRPBCGWDKOE2KaEU1OnRnLHL+QDN3QVAhd0KzyhuLZNTAy5HL4w6QYlDN2CkUFsMuv3jDISW8vQv5TGyPczLw6zr/1r+yPRjiEwcYPaB563S8mqfV06nNgJylHPDINizpemsrfXHjoHOWTk4REudkXtnkSF3bFCx4ZRsMGRg0FmbmDxZaJmBeByyMONFjQsvuU8bV6+rGLIeOz8BgakKdmptieZQBVUTyE0ssanhg4mWUXN1venMf5Q5xdb2uKubtpwuYNKOPAXzagKf2FLtFKkur+zccQflxnfXdN0/1inw6Vmb2womGpSX/2y6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C9vai2dE2m/HwDXImSPuK/PHbu0ch+G+VlLqHXFAgEk=;
 b=ILX4aV9RHch2TVWzT+NqAnX5r2Ggxl5TBnbChrYWdbd6K5Crt78a4i+LnokL5UhnHRv+RPCAjBRM185LrNQkYeSM5x7kC957TnJKxejqSrvRQIUDXGNmeK/pSmzpflftmyXc7v/tLCxZnB2E8LPRUVWug/6aRcya1OWtHrtShLKT5ACquDLY2X8I6IG37ZbK/o7vDT9HA9yZgPgRan4ODUpmlSldmmHEjMSL0tIfHmRKP3c/Ntarz4fkurNzdqRP0me1MGcukVOVSZTuzeS0efMmIg2I+ugoQwCNbvaIUmuR7T5sCngK194NFw95ECpM5FZPuS4uRPPTVZrCC0yumA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C9vai2dE2m/HwDXImSPuK/PHbu0ch+G+VlLqHXFAgEk=;
 b=eCZDGuX5hNKUMREUKznmFh3q9N7iuMA7AejjYA/micECMoZmzWlEC33cmERmh5WmPGWNV5PjIxrWGi8cL2Zr6I8Q8zZq1rQ8psR9XxXCgKyGHdfm7Chlxm+Iv5OofpNg4vNLRcXkzEruK3HTZRHP5NuEe8ljGq0WcIgRgwLKCMOfFo3/rwCcDCgvqeR0OYZJVxbNUYnjbASpCOI5xZ36IPZZkhGbc5MrHCk994e2rpdzMHJgTPWxcxjwVPyKFbA6XfAw11uG06mTOTc+T1u0ggdBh/qgEdoW6FCMnqbqh3StFnKhpNxoPMZlV1wxjNtjUJRdPr0SJvUV0AiDg7oDZg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH7PR12MB5757.namprd12.prod.outlook.com (2603:10b6:510:1d0::13)
 by CH0PR12MB8529.namprd12.prod.outlook.com (2603:10b6:610:18d::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.22; Tue, 16 Sep
 2025 17:57:12 +0000
Received: from PH7PR12MB5757.namprd12.prod.outlook.com
 ([fe80::f012:300c:6bf4:7632]) by PH7PR12MB5757.namprd12.prod.outlook.com
 ([fe80::f012:300c:6bf4:7632%2]) with mapi id 15.20.9115.022; Tue, 16 Sep 2025
 17:57:11 +0000
Date: Tue, 16 Sep 2025 14:57:09 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Vivek Kasireddy <vivek.kasireddy@intel.com>
Cc: dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 Bjorn Helgaas <bhelgaas@google.com>,
 Logan Gunthorpe <logang@deltatee.com>, linux-pci@vger.kernel.org
Subject: Re: [PATCH v4 1/5] PCI/P2PDMA: Don't enforce ACS check for device
 functions of Intel GPUs
Message-ID: <20250916175709.GA1324871@nvidia.com>
References: <20250915072428.1712837-1-vivek.kasireddy@intel.com>
 <20250915072428.1712837-2-vivek.kasireddy@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250915072428.1712837-2-vivek.kasireddy@intel.com>
X-ClientProxiedBy: SA9PR13CA0136.namprd13.prod.outlook.com
 (2603:10b6:806:27::21) To PH7PR12MB5757.namprd12.prod.outlook.com
 (2603:10b6:510:1d0::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5757:EE_|CH0PR12MB8529:EE_
X-MS-Office365-Filtering-Correlation-Id: bd2b80e9-1d13-448f-7638-08ddf54a7644
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?xFPNB6LIqcOndrp9DUcYphwBQM9NKbX0XqbdXuPZqlaQ7he1kVzHnQ0Q6uRH?=
 =?us-ascii?Q?9HhDaejAX6OZ7DZjSMk4LzHQjHLpmzVBLM+EAQZZ80gBQLq3u76NqlmOcPnR?=
 =?us-ascii?Q?UAMt4fWTYfk0s+/LFzBepB4YWEhS4YusrqaF5iXbK894sk8uLr42DAXo67qD?=
 =?us-ascii?Q?ePWFOHFh0z7N8aI6k1Y6QsEk7lqQU8u0gObjLDTwL4hp9dz0t5uQ+/0uWNMo?=
 =?us-ascii?Q?E2Vcfui/t3fHO8cJgM7DNllzic+gYfOnOjquEEXPRIOgykTEVGZ89dnODMiE?=
 =?us-ascii?Q?GDIpLUYDBM2j3WXh9LB41/AkN6ZGwVqpz6YlVDovRGuSthBv0HCRvq33mWK5?=
 =?us-ascii?Q?vPbCJ/KDSdvaCYSQQB4Xx+a3nJaGstUT2svSLj49tNoNujl9WuTNpUX7ddNf?=
 =?us-ascii?Q?aNizYpewvPAKu3979KFTz0ue4YO0qLqtOxk5IofIEPx3kkohScMumw/JqBhm?=
 =?us-ascii?Q?z412m6+PwPyFH2i6N9IzkM5mL6EHMaIhFWLS1Xx05IeYmDbqi7f686KXa5MZ?=
 =?us-ascii?Q?0RNbVOE0t9rq0KUFjNME942uY8tthSNT+LDVCrHqJQKHmztislqNLKIFWgWw?=
 =?us-ascii?Q?0oP0NvZNbepcAOABnWDEICjM8dnrrkMuVNCNoJelAM7EmNIj8G9jzHU8TDxb?=
 =?us-ascii?Q?h6PwPVYGnH9cLHQZ1EQEVp0TRxKfHMLNSTNM5JJnIqf3wN6lBNrv01uaqg8G?=
 =?us-ascii?Q?W8O0in4jXgwoiIeimlIhOI5DF3RAdOSMmtgQ3RoKh8ExlFPGmfP/Yqhroz6+?=
 =?us-ascii?Q?fCqxIWkXcJh94i5tzHxCr+3CwT5xGETGWbg1b+EUrzaQ4wcqWIAEbRPuOEaM?=
 =?us-ascii?Q?ijskyHGmveg/ZEFgpN5r/9Hgw6xpyFkB/PvgfPojS+jeyotGdPuSO+eaPBFK?=
 =?us-ascii?Q?Iyszwc2XmUJoEQZS1gADMO1FaxTaxdQf1HSjZJ5K3N6+yMEiyg1PhFr7QMG6?=
 =?us-ascii?Q?IoApltXvlNdcoBcyU+aY6WG1KP8/eLRj4x9WCuejj92hbX+y+V/kUtdS/oAQ?=
 =?us-ascii?Q?hprIVc9GcPgjqIfVZfnTV8nW8bENE1Hgro+prCGbpr2Udp+sPPeukzFtIZcP?=
 =?us-ascii?Q?iuzUGOD/6lLSHnwmRGA2JS1qVXx3LKWYH0aiJr6zs/d7RUTZBJLIpr2QkiwQ?=
 =?us-ascii?Q?lnh11Qaf0zb+27rm1Q3f4NxTTZt+oYkIJPy8p7VKb8XKRm7hsorU+3m/OgwZ?=
 =?us-ascii?Q?63LJPCgYG+KvMc+Yp2MWsdAtPwQVpyIYQVZB7Cy6lUUGUk+52YPgLMFq/Fj4?=
 =?us-ascii?Q?e9s4FvTWZm7SYJO8IY8/cXXhU3D3BO8ztyvChBU3OnHJ4Ll2Moxg7t7+7ARc?=
 =?us-ascii?Q?u775eoY5CF1j2Oofo5O8Rncj3/NmikjIOePIcYZgkzGeX+B0+eGI9cjnpKmC?=
 =?us-ascii?Q?W3Z1AwUsfwRqEa+nVFbETg3ucMHTzfbgtBcOR+qen1e9/OOPKg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5757.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tJ8lNekmKt0r0oxI7RhHjD+pVGQsbqTxjVh7ps0ESdJFcY2lcuR2SAXyWInQ?=
 =?us-ascii?Q?K6exrE6jyL8/QqixMG0ufKyyvJp88MKZCvp5jHrgz4kxTIdFQfxyJicVLBXS?=
 =?us-ascii?Q?P3n6+qJqw60NEcqJ47M31D18bTRU7sHOH7Oo1QE43wTq+1K+8X0/+e9AxILe?=
 =?us-ascii?Q?PkIMZJpwv43NOnIcssy9+7K34gHdofkGeYhIlghd126jgdurbAWly1QM68rw?=
 =?us-ascii?Q?7r+6vBuPClBuBB/cwG+Ow7gxZ8vr8qiOdM0t1ZrXOZDHFWHbAJt2G919+PCw?=
 =?us-ascii?Q?3XVh3nQV85hFaN8qCXdWutLORiWs1ZrTmp/uPs4Vwc77ANPVCHWAZ0JDFbBL?=
 =?us-ascii?Q?Dbc1UBXCWG2C8S+ZZvKJAO5Vg626GQCIPSrRx+GiA+bq4DNzMtE0MqIYnfSH?=
 =?us-ascii?Q?mzsGXGogaKKjMgJqsayprPYD9eRIzaTwwO/j/ohffqsxRN7tbztW/WccesTp?=
 =?us-ascii?Q?jipD5D/ue6xyFClJVSnPqOqdrUJU3BP5hlXPtxLKCgtDPJZqWsCBYl9YQecP?=
 =?us-ascii?Q?lBJhMSjD/4/1PjOA34ArqZEhiO+W6EmYRUyb0/yb2ePFdgRX+tzP0kRubtUa?=
 =?us-ascii?Q?8MJqVaIcE8tX+c6UA+WxLanhdZOiBVTAM0JK3oMlgrESQ8KyJpyc4bnBFO52?=
 =?us-ascii?Q?9AWO7Cp4V40FU2vfuxcnqWpceLvLNaWHr7KQrxlId/yImDO6vOToACXwBzaQ?=
 =?us-ascii?Q?4vd2GHhg64dktClJtoL3NIKmFDYhL8SoK6Cmvq5KC9X7K1b+/L56VVPLcdtW?=
 =?us-ascii?Q?Pc9FiHvDfxUBEzo/zW+3M5Wq2z7qSU28NnhZJEZHbAysaOBPz3Sxh1+MqNHM?=
 =?us-ascii?Q?ykkqhSovz8H2oeupMpiLq7/C7tKPqwg/E6b6dwjcIAjTa8BMICFv8SUpCEMc?=
 =?us-ascii?Q?dz76rb6Ae6MO8JJtK73VE10m4PguHYMlYKj8q0Zy/nx9wnaQ/wawkdniz/JT?=
 =?us-ascii?Q?7ZD2l+zY8qL0bkxg8spPJgz59o3H0gq6QUi8QArut2shDKq1l7/g+FfPQQ5u?=
 =?us-ascii?Q?ga9NOnwzpLUDvK8maPJDMAPIScGj2Cg0Cgk7DHuEZ8pA2iLakeLvVFIGngTh?=
 =?us-ascii?Q?mvPH1UDgVjCQ7Wz7+Ha4a0xIeFi631f5o4jil1vZhJd/d3vF5rO+IK0aWrWm?=
 =?us-ascii?Q?cbHSio06BMQjVESC4DJtynqA86XtBdJlRh1vceOUlgC+jQ/XmmppkxdGYbds?=
 =?us-ascii?Q?PZQzJ1GiTUHWIk4gffH2VE+8jFJ1fWblhVD0CMxVGdKORjz6QJDU/NykuyJj?=
 =?us-ascii?Q?/rrng5wNsLx9b6Fmht8PuYyJsf/oZySqY0cMkCot0y3z7hbcAiCpHvZYRvsd?=
 =?us-ascii?Q?IJvM3oA/QeiDeSDzRlEXpxoXe33bXrBNZCC/GDZYeAb536urogfW3qxHDYda?=
 =?us-ascii?Q?L/9yfeGLx+Wt5MwJWFjUQzz5dvnslABW2UPYj08Tzrgv+Xvvqf4jxCRB5tnY?=
 =?us-ascii?Q?jyKS1e2aiP7+41FiWv1uHOQ64fTKKP/yRYlfUDJdKCdVD295UcofMq7jlRv7?=
 =?us-ascii?Q?b1Sa2O5q2wZsT2z1Vq/79UvDf9EJ+sfu2rJ6KeNcEyh+2kXAapcsdTuQ3qlZ?=
 =?us-ascii?Q?nT36xixVXNMatygqJeQGX3ex9WDEgOwUwqaRsiFS?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd2b80e9-1d13-448f-7638-08ddf54a7644
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5757.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2025 17:57:11.8539 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AuH5N5aw63fXxRT73fk53DWuSNbN7CVxrfQkCyK/ARurLgYI/xYOqNPVXbNizmMc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB8529
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

On Mon, Sep 15, 2025 at 12:21:05AM -0700, Vivek Kasireddy wrote:
> Typically, functions of the same PCI device (such as a PF and a VF)
> share the same bus and have a common root port and the PF provisions
> resources for the VF. Given this model, they can be considered
> compatible as far as P2PDMA access is considered.

Huh? I'm not sure I understand what this is about. Please be more
clear what your use case is and what exactly is not working.

If it is talking about internal loopback within a single function
between PF and VF, then no, this is very expressly not something that
should be expected to work by default!

In fact I would consider any SRIOV capable device that had such a
behavior by default to be catastrophically security broken.

So this patch can't be talking about that, right?

Yet that is what this code seems to do?!?!?

> +static bool pci_devfns_support_p2pdma(struct pci_dev *provider,
> +				      struct pci_dev *client)
> +{
> +	if (provider->vendor == PCI_VENDOR_ID_INTEL &&
> +	    client->vendor == PCI_VENDOR_ID_INTEL) {
> +		if ((pci_is_vga(provider) && pci_is_vga(client)) ||
> +		    (pci_is_display(provider) && pci_is_display(client)))
> +			return pci_physfn(provider) == pci_physfn(client);
> +	}

Do not open code quirks like this in random places, if this device
supports some weird ACS behavior and does not include it in the ACS
Caps the right place is to supply an ACS quirk in quirks.c so all the
code knows about the device behavior, including the iommu grouping.

If your device supports P2P between VF and PF then iommu grouping must
put VFs in the PF's group and you loose VFIO support.

Jason
