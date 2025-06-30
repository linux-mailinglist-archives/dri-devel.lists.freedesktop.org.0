Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 460AEAEEA96
	for <lists+dri-devel@lfdr.de>; Tue,  1 Jul 2025 00:45:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BB4C10E4D0;
	Mon, 30 Jun 2025 22:45:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="WAfF62v1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2050.outbound.protection.outlook.com [40.107.94.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5023E10E07A;
 Mon, 30 Jun 2025 22:45:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FA6fYuyv7sioFd8hwr90y/mtRKrYTV73DSEe49DPxhRvZGd5NTIWtHMWVMWUU1v1mTOSj+mC/2FKmFOBr7kj7vgEms5qtuwVyg8neq+3sQZwEjkRMzIHeBPeRvFCBq4Sgua8CiEFyNuRAXVv+XaYThJYzQT4+e/lpPuz6M15NaJKEKPDs3p5YaKh5182Ns/yt3M/5FM5QXkDLj8dLLKLlrWzaaIIOJ47jFuO4LTAUR9RXeow7cW9XnG1uL8Bo2JWYSuSYHDXBeeEKpY/q3K4U0JOv40Mf4078QFL/2Sy7XXCrLcil9qi7+zUL3E+E1Y4pkriD/uHz1rp5UJ2lbHgnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FHimLNGucV7jjD1JTakMHYbj9dwpcR88A58ApCM6UPk=;
 b=Muu7b3nK5VBh/1FMejQ0/XjJoMxi2UjogoG2TWlBB/ua9/shkpqSxy9LxzjbUyRJPpRfbnrrdOuOS5ORmd0zhrWL7w17eUfQkjKhww0VFXeWH/OG6NUhNFF3nrnJjMUTISrGr9OBjHTtzYvPN1wuWXrCqLDGtTQ2a58NZZuMImw/zO2UfIsJkilk4LraPG/jSslUeIhe9XMWQkC5LFa9yW3Og8OkB92Rr7T7zJP5lWLIHbFCKRgdg4hWr8qsrF8VpNVPsRyJgqO5LSQQJQNz9U6B+FrG94sjBryDRX+4wPhu8/T9uJTMlJOEUqisdnZ16822JyQg47NK5TDDftw62g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FHimLNGucV7jjD1JTakMHYbj9dwpcR88A58ApCM6UPk=;
 b=WAfF62v1h9pquoIsIr64K/yuySDyyurD5jjsn33pidcQ8fqUat/jgS/SVGhuF6VNkhbKZ4wa3q9O4SWxpYphzg5G1+HA/EBbUPTuHpibl3umKI8DTOjlMaGr8k6Bc9R63Uc8G6co/qD4smfmOI68RKHy4u/nekWWT6Bsr2HRmO01lon8q1BBMmT0jmf30S+7URzfDwIztfa2yRGOZQR92uYwBBK29WvDc9cEV5/NNPUfvUuVCtHBx0oEqpYJ6LFaJc2UWYOhq9wTn/fr62yAkrM5MPdGgc747Con4TEpWEyOhAhuFiPE9STv4zEoRDc0R/76FBOVuw0ac+pwzyiefw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by IA1PR12MB8585.namprd12.prod.outlook.com (2603:10b6:208:451::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.23; Mon, 30 Jun
 2025 22:45:40 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%7]) with mapi id 15.20.8880.030; Mon, 30 Jun 2025
 22:45:40 +0000
Date: Mon, 30 Jun 2025 19:45:38 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Badal Nilawar <badal.nilawar@intel.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, anshuman.gupta@intel.com,
 alexander.usyskin@intel.com, gregkh@linuxfoundation.org,
 daniele.ceraolospurio@intel.com
Subject: Re: [RFC 9/9] {fwctl,drm}/xe/pcode: Introduce xe_pcode_fwctl
Message-ID: <20250630224538.GB167785@nvidia.com>
References: <20250429160956.1014376-1-badal.nilawar@intel.com>
 <20250429160956.1014376-10-badal.nilawar@intel.com>
 <20250506181353.GA89958@nvidia.com> <aGMJKUeri98Yjkja@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aGMJKUeri98Yjkja@intel.com>
X-ClientProxiedBy: MN0P223CA0002.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:208:52b::28) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|IA1PR12MB8585:EE_
X-MS-Office365-Filtering-Correlation-Id: 2963a240-f735-43ed-3e6a-08ddb827d692
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?f3J7iro4hiWgFG0IUyMpY7RwtFdY+BMPNyjtIzoP7M5HDCfFLrZ8m73+SGSr?=
 =?us-ascii?Q?eXmF/gxt5L2SptcVIrgJivNXKSU7fROeOUi8GEHbFilA38KWwD69rtkfv7Im?=
 =?us-ascii?Q?boc6EldmvV9vC9TM0X53KtfkCqqxjbIMmq9MrB7mNZ9GiTCmxjw+3RRIv0/C?=
 =?us-ascii?Q?O305sg8uhZ93G9cmJCiezhtQhxQ3J89TjSOjXDIwnEN2RTrII2khJwiGHrsS?=
 =?us-ascii?Q?eBimnBn/Gtq52I2XWLcCo4Au5YBSVK1Jxp06l0PyR12ZUCCKn46yvMShezUm?=
 =?us-ascii?Q?RZrM78LcPnCDkkvKdowKz97PzNPN/7OIyyDd0dmctQ7hRVGuzRgH32HJU04Z?=
 =?us-ascii?Q?TFaVkCYPvnSzsgmTfBg8wpH/2IiMu5DJuCoO90jXTtatgZKJNk/8EnE5FZ6Q?=
 =?us-ascii?Q?/ffN7Yx2F5KyL05Zl5ivslnSQJEPBSIi7FwLDItv5aeBJ6cWaJ/bJr2pOV7A?=
 =?us-ascii?Q?TuR3hrHTDMXse7xTuo6DPAkeCw28Lrp0oBPPW+k8XXx7TxwxhbC0+0A93Nv5?=
 =?us-ascii?Q?Th/I+7ZL+sXUEpq4qcRVNEPYbeE4pDiR2W+c93lJ/85+AoOeptjrHbedndIh?=
 =?us-ascii?Q?v5ju7Gl/s6T5E4FwbzOZKF+AzJx0XSEHl6l5FapardneS1P8lrHINABwKKMM?=
 =?us-ascii?Q?hYjruxZX7Of9bDI62mnY9Y4vGr0JtixebTd8z1L0KmRvHhbaspQVl7s2iuHP?=
 =?us-ascii?Q?bJEsw2JUQgAXGtDWG2E1HlKQzx8df1z/uuLALV8Urr0rG0eBgsxiPsgv9Z2P?=
 =?us-ascii?Q?0eQ4ZICo3O7JuNyRO/aHUnZeTmI+MEZ4NQaV27T3JM0YeGX1UoIntg+C1lol?=
 =?us-ascii?Q?qUIvCSubkNWjEm+xK1zeMcVLwVDDp3DhEocmp8BVuXMicwdHEk5Sn7d5H4hQ?=
 =?us-ascii?Q?KGKVzoc3K453WxDrYW6P6qATngQcAnTbvYOoC6EEeIdIjsINbCoI7FGGxHtB?=
 =?us-ascii?Q?CNkXF8DwkK+WJU7itXoSm6kfptYz/SCjey2Dt8vwlFHY0rUs9YG3biGfUBpz?=
 =?us-ascii?Q?oguH4VN5pMQgIT0HY4djDZhaiD9qVa7RUBqd6n76pdBFwUWIXO52tU5o9Yin?=
 =?us-ascii?Q?XXG6V5sSL7wiXPv0R8ZEWhC5Pa5kVkab5lDS6g9WhmABVoygWvPWAOjGr6aU?=
 =?us-ascii?Q?1XJMmC43Sd+b6tdE+FPjFPGpMJRV5ltX4klstpHXKSq/ghvee3GaRRl9tw6c?=
 =?us-ascii?Q?FGXrpVdIFS+UEWnmtOCKsaD5FZcvymrugLyvmL9/PCs4Oxl/SMyIO12nHuJQ?=
 =?us-ascii?Q?aF+b6SUsNLwsSBWoUIwAqhyyN6e9+AGli/s4yRCbgX+jjpOJgFA257nVvHcB?=
 =?us-ascii?Q?m7FlO+p26djaMZKpmR12qOXcHsK65R7+ay6ddAq9jsIXRX0fMSopxpbW+hJY?=
 =?us-ascii?Q?/2uDo2vaKP6v+/sFJpBq24nCm/CK4yEPTj+DzORSF5l+N+6mHXVExBhRZoTg?=
 =?us-ascii?Q?5duI5x1/+tI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR12MB8659.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tTAH543bOP3qh3kKpc0M/lwLR7cGRU7wnWoZUIbKtKtwXt+Q4Lqgspnn+1GV?=
 =?us-ascii?Q?+SRQU6ANPrWeNWAIu2TbijGn3NIc/NL537TnN5D3X86w2ZRrL8DimwHzpTBe?=
 =?us-ascii?Q?ygzFRuYeocWVcMTU9XYCtebO/3/9vF/I44L3bo4l3Rwt+e1zWwPmsDixTDsf?=
 =?us-ascii?Q?Q8pJEF75ahxiaVN0y9dA1/4Vy1A8IZXhIxHVvV/1TdyY6ufQw2oTb76x/KjJ?=
 =?us-ascii?Q?oiDWxixs8E8G2L65pwMvHSCePABFoqwc9qEG3G8BREabV4UpBIW7GoK13sv+?=
 =?us-ascii?Q?ntfvLeb9ynen5rnE+Ihhy7s4doKf/TXwR/Km0MWIfdz89SqLyVGwWs2aKoWK?=
 =?us-ascii?Q?B1tGUBU4Xo3yK9RvlXXWhVYU8NbolB007AEzxDot4t2C6rEXKUYx/84kllOJ?=
 =?us-ascii?Q?mgR6h9yOYyBDnFqlAf0L8pX0bT8cKL9oOwzx6TI6GFswaTuhTMKMjILn39gC?=
 =?us-ascii?Q?qPYHDcRq5XV1SXHqVVYEloRnfSoZBFsFMiKpoZ9KTTzFDAXAC9cUil93rKuL?=
 =?us-ascii?Q?6nDmN0e6OmpRJ10P3RYAkFx4OjwTpWJrMBrJbgugmIcg/PuRqb8ecCEDkcvg?=
 =?us-ascii?Q?MM8QKfuDTJSKQxv0o3skaOL/2kriVMi7tQejA+Dwk8QZOM/1HP8n6wxqnIJA?=
 =?us-ascii?Q?FiN1vF+F8fc6vuom9EWw2gGyQCPzB5JtQzkLNPuJaUtDpBy+bs/Q92R7f24W?=
 =?us-ascii?Q?36ianH4sgX6cS5lUk3iG9DDGXs6POM6eX45DTYWBgNin8sD/EbHCodUT79X5?=
 =?us-ascii?Q?eYoOaA0h7Ab6iK1/a/GI+HrPJKNBjKcwQGnWlLVtylLwt6fflmZh6ngzrAIa?=
 =?us-ascii?Q?zaOC2rOjMifLjyraqAsV/WppK2ho+ec4V+TwiaRiJnFngM6fDAPFPYKKD0lw?=
 =?us-ascii?Q?6WT1ctaSheEdRIschOij5I0//wEEyPjjB+oaK6E0rK0yoYJWfLYnIg32QuLp?=
 =?us-ascii?Q?omCKM4XxXLGHNpmxC1jf2bOtiQMDeaM818M/6gTErLYuGbTb4M1m1aTuRxLX?=
 =?us-ascii?Q?Hr10/jbdd/XX2/A1ZayTCQdwxMUtgUFLgFYI+VF2x4fqEso9TAEw8JOrIXOC?=
 =?us-ascii?Q?O/YZRm7YCfUqtDhxd3/TZ2qQimCVw1eLbwaochvkmLkijLOAZfOB5q2X87l+?=
 =?us-ascii?Q?Vg4j79zN0x8GStG/+EBY/+a8LE2l4bBFSYyooLzd/wJ5kvEOIxL+3FV+dHSp?=
 =?us-ascii?Q?5dcNJkl5E+E3Y0W2EjFJbRHNqZnKkOtAXZGhT52D2e7/QBOQeocmHfdzJjDu?=
 =?us-ascii?Q?XaIEXmwoMJGEnh/8LjAb6R/GqD4VTxfViePOUl2s2rTOL9obdgLGySByp5Km?=
 =?us-ascii?Q?TI+N9xLtQ8sBfnxO6sXP0/3Tur9hJA40lbkCrWkvA9/O/MIbC+f5LPFBe1Rv?=
 =?us-ascii?Q?uV6Z8/GFaWo15YbVtC8R5aE4LqT09hUpLsZN0+lmVQsw8y2jWunTAkQKP3jg?=
 =?us-ascii?Q?qcT4q3himtR+/Kqxl9p5HJO18clnKxq1GaECWd31ikO75LJ+l4kU04vY1Ebn?=
 =?us-ascii?Q?cyFndeBCRTA2mEgKkn82TXkkHqj7CgN4C9bDQ4G1wNB4V5RyVxNXdBJkv5/o?=
 =?us-ascii?Q?GXikdcl+dLafu4LkPRX6lHEq8/rcU41oAcj/ZvpZ?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2963a240-f735-43ed-3e6a-08ddb827d692
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2025 22:45:40.4515 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DgN4p6nStetoP6WOpGZpC20JrgZ1WX3yd+QKMCQRzJnr044gO6q6qZiXFz0RsEZ+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8585
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

On Mon, Jun 30, 2025 at 06:01:13PM -0400, Rodrigo Vivi wrote:
> On Tue, May 06, 2025 at 03:13:53PM -0300, Jason Gunthorpe wrote:
> > On Tue, Apr 29, 2025 at 09:39:56PM +0530, Badal Nilawar wrote:
> > 
> > > diff --git a/drivers/gpu/drm/xe/xe_pcode_fwctl.c b/drivers/gpu/drm/xe/xe_pcode_fwctl.c
> > > new file mode 100644
> > 
> > I really do prefer it if you can find a way to put the code in
> > drivers/fwctl instead of in DRM subsystem.
> 
> Hi Jason,
> 
> Bringing this point back...
> 
> Is this a hard request from your side?

No, cxl didn't do it..

But also we've seen this go bad historically to just randomly spread
code all over the tree because it is easier that way.

Jason
