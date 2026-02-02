Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ILj+LfjOgGkuBwMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 17:21:12 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17123CEDED
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 17:21:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA71410E526;
	Mon,  2 Feb 2026 16:21:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PQUslAhj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA24510E2CE;
 Mon,  2 Feb 2026 16:21:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770049266; x=1801585266;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ZWP92oBQTt3EaX3y8v5ewBvCxEQ5802b3hKQEZCKY5Y=;
 b=PQUslAhjbbWXOtsC6DMUYsY1TAFOn29ERciHAO0NCOzB2c8cb1MIZ/dS
 k5yy5rQjjE9a2QzgdtkW7JL0iKNeDR/9xKLeqDrQQa50FYaYmmzley55E
 eIraPOizpKYJSir/TNJht23voje1HTMCnNGnDezrsAKEU/IgsG103s2Mh
 zpDaedmFTG/4S8uMGXHkwrgjIgXMxh+4h9CyCEguBo+K1mPrtDPgJuCrg
 2dqWJSp9+OmQmS3AaPhxCvLREmVc/zr+RXMbbBfTwDYlxdiAE2+llv5IQ
 2UWeJ3UdlXLU84BTLSDRvRCkgvRd8Td7hF1DFKMNixLE8O4DO24UqzEaP Q==;
X-CSE-ConnectionGUID: ILuo3hlBSOWMYb6p4f8F8Q==
X-CSE-MsgGUID: gyS7XfQsSqWw3ISEeKSW5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11690"; a="88785444"
X-IronPort-AV: E=Sophos;i="6.21,269,1763452800"; d="scan'208";a="88785444"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2026 08:21:06 -0800
X-CSE-ConnectionGUID: W4XK7tVfTYe+WMUgPEfAYQ==
X-CSE-MsgGUID: zi4AhUNfQqe3k7iJpGOEvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,269,1763452800"; d="scan'208";a="232477856"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2026 08:21:06 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 2 Feb 2026 08:21:05 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 2 Feb 2026 08:21:05 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.6) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 2 Feb 2026 08:21:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xOzPpZTbdUPSCn9KA1qX0o3DHooMVsmlZAYY6J03uAlchfSujGZEpc570XI7p3PsuCv9XyDYPzx3D9QgTNOVjs9QyBOxnbre8LmKnpLaBCP8VBcOk9PbY3yZ3jISl7zwJ2wphc7yVCSJ8XLWuJBvgAyJJdSHhqJKcAR5Ix20sdBJ+ho95uw4pFoiAsdiav0pcvd0EqU7VTrdmM/4PZB3vp2K/fvJiOYhAkVocvfYZD4i4D1VkjLP9omF8pXSoAkGfz2iliweq38Qbr7IsYUxH92L+u+iY57kuTUgjtZwt1ALwGCp2ZerucSX1sEt+/dwFfkRyCfBfGA07sTrVTlX0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p5uhWmRKLKcIS2WbFqTHPd0yNXJM0E4XMHJjseQJuQA=;
 b=iq9ftiLiZavshIG9l70A4on4ydft5YDjRfDvS0ItMtUWzNXCDdIcQEaPZYknNnDZru0EK4zmVHKEVhs7cr/dA0a77V5EoNpoRR6/KNvuH60iRmAq572M2K6e4QTAKf56GP3hORBARCeAyUCLguEsFciPRim1rCaKOpJ/MctaSV60j0eQRpriPLdGDfFPzuE9RA/z4ny4dkdvsWi+3nD6om29YhOkT/RfQRECQduefkTb8Xgi8wQ/RZ1Gx1g8k3Ed3LiCpmnq768ALOzxABrdJmHZ+9vZWET6d92vvWjIq5TfCIjl+6td8X1dKJwhXBhzEj/qcxPzFGybqtr5CuGE9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by MN0PR11MB5962.namprd11.prod.outlook.com (2603:10b6:208:371::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Mon, 2 Feb
 2026 16:20:59 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d%5]) with mapi id 15.20.9564.016; Mon, 2 Feb 2026
 16:20:59 +0000
Date: Mon, 2 Feb 2026 11:20:55 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Marco Crivellari <marco.crivellari@suse.com>
CC: <linux-kernel@vger.kernel.org>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, Tejun Heo <tj@kernel.org>, Lai Jiangshan
 <jiangshanlai@gmail.com>, Frederic Weisbecker <frederic@kernel.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Michal Hocko
 <mhocko@suse.com>, Thomas Hellstrom <thomas.hellstrom@linux.intel.com>,
 "David Airlie" <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Subject: Re: [PATCH v4 0/2] replace system_unbound_wq, add WQ_PERCPU to
 alloc_workqueue
Message-ID: <aYDO53pNfjvVhoT6@intel.com>
References: <20260202103756.62138-1-marco.crivellari@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260202103756.62138-1-marco.crivellari@suse.com>
X-ClientProxiedBy: SJ0PR13CA0190.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::15) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|MN0PR11MB5962:EE_
X-MS-Office365-Filtering-Correlation-Id: e1292c9a-b282-4cef-4dc7-08de62770d12
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|366016|1800799024|7142099003; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?6J25UFlkxtecY/zYWEIBTGnIQf/UNcVvfyAyxuqW85gCbc2571a5cC10lrUW?=
 =?us-ascii?Q?64Ly1tyazIWQpgAMdcBgI70qfc270/0X8ZBiD+EnMDWUJY0L0Mv486MuoYzF?=
 =?us-ascii?Q?LzgPPZ7GaDAlIdjTzs6p8f2mynKzCW7QNVroGs8Wup9sTRxsaRvtrzCND7k0?=
 =?us-ascii?Q?APOUPwrQwePgr63riVzJDVUiKQTr0zsINmYSDekyUAweoU6qhfrDyiWT3EE3?=
 =?us-ascii?Q?5yZthKgCQShVHgKcmSvCbBpnyrBO6Gktrk3VzxfrqKri31huK3UAvJJ1yXJP?=
 =?us-ascii?Q?PBXN/hiGqjBse6DgHTBe8nKNBV2lPmnOLXi93+sVvS7wavaCYc7l4b+SNPi7?=
 =?us-ascii?Q?euBE89nGMmhBzdRWmAKeSTKHPVcc+9/freC9qU56Oi/pkFvnqWK/i/r3rLSB?=
 =?us-ascii?Q?ejVX2f6+yICzzBq0HlZY+arivlKR9Ne2l1g/PnDGj0RrL8B9Lyanl8AEuQy2?=
 =?us-ascii?Q?h4le1WIn8Z3Kwc78esPPozxGxAM9Lrsb7VYmtdcAhovMLrgyStRkIhMqMKf8?=
 =?us-ascii?Q?+3daAHC2urLXhpDCv5cp4ncc9/1PC19GGqvkJ/chd2GHyNdh7E+0UJfMo9qp?=
 =?us-ascii?Q?XsKcQcYGdlvo8xCNV/lX7BT9OVYlpO5T6OitHveoZMYNmFZmk/BmeOJG0XgG?=
 =?us-ascii?Q?fFxTVW8ylLeGO53LaFP9RV8bsIFxO6d2nkIFadpyrW6TLb9mu4jOiOxlilIy?=
 =?us-ascii?Q?skQUlE+lZSNpkSsqgHld28QTRhVGY1t/Vp1pw5YFWIJvQSDayH3dhuYHTfQZ?=
 =?us-ascii?Q?OE4yXqI5enuOOBV64fPaOeTa3oux23MOrAd7uRdcK/lxDZUhHkVtzaoh70BZ?=
 =?us-ascii?Q?MzF4WboEqra7igm2VijbpXL45ST6gs9yrl0irNd2P6GxcN7L0uDrJOH6njPl?=
 =?us-ascii?Q?7Yq/P/E6AJVWMafuELv1bZs9BBz2jQ7K3gV5M2N+VUWPEQKTRcFLowN8VXNj?=
 =?us-ascii?Q?cbjqAZu4Iv+WePGW6A2FkCQEfccwLlly3SbZstjCLfww7bCTICEL3e2HDUPf?=
 =?us-ascii?Q?C5opLEzXOM4XjQPcNXwnv9204Wbe5uFWsRVTVP9oV0vMLRkxuUU7pkRw/eWL?=
 =?us-ascii?Q?WXSOAlgBjZ8MxBUJiFzNSRi6fpqlPYUVXDFgbnnJdmzNVZUYHGTMNn7t0GlH?=
 =?us-ascii?Q?ih5OCo8QRhOSH1be4cxVh3z2jfqmgZxz15fWzvbRb7WBpUqblfqJLpKDFV55?=
 =?us-ascii?Q?0u+8owg0tGAl9nAf0wUW35qpFfAlwIWaEpAGlj6oeBj22OBhiALovfA/fllN?=
 =?us-ascii?Q?20BL1toNKcmYYvYu0d486t4O0Z8XDz7PJBwHmigsA33L5RtF4S5IUw0acQox?=
 =?us-ascii?Q?XSHwRPy2O1c0uMzjiq9qJ8hZwl2Mpo1h0/y/qBJz+TORWsrWU7TkldYpVEUr?=
 =?us-ascii?Q?EdylyQ3fNwhljrivFnaDrh1EDRWcKYLUf3Zf57DxsXF6Qe4LYg1oYXNpu/hG?=
 =?us-ascii?Q?X1XgGNP50muiCpFdLLkrAA+NElrsuErabEIMB+PpZ5TTzHlsxzlIoUgDQhfb?=
 =?us-ascii?Q?iVvs8i/1fM2IIBoSYnttdIshDjd55kqEz0NZTuA/2c3tL69NGgKXMxMuc1q7?=
 =?us-ascii?Q?dJRSdLCLfA/5fLs0cFU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024)(7142099003); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vX418vrEGTOBdeVQjhNNeW10bIVqGE0yuSDwc6mAORrf1CMnpsrPQLFG2H3A?=
 =?us-ascii?Q?pkPBeHcuQMsh+z6giyc2kPqvLGGMg5ypdDWlsUZbaxNmXgXSPe9TPJBCmmoz?=
 =?us-ascii?Q?uQ4rC/eKl+bPa/Y44FlyvEyYF/diUCWhnMIaXM1ENxF/6pXKLe+xFgEXM519?=
 =?us-ascii?Q?Gy8P7QILE6Haqxodz5C5h290CU1Mvym7aJfwPBBpzwL3XUeLoun3hTLT4mOr?=
 =?us-ascii?Q?f3WrRA4CmrQ9osj55JrOaR+J6nwhxAQ2QH6b9uof9Dp3WJe4u07chK7W32zM?=
 =?us-ascii?Q?FD9E544fnkp14sUT4eHdRYvmHQukZokfZ6bh/eRg4w7D3OG/Zv/BXDfsdRMW?=
 =?us-ascii?Q?/nDVQDNN/9hIj0Se2ujyPhCr8pMx1b65SUm5GneouaMWr5YM9N+q6Yc7zrYr?=
 =?us-ascii?Q?NHByI8Kz94za1TIoQKkPkmCEsBP/Ktg4NOdfPWmU57Z9+g8zM/kwGHhZ5A9J?=
 =?us-ascii?Q?ky/mAmr+z1iUDMgmsApjjwltWTpLh0CJjq8j/olBNDbXXozLdaCHIQUqZkPl?=
 =?us-ascii?Q?h9V2e9ue7Fpr7yJ46YyI+KC1KzwLjciM6H/MzPaXf+BqGSaQEh0TlNZHN0NH?=
 =?us-ascii?Q?QiHg3N8n5mp74SYPtnBb8lz1ggwgOQMXhe9plVWrK2VLW5whprg6UW7b2vmA?=
 =?us-ascii?Q?pxBPjBkUvQO05TtArusJssWYLVEZtXI0UhkU3tSZZnnirKjpohzatdAkcZTs?=
 =?us-ascii?Q?MbFCHowvn9tOh/bInwrWmmPAuZV4Kh6r8GIueNCiJ0IFMfQEoUuXMc3p0ho8?=
 =?us-ascii?Q?9eIso4OZS6K+PGlDLYyvuU73kS9JboiLxpd1mOa3FpK6Yqt66D16TjZyIOs2?=
 =?us-ascii?Q?EKEIs3kMGUy4LIFewwje+4PHSy6IUsrpyYpW0JpkBi032VCboKQFYpJ/pWrl?=
 =?us-ascii?Q?Ryk00PPbOCHGtFUEkeTdAKQil/crDemai+8I8TCjzVgdeMlgJbNttfubdG8F?=
 =?us-ascii?Q?17PLe69tZvki1T2SGFjjePTJTZ1J3B79a1hWvbAaE19E0oa/goqCS1SQ14Dv?=
 =?us-ascii?Q?B2thn6CnHwJYbJHu/jUVvCVGL1rv38dUQKPt7RmqEAUl3bgs5scGpkQ74SS6?=
 =?us-ascii?Q?FmRnxBUhro1CawvLBZ7B2sLpJ4HVWXtWbOpcEsyVz5+LIJfT60Hnh9F7AqU7?=
 =?us-ascii?Q?47ELsE6GwOy4fy3SHNQf66PIREFoyWulcJ1rjjgIB5Kqh2QhOxTqizfUrtGB?=
 =?us-ascii?Q?p5nMGCzg9HBrK8PxXrWg8hphie2xE5WMh19UqeZGR+Spkmzvhxte+94PPMc2?=
 =?us-ascii?Q?lS1zv+mtwXENB4XgArl3kAEr315AoGFLYGeSYyOI445Goqe/UeBktnuJwuxf?=
 =?us-ascii?Q?H9GQT1KvggS0Osa+EiaxcwRUVwC+61YB0gwwnVc9HVzakQCBQ9wdMiozccvG?=
 =?us-ascii?Q?RL0XM30/wbGPIdZxuKv7bmKighCOpVXeVcDArf2cskSB5WZxZQJGJiyBcrJc?=
 =?us-ascii?Q?egm8jF3YG0pD2cn/CRZxJXTBsJJDdBS86YK6x+iKeOB1yNVHKZ6XEIbFgEvF?=
 =?us-ascii?Q?m7Imd7GdI0UwPrUPugcE+RhI0kmwUQyCrwfk45AN0rwZr/B3WaE3OXPNX9yv?=
 =?us-ascii?Q?/2emPxj2Ntei3SB6V17hjuQ8B9XkBuWgHHf8FATkJiItOo8PvhnM/m6YMPhr?=
 =?us-ascii?Q?/ykw81zgL38tXcK19VwhKm+rYxySrb8HLOhRz5+G/N3FthvqiETeg0PEgYq8?=
 =?us-ascii?Q?seYAhCq2sqaFBCI1Eu4pwqE54VIcY5mdzmyRgoemrcK3BqyYZU+bu7XxPpow?=
 =?us-ascii?Q?+H0+BFHR/g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e1292c9a-b282-4cef-4dc7-08de62770d12
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2026 16:20:59.5734 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R45+ZsOpbtPUOlrmv+wZtAOV7C4u5MyKak2Hp9+kZGvel/ykGtliuj9eZdaWF/Vhm6hTscVzwy1LC2e92Skgfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB5962
X-OriginatorOrg: intel.com
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
X-Spamd-Result: default: False [-0.31 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,kernel.org,gmail.com,linutronix.de,suse.com,linux.intel.com,ffwll.ch];
	RCPT_COUNT_TWELVE(0.00)[12];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,intel.com:email,intel.com:dkim,intel.com:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[rodrigo.vivi@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 17123CEDED
X-Rspamd-Action: no action

On Mon, Feb 02, 2026 at 11:37:54AM +0100, Marco Crivellari wrote:
> Hi,
> 
> === Current situation: problems ===
> 
> Let's consider a nohz_full system with isolated CPUs: wq_unbound_cpumask is
> set to the housekeeping CPUs, for !WQ_UNBOUND the local CPU is selected.
> 
> This leads to different scenarios if a work item is scheduled on an
> isolated CPU where "delay" value is 0 or greater then 0:
>         schedule_delayed_work(, 0);
> 
> This will be handled by __queue_work() that will queue the work item on the
> current local (isolated) CPU, while:
> 
>         schedule_delayed_work(, 1);
> 
> Will move the timer on an housekeeping CPU, and schedule the work there.
> 
> Currently if a user enqueue a work item using schedule_delayed_work() the
> used wq is "system_wq" (per-cpu wq) while queue_delayed_work() use
> WORK_CPU_UNBOUND (used when a cpu is not specified). The same applies to
> schedule_work() that is using system_wq and queue_work(), that makes use
> again of WORK_CPU_UNBOUND.
> 
> This lack of consistency cannot be addressed without refactoring the API.
> 
> === Recent changes to the WQ API ===
> 
> The following, address the recent changes in the Workqueue API:
> 
> - commit 128ea9f6ccfb ("workqueue: Add system_percpu_wq and system_dfl_wq")
> - commit 930c2ea566af ("workqueue: Add new WQ_PERCPU flag")
> 
> The old workqueues will be removed in a future release cycle.
> 
> === Introduced Changes by this series ===
> 
> 1) [P 1]  Replace uses of system_unbound_wq
> 
>     system_unbound_wq is to be used when locality is not required.
> 
>     Because of that, system_unbound_wq has been replaced with
>     system_dfl_wq, to make sure this would be the default choice
>     when locality is not important.
> 
>     system_dfl_wq behave like system_unbound_wq.
> 
> 
> 2) [P 2] add WQ_PERCPU to alloc_workqueue()
> 
>     This change adds a new WQ_PERCPU flag to explicitly request
>     alloc_workqueue() to be per-cpu when WQ_UNBOUND has not been specified.
> 
>     The behavior is the same.
> 
> Thanks!
> 
> ---
> Changes in v4:
> - rebased on drm-xe

series is

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

I just resent it for CI and will push to drm-xe-next as soon as I get
the greenlight from CI.

Thanks,
Rodrigo.

> 
> Changes in v3:
> - rebased on v6.19-rc6 (on master specifically)
> 
> - commit logs improved
> 
> Changes in v2:
> - rebased on v6.18-rc4.
> 
> - commit logs integrated with the appropriate workqueue API commit hash.
> 
> 
> Marco Crivellari (2):
>   drm/xe: replace use of system_unbound_wq with system_dfl_wq
>   drm/xe: add WQ_PERCPU to alloc_workqueue users
> 
>  drivers/gpu/drm/xe/xe_devcoredump.c     | 2 +-
>  drivers/gpu/drm/xe/xe_device.c          | 4 ++--
>  drivers/gpu/drm/xe/xe_execlist.c        | 2 +-
>  drivers/gpu/drm/xe/xe_ggtt.c            | 2 +-
>  drivers/gpu/drm/xe/xe_guc_ct.c          | 4 ++--
>  drivers/gpu/drm/xe/xe_hw_engine_group.c | 3 ++-
>  drivers/gpu/drm/xe/xe_oa.c              | 2 +-
>  drivers/gpu/drm/xe/xe_sriov.c           | 2 +-
>  drivers/gpu/drm/xe/xe_vm.c              | 4 ++--
>  9 files changed, 13 insertions(+), 12 deletions(-)
> 
> -- 
> 2.52.0
> 
