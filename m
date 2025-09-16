Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83902B59FEE
	for <lists+dri-devel@lfdr.de>; Tue, 16 Sep 2025 19:59:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9993B10E3B3;
	Tue, 16 Sep 2025 17:59:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="pAOuyEHR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011007.outbound.protection.outlook.com [40.107.208.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EF4910E3B3;
 Tue, 16 Sep 2025 17:59:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I67cICSW5m9nByDMxRxonzblU0Q0dThikgP3cnBstgkjZj69ZSeH9SvR8SWjuOwiusWrpLHOzJPSV1Ww2IVQ9h3o0a89D6cvBQlzYkvQVQbaa9jiOK8v/IsahReOW8s4jp0tT4j/0W+TLj7Wuwi7kEuqNk83a9rWVdJbG5FUA/zy4MYdY2X09rZpPrccQYjaYE57b0kpQBYdefQOSDeb+FhXUQP1QpVIoSRfmuIpqiNPEeaid/SEW4/chIVQstf/ViQwFWx5podiD5qKJuPwU7mGoNIBnS1+VNU3KIjvgqNrlq4mx9tVlPxubOaIs8YACubYis6br6jL6sudP5R9bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I2crGE4jQ6o+NbKFFZHuH0vUhQpg/XsE3ruMoXZtoBU=;
 b=Z3R5d51k4fRYVpZG9Ftqz+t5i5sf3tN+epMHtMrqIESPSX5xFs5jqudHeuoPc+vVvDMl01NN1umuJBD6xsz3JkRX7w5cQB/wZCuNtTsvb90FwQqqk5BN6AmCygW/NsK3J7ZF4ne8uGf/C0Hq+dx2ghmKvF0DOmb3Z84/snyoj6a4odalNP4ikpzBCLaFfLuMa29u66HTtfmP20wKMTiVx+Q8m/17xILmwS6vHCbCX7BUo5DNIMuBM+kzMGy+A4ItlHHGbWWTAjgRwB6dNKd5s9JlDtzV3FG2VsFS9GdDzP9LQ2qGk+9ch0yi4vPc2O4znidxp4OoZgtYmTKjRNUzQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I2crGE4jQ6o+NbKFFZHuH0vUhQpg/XsE3ruMoXZtoBU=;
 b=pAOuyEHRF8hNe0rfbwZ06cBUwQC3VtaAhe2cbQ2oELc7LKLb2Q0XlRsIxUEswp+yzBa3Dbi6oB6lAN3ze1+U+E2Yo0PbSePxGIip2zMCxZp//MQDBXBQRFBzSH2wH8VK4WVMlrdTTetHC5xrlzGXy/NacscQTqB0NGdp/Vyd+W40n9vAp4aHZOeGGvWubC0iPZHf6iLJm4+tUrQEzphvQgJXSKD/fY7hfGrlNTd4lHmvhYa6ZAlaaLLZqqhv0PEajHtNQWF1iMd04MWlwphymOQLwSTyITZ07cGT4qyBvAVCWL5PBIubp22uS5mkyIdWXvDZKSA475JKabMSMv3Yzg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH7PR12MB5757.namprd12.prod.outlook.com (2603:10b6:510:1d0::13)
 by DM6PR12MB4329.namprd12.prod.outlook.com (2603:10b6:5:211::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.23; Tue, 16 Sep
 2025 17:59:51 +0000
Received: from PH7PR12MB5757.namprd12.prod.outlook.com
 ([fe80::f012:300c:6bf4:7632]) by PH7PR12MB5757.namprd12.prod.outlook.com
 ([fe80::f012:300c:6bf4:7632%2]) with mapi id 15.20.9115.022; Tue, 16 Sep 2025
 17:59:51 +0000
Date: Tue, 16 Sep 2025 14:59:50 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>,
 dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 Bjorn Helgaas <bhelgaas@google.com>,
 Logan Gunthorpe <logang@deltatee.com>, linux-pci@vger.kernel.org
Subject: Re: [PATCH v4 1/5] PCI/P2PDMA: Don't enforce ACS check for device
 functions of Intel GPUs
Message-ID: <20250916175950.GU1086830@nvidia.com>
References: <20250915072428.1712837-2-vivek.kasireddy@intel.com>
 <20250916173442.GA1765656@bhelgaas>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250916173442.GA1765656@bhelgaas>
X-ClientProxiedBy: SN1PR12CA0045.namprd12.prod.outlook.com
 (2603:10b6:802:20::16) To PH7PR12MB5757.namprd12.prod.outlook.com
 (2603:10b6:510:1d0::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5757:EE_|DM6PR12MB4329:EE_
X-MS-Office365-Filtering-Correlation-Id: f1c70e98-d826-4b02-57c5-08ddf54ad561
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Rv8YWRCR2G7EOXvws9O3vOcYUfcgmxEH9QD4QPg0YrSDW0SDYT2ssNsc04yl?=
 =?us-ascii?Q?nItAHQFV8Rx2Cdj+70SQPhPA1Hmg0ST3EX4yghgbqY13yDi3PcxixunY6v38?=
 =?us-ascii?Q?E1qkGF9LnQ7X+o3N1T/hWKuFsqCvqvHyAyezdcqsrY0eiZJi07hLEB5bhlh+?=
 =?us-ascii?Q?jV/tpLadHjlFNPs8IfTrNFX8Df/4g6skERFWuoZ1CA4dLCIL0rMUh6j8ltGY?=
 =?us-ascii?Q?3P12U0SvlAF2l5K5HpxB9PpqVbMsw+6oO5bGX2q3Rpwz0rIm+iJ1bfzzxSlv?=
 =?us-ascii?Q?Q7WDaGlxD+rlSmiuSXwm2VLlNPYct5GBvafnRbc1Tb1GJPHIVS66Nq5bHk9H?=
 =?us-ascii?Q?LUCQYD8nQb4sDQBcQ4fAdI92gJSzpQ3oCwuk9lU5RBYU9pCiklglhpMp241O?=
 =?us-ascii?Q?iIAMqYgVJ13Y2NmUhTXGW+VLgYwq43kn6GDqgBCcQwzTR14cnQbj47Sy0gcJ?=
 =?us-ascii?Q?Su+D0HKxZVg6J6f1J+LtBiYwe2bZuatxic9RwWh6zLvuLqioBhjxqDZtixc+?=
 =?us-ascii?Q?6eelpvLnqeKchGXYTtZv0DhKBFB5KluhKfeJxvWK1ASXD1Uf0UCmXIxVdFG1?=
 =?us-ascii?Q?wfJkLquUNLejSugkrst7jUa0huJzfU8bRJ1+5d4Rtc4pCfo1Yyiqrv9yyAWN?=
 =?us-ascii?Q?Hu938sxjKxx3PXnkQwGe+Td1soM5pPXMgr53ghl2MZjhNov7ZtMcS/AIXRke?=
 =?us-ascii?Q?xx7z/4rnvp/kcW1BdDOkw2LiEd0ZcP+RkBRiswGTjSuLMgeIdNnY2+orIFmG?=
 =?us-ascii?Q?0WgBsaCh5YZ6W/XzPLZB8fCHGCABftbF4g/8ov5+KKuavrKkLEUcO35xr0c4?=
 =?us-ascii?Q?lPRh2SD+E//CP0SVGi1YT8LT6kbeuqwaOcJ0fZkarlHRzMsU+7qsxu3RNmqh?=
 =?us-ascii?Q?fIjqsgkVUpTZQdv+YulodunPR6PQUMmWS3twcgU1kynCOkIvzOEskuuqbWA0?=
 =?us-ascii?Q?rDx1fOhQLGwvvB485lHi06H3t2zJYm1mFuhV+jdmTClfBgL4my6NAaFu20aZ?=
 =?us-ascii?Q?LFQr3IYvWzLLfiynQQOJAtCpGyDuen9nKuHaVzEz86EjeWGokw8mkYHCbICs?=
 =?us-ascii?Q?f5aF3dDFBYxWUN/8Fu9Hxr7cHVzlxEx/zvbQok/JgPhy5cVYVW7YwThAG267?=
 =?us-ascii?Q?Xf7dIKNRoS6ELw9noTvfjDYZcGYQrB/gVRebRBhSsSHLkB7RqJdz0F8pe+K7?=
 =?us-ascii?Q?rmuY+zCOGCVjAAT3j6N+KzjIvV4pxFoOlYoyuBfRWsPgTHpYOOgsoWfB6cet?=
 =?us-ascii?Q?n4QzQh82HkHxeYp1Om+j+2czJlhq4AtEyBztw9R50F1vbwzY0MZHBKrtrS7C?=
 =?us-ascii?Q?B0iZevfw8e/MRjD552ZTPCylCmkOeBlEP6jkwk97nn+Jz2apFyWo/ETO+WC3?=
 =?us-ascii?Q?qDRGVj0TD6ymKn9FBn00c0XuHcvhwLMxurIEtkEd+uZuVLwB2P/NmLRIAY5p?=
 =?us-ascii?Q?hHLm6rdStOg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5757.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?e5XxclYhQI6ZvrTT+aFGRoFLoI0b0zOB5cplEWUCbA1x33uqUoA2Mc3a25ls?=
 =?us-ascii?Q?Se/TECz3nG/tHevQ9b4YFZlZ1ZHzD22IJlwFIm/3qRvHviOb/eNi38lcjWRn?=
 =?us-ascii?Q?lt1xQh1SE/2Fchutnta2UyPxcgIjIDqJhpSjeujt4C1aUaRqu2W06UCmmXTa?=
 =?us-ascii?Q?UGXJw+49kCzCs3z8hPOzHxNa5ZuDRdDnGx8upSkFd1lNjCpKSEeVFRO9XDea?=
 =?us-ascii?Q?WxMT3mtmCrzwwuGTY48WGgqp6KYd9+cnkjyv1+T/ckcJ2C+x1+B/rjWHeWVs?=
 =?us-ascii?Q?fPMkCqgwRmSe3dExaLzcna2sPpG7naX3bvGsXDeyVAWQI0wAh5ebqvJSYJgO?=
 =?us-ascii?Q?advCjcZob1AzKYugaOeoUKNorEKkST+GJqr1o+AlPfZ4rYfS7n4tE0h4+i9z?=
 =?us-ascii?Q?XKNMnLANN4iqxNMF6HBAqksnHB/nnFgVeRxiSmNTVOMd0eNqMmTkEEScv+2o?=
 =?us-ascii?Q?p+ehcTkWPNkqkKEh3W3HAzbzLDFBwVXS8z6aFUPGBC80jCVtUk4x+agmyGpt?=
 =?us-ascii?Q?DK8OtCdUY+t8hdzPY4I0E+e7s8C9QMG+ZlvzfZIyj6/pWhc26A1Vfpq243zI?=
 =?us-ascii?Q?pDnYqgT25qAt0YYwVIdl5rwT/vGClDkDvp/HpVOquz0FXMslHHeJ5wduO1k5?=
 =?us-ascii?Q?zl8kbRN/plfUc3V9n4bsSNRNgBKk1MtSWRGXF+VJKPrW3mKu/YiIjQb79b8p?=
 =?us-ascii?Q?ad1lrPuvqThm4OoMFmTODBFgcWVJf4s23hFivDcbNHp0GbIQpurk5YiQQjhA?=
 =?us-ascii?Q?UOVN4vh7sw3bN4JQZ5+eIBfxclSpsYw5PDNxUuSRHcKb+0TfcqIWZgBJ1fDD?=
 =?us-ascii?Q?XkWxwwqOunKPrUP11ukUDKA50MSpvPKj/nhjnYJyVPUcTiPEywQdt+ISIbHZ?=
 =?us-ascii?Q?eWMRC3Lm08WGMjPQt+C+3KpoOwQ3b7hTjD26m9xbSebz9lSGg9le6WiZLBY6?=
 =?us-ascii?Q?c8UDoxgSvD6M4M7Wi3wdCSQ/D5V2y5UVtrajW2+aAiOrxj6bMIB65Z7c6bcT?=
 =?us-ascii?Q?9h3iGc/cak399ZqOU3ZgxjtP5wfKRETNUzpPohCutynIB9iPuwKTpSQTaSGl?=
 =?us-ascii?Q?hTfYQzSR6FxLsHJqQF743cOkoffz+mOPC1a9cb9oQnHhurWLDZLw+PoSFIZM?=
 =?us-ascii?Q?XvqnixYWmS+aRQQwj37fHf6RiGkVOr+ycXwmBNy40c083FE8b/C0dE5T8T9P?=
 =?us-ascii?Q?Y5vP0m1lIXGVXiFrjkiDryvb+ZkgcGNeP0kh2dhIytAY1Pps//lY7+4dxmGS?=
 =?us-ascii?Q?9GCPWKXKZYLCn6dssU6+KXYZS7GFFgaN1pcP3X7hrVqjAPM/H/+GIagBnvy2?=
 =?us-ascii?Q?gcOip2al4GlJXl20/rC7kDUF5TsQIqyPllK3GhWjnkdP6/KcepJaagF05sR/?=
 =?us-ascii?Q?T1zByActozywFSSSh90V3kM+rSlZ3bR1Er5j4vPa6TJ/9Qmuj2WDVSI/zTiC?=
 =?us-ascii?Q?ZTLfgMOsAKujfhVqIxL7htIAnKAbAqf5hWVScNsx17nrAiMPI+0vmB6RMRl1?=
 =?us-ascii?Q?r2TyWxnomm/IaIi+JSiG/ZxKRaMbGPKN3uB8HTN+R3DVAlRyZFsaCTYTUR63?=
 =?us-ascii?Q?M7/OTv8tMd0DhMv2yoT8uhiohyObjPEgEKh/wyjk?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1c70e98-d826-4b02-57c5-08ddf54ad561
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5757.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2025 17:59:51.4496 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J0FTT6PvO4idjugQRARmaZaaUkm5WukF9/WmGOlIegn2RGLgIeonCYRhdlK+R12s
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4329
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

On Tue, Sep 16, 2025 at 12:34:42PM -0500, Bjorn Helgaas wrote:

> I know I've asked this before, but I'm still confused about how this
> is related to PCIe r7.0, sec 7.7.12, which says that if an SR-IOV
> device implements internal peer-to-peer transactions, ACS is required,
> and ACS P2P Egress Control must be supported.

Right, certainly for SRIOV Linux has always taken the view that VFs
and PFs have NO internal loopback if there are no ACS caps.

The entire industry has aligned to this because having an hidden
uncontrolled internal loopback where the VF can reach the PF's BAR
would be catastrophically security broken for virtualization.

Virtualization is the main use case for having SRIOV in the first
place, so nobody would build an insecure internal loopback..

Jason
