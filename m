Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AAM+ALx9gGnE8wIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 11:34:36 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CB53CB0A1
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 11:34:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6228710E412;
	Mon,  2 Feb 2026 10:34:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="NQVWG+db";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010053.outbound.protection.outlook.com
 [40.93.198.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5116F10E410;
 Mon,  2 Feb 2026 10:34:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yyqY80C6ejwfC2xenpnxIatKb9aVXN0R/b7ue12qCPwL9BRR+7r12O1tw8gcb9QAXr8efg7eexcgUOBfB17eqO3BjVdV10FQTjA6GKSiTkH1k9jobrJa8L35tU1E+Uail0ejHHNOrLkXN1FOg/+GVwaV4NngYBo7b0fWOoRVcWPhSzqCROnLNFzCKl2L0Wq4C1uD409jSYiCXWi81sk/Yp6LntRD83ZAXVU3ETkEfE/irh4+Yq/mmLpZm2JZuyIRv4JcEhRPSd7Bl5pcaq+OmdYw93IHY/l4yXF+0CYmo30g4fuCzElmfac6F+8m8iOrcp6nksy1vdrjH2OoH2QX5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VpXvxq/t4PWTOsIFmbBfjm+nijEVs7P3eEBbmkLGeVU=;
 b=pnhghvwWjAluifvHLcHIB9g9IrFG0hF6hlWjv7EJo60k8wFM85RXuSQTsRKE1MjqczuusDqEGBG0ajy7IgFmbvzvFZg3MGwHDICk89GOKlaFdRkhYvZSRNANPetoRMGCtlqvYjTuXt0QtlUvbgfipElvuc/EYzYHxnssemHOHm7E9uaYtoW+Y/A5pEOkatC8xawzxcEfcTt1ofOfFRlRf4zUdv7G26d0I7IVU1R9vcHpg01mrrAMqSFjSHOwp78Ftq+RPIFJdX5XNGFxehZXmlsaOWyzKbk4ZMlwXREMp0DsDi2DxVKkl0xe8oQSyl2JTyydsZr5EfsOHpHGwHxLow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VpXvxq/t4PWTOsIFmbBfjm+nijEVs7P3eEBbmkLGeVU=;
 b=NQVWG+dbVksSQH2//xyCRGjbQwwkuJjg5pzBhwdDXj0GW+54p5XC1NMqarOBAHlfav5nJuqzfowN9cS05xL3RoeHxyPV1tVhbFgXZwF7yr2Ad9ojy8/ThTJBsNA5V86yOt0YAjVfYPsWGrxZh21jNhKJFMbVoeX4Ro/dxtJAVoOfJA68xdvXpbQciT16hDScanyEEimo/7WBycyGrwc/lXIdld9d5+oCnd7984zsvyasjUYisEhNg6+RrUcVC4zKTlf34LZGnZDDb8l0P9FqGgY+DajX0ktjUWpNTGs/bfzoKIhuQWDC4bMK7cHD0zzD6w3ui5WepdyvXkrAB8JIaw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 SA3PR12MB7976.namprd12.prod.outlook.com (2603:10b6:806:312::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Mon, 2 Feb
 2026 10:34:28 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%7]) with mapi id 15.20.9564.016; Mon, 2 Feb 2026
 10:34:28 +0000
Date: Mon, 2 Feb 2026 21:34:22 +1100
From: Alistair Popple <apopple@nvidia.com>
To: Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: John Hubbard <jhubbard@nvidia.com>, 
 Matthew Brost <matthew.brost@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>, 
 intel-xe@lists.freedesktop.org, Ralph Campbell <rcampbell@nvidia.com>, 
 Christoph Hellwig <hch@lst.de>, Jason Gunthorpe <jgg@mellanox.com>, 
 Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>,
 linux-mm@kvack.org, 
 stable@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] mm/hmm: Fix a hmm_range_fault() livelock / starvation
 problem
Message-ID: <nm4qa6fz2kecodhtt7yfcnfx77ik7pr7332amfqvgyhgs5xwqf@v2v6coz5genz>
References: <20260130144529.79909-1-thomas.hellstrom@linux.intel.com>
 <20260130100013.fb1ce1cd5bd7a440087c7b37@linux-foundation.org>
 <57fd7f99-fa21-41eb-b484-56778ded457a@nvidia.com>
 <2d96c9318f2a5fc594dc6b4772b6ce7017a45ad9.camel@linux.intel.com>
 <aX5RQBxYB029/dkt@lstrano-desk.jf.intel.com>
 <0025ee21-2a6c-4c6e-a49a-2df525d3faa1@nvidia.com>
 <a459f147b461c6e6e806282956b7931f74a0aa93.camel@linux.intel.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a459f147b461c6e6e806282956b7931f74a0aa93.camel@linux.intel.com>
X-ClientProxiedBy: SY6PR01CA0032.ausprd01.prod.outlook.com
 (2603:10c6:10:eb::19) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|SA3PR12MB7976:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ef8a230-7133-4dec-1c16-08de6246a46d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?b0eKPBDu74vDMDsB81En7ClZwKysSyYR1JziUCjV1Vn9uJgE788r3xM9/q?=
 =?iso-8859-1?Q?Cefzi1Uq6qbBsj43b8TjpgXqQdZqwpNzgQCVZpb+GJ1k/Ve5sjqZdZG6E6?=
 =?iso-8859-1?Q?Zr97zv85z1Tabesa0CZbXCEzT2CtLl1yJeFQWbGZIIeNcWZinvSMlKZsF7?=
 =?iso-8859-1?Q?wIyqg3yXrln13rhPSfdQzBA/zunvpA9Rj4ZmSQDYrXtgF2KSDa409F+q9O?=
 =?iso-8859-1?Q?H/i/G0pCZsv3p6TdcPbjkP574wx2VEBZUdC926hDGZQebK/D5acd7IIdFe?=
 =?iso-8859-1?Q?+sLRbOqqnDSwRYr7+8DKMAW8lxbMg8W7zDmf7WSeHz04ZsoNhb9ZCBznGk?=
 =?iso-8859-1?Q?/tathE+M0Yp1kUdAyXnW/yLm+ibwlzzUmD3ON5DuM8qlWTedCyX9iFFBwY?=
 =?iso-8859-1?Q?8mKEPEzo+sh25QGBkIFrmT6leWq9rHwFZf92OB08lf3+w9mohCIQJ48zHl?=
 =?iso-8859-1?Q?sXL6a5f77uatwkuGSPA8VmCncY3Hxk7pAmjbz72wu0wCNI0eDPBtcBVCBO?=
 =?iso-8859-1?Q?S+rDdnP9ottwG3WpzAVuevbWBSG3ARdb6QZmfxlfcafskmdfC/1UvljtrN?=
 =?iso-8859-1?Q?7ku9EBHyd76K4u8e0seAB+/HA6rxatLZzZqnISmPv4o2frQgPLFh1WffgV?=
 =?iso-8859-1?Q?uPuX62gwtwm3ynFqUpcMisKxjgfXvYzGn18HOclBCX/B4CzLh6H8SPbezb?=
 =?iso-8859-1?Q?my1nvXhXuX3327gwlmyXnBxKH77pe8MDZoqoDRrLdWox0uekE6Qau2rYUh?=
 =?iso-8859-1?Q?ixGFUsIjr+AQwr3LkxujqybV3Rntwrt9fZ6iJlsaygpkdxGEuhfIDL7tt8?=
 =?iso-8859-1?Q?+nW+CheRqn8Qwc675m7z1FVT01MfwgTIEVV843Xvo3nK9RYr876K2Z2h5r?=
 =?iso-8859-1?Q?2vNC9XiAr2gwCkXS00BXsWD/+n4fKwsyp1qGY5a0QtI0xQV5FWRr6ycNmU?=
 =?iso-8859-1?Q?/N9ZwhN4DQl3a3SRf1Z3adq97hqguOJQbVLEQiGMY+apzZr2a7R6zTTt7v?=
 =?iso-8859-1?Q?Kt13m9zZvUXaBIp63j77tiVRWYMeXT8lbpQsqgjjNaf+A438sGONIB1Rnw?=
 =?iso-8859-1?Q?dRbYeJvyv7rk5jSJ1xwCbPSHyZZFnBwTlPB0FCfTRcflcD5SLmWr9F2SPv?=
 =?iso-8859-1?Q?REAoEsZ7yRN7/tqN7AtcpudFp5Qo9ttmgw2YderG6ZYpcsfBwfiFZgqJ5L?=
 =?iso-8859-1?Q?PTUffqGcRvyeFyfeJG3iUViIKE+IMD0S66JisDD8q/m30Su/42ljrhVtA6?=
 =?iso-8859-1?Q?An7GMMUFeHp1plx/MO3v98KEVs6BPrXohUkKW2yGBYwdNVFdtoR3M7PyTs?=
 =?iso-8859-1?Q?HiVfqSgrjteq40YRIQaF1o+Gq0hpJSLuQJ+gYTcMma1huGT4CNt119SU80?=
 =?iso-8859-1?Q?ZUGh7neoHDl4FC9FsBcEtzz3908Jzq7lWvKI5VF+JKo75jcr6q22PTY9uY?=
 =?iso-8859-1?Q?WHOv52RMlEjO3NLXv1kGKs4bcfDwb/+qEsoGdiVDGVLrkDpN7Smt8apWip?=
 =?iso-8859-1?Q?0TBoK7Jx+BbDbLaX5BQ3zs1MkA7aEHWxvhg1ldZH/hRmYqZ6os9/mJFY92?=
 =?iso-8859-1?Q?rV4p7kyKK58ABojsCH/whC/GEXH7NizA4Pi1jr9+aYEYBmLZTQZ3kYBjqP?=
 =?iso-8859-1?Q?M+He3Xt8pVbA8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB7726.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?ixJfE5SNoLFkPVUTzSrvLLAt9APGte/Z+LGMlXHC+OiZJ2InOibNSESlyl?=
 =?iso-8859-1?Q?IKGPCyWekTzzhdiPJQO6dwIQZYtxwvEB2Bf5Kh2O1iiDzIj+psNs9uS+lM?=
 =?iso-8859-1?Q?ad3qao2XIPEzMM2c4ZpItjeKdXPVxs7OotoQX22VJvMV+sSFuPqEgL0zCZ?=
 =?iso-8859-1?Q?inLweK9NvxgRQfnM5UWvjbXczd4/K/yW+4vwST4FaDqBBneA4tzwi9tNd+?=
 =?iso-8859-1?Q?4AoUS0MenRTXpKR27ACnyUnsOVzTlWCjSoWeuoc4nUN76Cqw4xwrY8LWee?=
 =?iso-8859-1?Q?NSwupZp+9P+iA48OhspeZNO48cNgQlUE8olofRezbpLYG7arl3Tm7G12uX?=
 =?iso-8859-1?Q?hesqhMf0ytxKC+hffdmXvGvIgcZ+D4ZUmBkvpAeA7ol9SgXDrpQ1gijbX4?=
 =?iso-8859-1?Q?q0+W20NL/D7YeUVUxRkIpqsUSRwJDrLXawCfQrXc5h6DGlnxJKQ4ghysJN?=
 =?iso-8859-1?Q?ugd66hQGINlSc5gU0UktIcCjsmUQiMNUxgr1WBG0brj69ok7G1LD7y98Q2?=
 =?iso-8859-1?Q?EAUyTkIA/097MX5QIjAdOvea9RxrjhgBPRn47pCiqVaT6ZorcRNMVkWBnX?=
 =?iso-8859-1?Q?fNBM4xbJG5h9feavQX+z6i70j3sJWJGAHu80EEF87k2cpwiWvs1J9bVplI?=
 =?iso-8859-1?Q?U9apeK0bp5L4/KbmUBHVyKGeKoBTH4tufPMQaVIpyvA+98vwNe/hdrkbh7?=
 =?iso-8859-1?Q?M9ry8KmPrZ/V//JMMr0Q2jv232AnA4r2ZvggPcvkMtTahgBL6q1fSzi7Sc?=
 =?iso-8859-1?Q?7dV1D+kuF52uKuJF44olv5fj1jwyx6F6JHiVE5xXGgn7zNAyKM4vVCFaId?=
 =?iso-8859-1?Q?dazfmcpHCIhQ2zJQ58JkGMyfc39CVVn2p3cj47OJsoj+fXUcWWNAZUC2tw?=
 =?iso-8859-1?Q?S/98GjeB0QFVSaEzu303tgYP3pXsPSGW09dJEZUhWsCOaWIhMz1ux25QTh?=
 =?iso-8859-1?Q?qPDw5TqwDP43tKgVAbv9NpBxgulkm19y6GH7ugV/lLCKthdScY7B+gJ/Qu?=
 =?iso-8859-1?Q?zs6v1Co6QgRu2+DRQ8AMxwP8iV3FVMbglVd8vQ+Z6QLs/k9svhv69ERaJR?=
 =?iso-8859-1?Q?GfPNAUjP1dYIZ0VfSG3Hj5ZlmTL6mFUNceJa9OW44x8aR83mi4hEcsMuZT?=
 =?iso-8859-1?Q?tLNKNhgbLHJ4l+FSV+Ejy9bnoQLZmu1NbzJWjqvQOQD8X+ZVgIXQjW2G2U?=
 =?iso-8859-1?Q?dGQmVY1y6/OhTh+7IxKnvNL0ltTMZ3uNwK6J7D/uN0KPkLaY2a1egxkACT?=
 =?iso-8859-1?Q?FWMXrkkSmxy7yYb7HvIXi3W3/1QfKUwVKZxG9Qh7kYlGYwQZRtsjMqSOSr?=
 =?iso-8859-1?Q?LGpmbbNr1MIpv09O1VO/xS2kbT17T0uMLFLmddjnt/yiQVOIuUHb5Qx4OD?=
 =?iso-8859-1?Q?BDG/ZRM5/+XxZ1OBR01vylpfCTn/uty2YYaRJ7SfXwvnst7FA2UTGhUAjJ?=
 =?iso-8859-1?Q?ptSxMK5BDPO4WuU95DELt4wNgyzQxMbtedDzIEmhEkeDcCOrq3XWTBj2eU?=
 =?iso-8859-1?Q?OZbbO7CcEWLP4w0XV7SDWv0QFd6B4uTby/Tfli4dxnlU34+f0/CtTLwJTS?=
 =?iso-8859-1?Q?lVK8aQOZs070deQRPoO+oUWl8K9yOUCofoZZWSjSrRov7tvA/p6IXAfUjt?=
 =?iso-8859-1?Q?rxpETXE7NrY7xqO7qyz6mMUJKmkXnnpDOI8qmxyc5XqPkUhxo2XaZeUCiW?=
 =?iso-8859-1?Q?cO7ITPcYjvmfFc9eJ0MOa6RgRvcBXkMLb7CsXLiTBIu7iZZRyq6mGHvbZt?=
 =?iso-8859-1?Q?Ti7t8TRM8eOuDPxonhfkp7QnqudJE7lQMr8r7AFrNnIUz8NA1jGMNI28Q/?=
 =?iso-8859-1?Q?c4eq2XDOAA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ef8a230-7133-4dec-1c16-08de6246a46d
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2026 10:34:28.0763 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k3CSKcyR6qHWehzvbW7lH50xrT0R/maKQlVHvzKWCNEATtixLkXED6t/HRtTW1yG0doWUzrkw4aqKdwzfI9xBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7976
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.89 / 15.00];
	DMARC_POLICY_REJECT(2.00)[nvidia.com : SPF not aligned (relaxed),reject];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	R_DKIM_REJECT(1.00)[Nvidia.com:s=selector2];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[apopple@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:-];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,intel.com:email]
X-Rspamd-Queue-Id: 4CB53CB0A1
X-Rspamd-Action: no action

On 2026-02-02 at 20:13 +1100, Thomas Hellström <thomas.hellstrom@linux.intel.com> wrote...
> On Sat, 2026-01-31 at 13:42 -0800, John Hubbard wrote:
> > On 1/31/26 11:00 AM, Matthew Brost wrote:
> > > On Sat, Jan 31, 2026 at 01:57:21PM +0100, Thomas Hellström wrote:
> > > > On Fri, 2026-01-30 at 19:01 -0800, John Hubbard wrote:
> > > > > On 1/30/26 10:00 AM, Andrew Morton wrote:
> > > > > > On Fri, 30 Jan 2026 15:45:29 +0100 Thomas Hellström
> > > > > > <thomas.hellstrom@linux.intel.com> wrote:
> > > > > ...
> > 
> > > 
> > > > I'm also not sure a folio refcount should block migration after
> > > > the
> > > > introduction of pinned (like in pin_user_pages) pages. Rather
> > > > perhaps a
> > > > folio pin-count should block migration and in that case
> > > > do_swap_page()
> > > > can definitely do a sleeping folio lock and the problem is gone.
> > 
> > A problem for that specific point is that pincount and refcount both
> > mean, "the page is pinned" (which in turn literally means "not
> > allowed
> > to migrate/move").
> 
> Yeah this is what I actually want to challenge since this is what
> blocks us from doing a clean robust solution here. From brief reading
> of the docs around the pin-count implementation, I understand it as "If
> you want to access the struct page metadata, get a refcount, If you
> want to access the actual memory of a page, take a pin-count"
> 
> I guess that might still not be true for all old instances in the
> kernel using get_user_pages() instead of pin_user_pages() for things
> like DMA, but perhaps we can set that in stone and document it at least
> for device-private pages for now which would be sufficient for the
> do_swap_pages() refcount not to block migration.

Having just spent a long time cleaning up a bunch of special rules/cases for
ZONE_DEVICE page refcounting I'm rather against reintroducing them just for some
ZONE_DEVICE pages. So whatever arguments are applied or introduced here would
need to be made to work for all pages, not just some ZONE_DEVICE pages.

> > 
> > (In fact, pincount is implemented in terms of refcount, in most
> > configurations still.)
> 
> Yes but that's only a space optimization never intended to conflict,
> right? Meaning a pin-count will imply a refcount but a refcount will
> never imply a pin-count?
> 
> Thanks,
> Thomas
> 
