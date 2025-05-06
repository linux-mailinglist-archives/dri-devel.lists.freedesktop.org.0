Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F154AAACCE1
	for <lists+dri-devel@lfdr.de>; Tue,  6 May 2025 20:14:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03B2A10E0DE;
	Tue,  6 May 2025 18:14:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="VOTU7xa2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2054.outbound.protection.outlook.com [40.107.94.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1639210E023;
 Tue,  6 May 2025 18:14:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KwA/SoPyNCd5m+4RQG66aUzXYu7WUwbdNs8QZANnx+PDzw1WUhgRerogy2xb7wD1IXHmFa5eyFpP/xCLe1veO+Z99zP3cigu/atwCa0jB0mC10RsCZzJPxbWPIHK7h8CLKUveSyat/6Ab1nLITYdWqt7TYANsyKb4+nwFD3iMlLJ4UhEH5aqr5WXZ5hdfopcBrfceaFSA1xlFbt6/mOGxyUMdRxVZvumoKmoKfnUGxCboD+QnG3JkskyUQG5+Id46rtQ3cAWGaw9l28evZ6g93OQjQaCyYKRzc5ZhcVlhu9YgxD0gUvVk9XMUYpzNu4BzDFJ61QEm0sl145mLSYYpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z234Abx2tFx+8kAE4lT1N4cmV8eAJ5HP70s0wDXuuPU=;
 b=zUDkmsE7lxMTLD2kVfUdoaQ5DrVFCpAG2qhbEeH9dUzbMLVhm6ArqdgtzcKhM2mEiELYQiaRXGPfYa3JzGDG5QfmwUrzqEfKQE4411S0NJ4yjBL11g2KeNCUDtUZA8YfFBKnoQhciBRd/ZQeIIkQ6C0GZD7ERvFas5rm2im1FhNyol26YJVDxiIteb91l45EShJMYWTjKU6QMkHEE8OumvfedMtkxY0FZxJTEjIh5193K3Jh3O5vNWcaIBARksQK56AnodbTMDfsumpZM55yvIhnVVh8GlLhK33Pzz9Rxh34M/Gzabht+3ixQWF8uuD+FtDZYyGLdvQ2ThLsAQ0XXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z234Abx2tFx+8kAE4lT1N4cmV8eAJ5HP70s0wDXuuPU=;
 b=VOTU7xa2w0Nq1OPrF93y2DAu08Wh3KJzWzxXp1QWhpB73s143CiT9cV3qI83odEDw7bSmFZ7ZcbfxTESrfxKTxrHSqyGSlejZt81uFaSpAXRqwzajo7LRnqasZv77oKY0wKr7qGwY7ApY46v0X8y7F8K1B5mCwA/ULc4mLX7a7fqxJG5CpdtNTJedRLv40I+p3zO8NuQkz8GtPlkxcMnA36Ei4Vg36EQI9eIIA8zyv4Y1fiPCiJs3WtB7mpa1LMD2cGKzu0XcqH4eEx2xD4xlfoFNs2SgZ6RaWV6kzd+yEkU4ldp8MZSL3ZLaOCHBL8XwyM7AbTn93Zqbva7uiyTeQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by MW6PR12MB8999.namprd12.prod.outlook.com (2603:10b6:303:247::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Tue, 6 May
 2025 18:13:55 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%6]) with mapi id 15.20.8699.026; Tue, 6 May 2025
 18:13:54 +0000
Date: Tue, 6 May 2025 15:13:53 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Badal Nilawar <badal.nilawar@intel.com>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 alexander.usyskin@intel.com, gregkh@linuxfoundation.org,
 daniele.ceraolospurio@intel.com
Subject: Re: [RFC 9/9] {fwctl,drm}/xe/pcode: Introduce xe_pcode_fwctl
Message-ID: <20250506181353.GA89958@nvidia.com>
References: <20250429160956.1014376-1-badal.nilawar@intel.com>
 <20250429160956.1014376-10-badal.nilawar@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250429160956.1014376-10-badal.nilawar@intel.com>
X-ClientProxiedBy: MN2PR05CA0044.namprd05.prod.outlook.com
 (2603:10b6:208:236::13) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|MW6PR12MB8999:EE_
X-MS-Office365-Filtering-Correlation-Id: 38fde0d9-fb03-42b5-020d-08dd8cc9c304
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?MiJDckvnkIhJzT7aJVm8Szy9NdtOwUC6SHn6+o+6fq8biGpJVgnGF0/wvP4i?=
 =?us-ascii?Q?PlnlosKZ4CXh6vAS0OtBmwnb2OvcnYUZcQujU3fYCfmoRxu3564JMkZHLE0U?=
 =?us-ascii?Q?Qa3Qd6kzzfk3Vf4tJG4fnWI5RGRyf3ZnUeTYGPnbCYo91J3oxQuGQlfDLXD2?=
 =?us-ascii?Q?lHNnYpiv95gY4kbunjJA9e4AYep0R2W4UVpVGMXFB1PrI2hCyAW5lJWYuX06?=
 =?us-ascii?Q?rzo4NQOFxL7bX4GKmvXdLr28ykIW3aeACB+3NhmteBE2Qb3kBHq4eJW6rCbH?=
 =?us-ascii?Q?y6ZemDtcxukwDAC0HYitTJOlN3XBvQ500nXr06839GoXfdm4/e3/QiHAAu4j?=
 =?us-ascii?Q?5n8XdrQLMBPFONkW0GOIo+nbmThizNL0n9YVxRfybBa1ht5XuN6kMqTtQ7/5?=
 =?us-ascii?Q?iVnS2zd623U9lHy/89HGjDzSPUHq5qK/bPY4NGOxg49FfpHl9+YVtxErfeZk?=
 =?us-ascii?Q?qzFhlD2j6afHXGoax9WnrjgzZbzrVZdzmuLTgSMaXA3H84e0wFqDaca6Lmxt?=
 =?us-ascii?Q?k3PLwv/TY4BEYzYqRzO61Znekw7RFxRHpSGX/krwPf1z0I9clDMMRYkYWBZ/?=
 =?us-ascii?Q?AIhV0pZjDOw3zwrLgN0Z0Hx2Jxy+Kn01CkIBXR7HRQTPkfB+DBLJHohVbRC0?=
 =?us-ascii?Q?zeyFsCqtXzL2R0h+0fiMb64WrhWoD96z65AxSvqAcAjgwLHMbeUZcVB0cVZe?=
 =?us-ascii?Q?i6YcOCE7ddccMnVviidhi8tqpsdEPmBx3j6PRDczS2SJdPDU1WbJU/cpi4O4?=
 =?us-ascii?Q?cOH7/+eS782cf5AkI2nsr6Dbpgt1jQlSRGRshiwS3rabHnU/VIxi3I5EZCGw?=
 =?us-ascii?Q?QJKLwJI+OK6pti/rtwd7KMT0K2X6eqq88Hwj153WTMcfVnHFuTG/lzumNn3E?=
 =?us-ascii?Q?MCyT3wzQtN/A36/0BJ8O/7LU6c7ULg8VdAr00+hiOOsHTPLMtEOJA6wd2+Tb?=
 =?us-ascii?Q?ws7sI68nbqJeIW8JzAytw8hWaLn4Smkr52O/sc8YkvGl01k2fLYL2Mc2i03s?=
 =?us-ascii?Q?ON4Mgg6A3JRvS+KzD8GYPZtD4YCTF+ByWCAfJZ+uGMGapyQVvdTY8ujpzOts?=
 =?us-ascii?Q?YoUk/YCph6a+YVz/2oE1q3hq9Q6Js9rwNPRdag6G6fC5aAyRcZQVaTaA+WQU?=
 =?us-ascii?Q?UX3EI8SPd05VIQzXDE8d6BHx/7972VgEujHReQp8yk+wH8UXNm7wyOJZD8mT?=
 =?us-ascii?Q?X5SsTpoUZDEJKBFj7TyK5rptyRxpMdVpn3tHyMnodSO45dRDnBKB1pdqgVuW?=
 =?us-ascii?Q?u3OOGO4siI3f50lp0Wdg0mKzaYsy+K6i5nnt4Zh87Ol9HY79Hp7Ot5NuuQZ6?=
 =?us-ascii?Q?hzIxZl7jtHpCxAdWfjexwjul7edPM10OZo1UAjao8S1U8RSiqhlbHyeCcoot?=
 =?us-ascii?Q?qVy9tXRRLdmsOBCoXH3Zy97OAbjCtj5krbLvTmG2czZbyHZDLOsiMCf7rTuh?=
 =?us-ascii?Q?EnhHgI7Mo6I=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR12MB8659.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MbO5EWxm/5GVgUxRkqBf0OUrxr7etpvzZ9TRYYg5YaJ+DVD57Uas91EfD6Kw?=
 =?us-ascii?Q?MvaIv4yFFXgSlwyUhs3JyOQsOVQ4QDDcmvsHSm75ErHEtKeOe+c7yYEwiZKH?=
 =?us-ascii?Q?PFWwhJPgOlzvIpbsenm87RDWpK2ef+/wxAu1Pt+SLXhhY1HeehG9tHLapbda?=
 =?us-ascii?Q?uDS0G2n+A0TOhyY32DQKxwGBjj2lZ3T0EZuyrL4GkMULnzL9UllTYTU4cXY8?=
 =?us-ascii?Q?TRXTW6FSce98KwD+GHq6qXGuX+JQkefANQjf8ziNdrY2xdN0gb2+zpFfIc04?=
 =?us-ascii?Q?PGj6nRTZyYtOmydt3HJWfoTN6GSKPjRdDgXL75TKQA/C4LSKEgNbKaEZzcJK?=
 =?us-ascii?Q?uAfgWhNiIovRX/i5/UsG8qygxbd08YEyAvQLB7x7zluJNzj8Hfaf+3+o/R0L?=
 =?us-ascii?Q?bAuotRVAgYFBoWCsrqMhCakKbSgXe+NkvhNDof9VOoUdRhvoouWADsnybsfI?=
 =?us-ascii?Q?vni5PN+fF3G6W/yV+DCHJzIQUfImDw3sY/bykWcV0ybVkMmdRqVD5xllfCKP?=
 =?us-ascii?Q?kdIz7QGMwnw+rASsGQ7S/Bz4Za3jB01mNMxB3oI/JIDZ/t9gCJEBCbmYhPZz?=
 =?us-ascii?Q?1WJZfcwk6M7Ju1ucXid9iba57/fpr+rYDls1VInRxKoMKbe6FBXFzcWQumcv?=
 =?us-ascii?Q?tXw5P/LEor0vUvXIe4Za9U2FMkYHY6pr6kUxmhoH18/oq+xvKF/bjJRJUBEe?=
 =?us-ascii?Q?J8fl1r3BJqUljuqxXsPfJQFmMdAqaqG5muaUi4vppVePDsb3pszaeyYBGX7p?=
 =?us-ascii?Q?dPFJI5LbRIWyTZgylo/rbcm22HGqNcMOjot7dMq5BkCWfgodbvsyiOjyPPVz?=
 =?us-ascii?Q?PrYrP0ezTLDRCFvxaCMB5zsBy42ZNaj+Cwy503jZtHumoyqwHZl328zlaHeW?=
 =?us-ascii?Q?t+GDiWI0HwjM5D/DmV/e/4Cdd68NEi1E1Eey812t/R4i2kKUq7chO4+dDRSb?=
 =?us-ascii?Q?LNZzYzrL72kcJB5UyWYYYxz1LSTgE+arBe8iPdWSbOGFHoBME4PKVK7lmzam?=
 =?us-ascii?Q?EDl/bw44XW3mElSkH3TLrKbIF5ofWrzfr+IphbeNvOBqoxkTN2+DYvRoOUwH?=
 =?us-ascii?Q?FVUnBdeKh2Ah8Sv2+3XmGGDkHBQilBEW4z2q6FiJJfq4ncVrpzxEaUCDLLf6?=
 =?us-ascii?Q?RKisvZS6y6CCyIGRFN//jji03QTBlncBLJ5PYE8zVZ3LMaf6954BcYbTQgvV?=
 =?us-ascii?Q?5NTQaqAcXc3UUGDYlNUMEBXHZf26e787+SUWJeqpaGKdtKVYjltAZGkN9A0r?=
 =?us-ascii?Q?wr9s6ke/Vef6T5LxOO0pDvy7IWoRuxPF6sZZasbHifcAr/pKwOiHEQh9vTAa?=
 =?us-ascii?Q?OMVMExxTZSpFH8jxhQXGMGgtHm9ixvl9L+cWu7e/hW5CepacJLRX3bTTctQO?=
 =?us-ascii?Q?uflnDIvf9cHXlnOjE4RYfSpTAQOo497VGC2aYDyTnBHpN0atWlRiaEJMXrjI?=
 =?us-ascii?Q?q/Ikwo7H4GmLqRqGrJdto0jJRU4TaRCUwEhQHoZSG9UGaHufZS4LyfUDvFyH?=
 =?us-ascii?Q?nVYs6ztunFQWIrhDJUQX/ocTDbj+0k5M1h+kOizUCLOgzQV4cQC0UzhqN0Rd?=
 =?us-ascii?Q?JgQJLo9ITBm0yhkoF8SxN7rvxYY2nqgnvB0YMFlr?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38fde0d9-fb03-42b5-020d-08dd8cc9c304
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2025 18:13:54.7416 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OqB/MPRCKQ/Rc791VbGZAvyk8PrXQjBm+uqnEvU0xQBNMCSiM1j3Dl7ZN7XJEtEQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8999
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

On Tue, Apr 29, 2025 at 09:39:56PM +0530, Badal Nilawar wrote:

> diff --git a/drivers/gpu/drm/xe/xe_pcode_fwctl.c b/drivers/gpu/drm/xe/xe_pcode_fwctl.c
> new file mode 100644

I really do prefer it if you can find a way to put the code in
drivers/fwctl instead of in DRM subsystem.
> +static int xe_pcode_fwctl_uctx_open(struct fwctl_uctx *uctx)
> +{
> +	struct xe_pcode_fwctl_dev *fwctl_dev =
> +		container_of(uctx->fwctl, struct xe_pcode_fwctl_dev, fwctl);
> +	struct xe_device *xe = fwctl_dev->xe;
> +
> +	xe_pm_runtime_get(xe);

Shouldn't this be in the RPC function? Why keep the device awake as
long as a the FD is open?

> +static void *xe_pcode_fwctl_rpc(struct fwctl_uctx *uctx,
> +				enum fwctl_rpc_scope scope,
> +				void *in, size_t in_len, size_t *out_len)
> +{
> +	struct xe_pcode_fwctl_dev *fwctl_dev =
> +		container_of(uctx->fwctl, struct xe_pcode_fwctl_dev, fwctl);
> +	struct xe_tile *root_tile = xe_device_get_root_tile(fwctl_dev->xe);
> +	struct fwctl_rpc_xe_pcode *rpc = in;
> +	int err;
> +
> +	if (in_len != sizeof(struct fwctl_rpc_xe_pcode) ||
> +	    *out_len != sizeof(struct fwctl_rpc_xe_pcode))
> +		return ERR_PTR(-EMSGSIZE);
> +
> +	if (!xe_pcode_fwctl_rpc_validate(rpc, scope))
> +		return ERR_PTR(-EBADMSG);

There should be an EPERM here if the scope is not good enough..
> +/**
> + * struct fwctl_rpc_xe_pcode - FWCTL Remote Procedure Calls for Xe PCODE
> + */
> +struct fwctl_rpc_xe_pcode {
> +	/** @command: The main Mailbox command */
> +	__u8 command;
> +	/** @param1: A subcommand or a parameter of the main command */
> +	__u16 param1;
> +	/** @param2: A parameter of a subcommand or a subsubcommand */
> +	__u16 param2;
> +	/** @data0: The first 32 bits of data. In general data-in as param */
> +	__u32 data0;
> +	/** @data1: The other 32 bits of data. In general data-out */
> +	__u32 data1;
> +	/** @pad: Padding the uAPI struct - Must be 0. Not sent to firmware */
> +	__u8 pad[3];
> +};

This has implicit padding? Make the padding explicit or use packed..
> +/**
> + * DOC: Late Binding Commands
> + *
> + * FWCTL info.uctx_caps: FWCTL_XE_PCODE_LATEBINDING
> + * FWCTL rpc.scope: FWCTL_RPC_CONFIGURATION
> + *
> + * Command	0x5C - LATE_BINDING
> + * Param1	0x0 - GET_CAPABILITY_STATUS
> + * Param2	0
> + * Data in	None
> + * Data out:
> + *
> + *  - Bit0: ate binding for V1 Fan Tables is supported.

"ate" is a typo?

This seems fine, though very simple in what it can do. Do you imagine
more commands down the road?

Jason
