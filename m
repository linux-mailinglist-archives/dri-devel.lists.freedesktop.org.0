Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OHB2DmP7c2mf0gAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 23:51:15 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C4B47B42E
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 23:51:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4B8B10EBF8;
	Fri, 23 Jan 2026 22:51:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="ViLkeHG2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013042.outbound.protection.outlook.com
 [40.93.196.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE32510EBF8;
 Fri, 23 Jan 2026 22:51:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Psrjv6NSgx1d9EI4DnvToGC7ny7RFqsd5ubEw2Re8+etWpKLGE20DO0tjvo9z+qyBlJne5b7tTpplA9ufoX39G2PUBMNfy9yf4idf6LexnPbmA6ihbZIRe9D/GSE/mPEp6bLyHUkUDHD7wxXVs8jNoT0pr5RvGqshA31MxQkxWwnEqYbnw2zSEEZoed3sLTB1U4oJSkO5S/AKLOiX5wjxF/LBbMe14cnTCT78zRReUS0q1tS57HNWAo1pz7/5KUitOIrYhTo+nrTNXJalRVsMSWAR3BiGTzsJJ7IxtBzGTV5O3xDRkb7BeTqhN1J0NEmjbPsWnbrWkpM7xirLoiE/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tTUDuTmT0pzCMyHGXKPZFaAJDascoQJJTfBW6gCnyh4=;
 b=SEEF43oVlknagJ4Iz85UbCYgA7VmfNI5KxLmYbNsGeK3V4yV4fXfjTE4rw3wYGl473YV11Bw/QyFofw/3uvgJsvoEzSbgYvgfWcMNIJu+0oSok5bat6iVzCWbYxN7a+sidxdz80JagwJKYac7CCCjygcT5OHWYhLK3vTjtM9S9azaeqtW93tcGL9DOuYO3/Bi8p+IMDLqM2FWM4qAttGZj6+zdcif3q1skKK2MCfRGKQy1jv6Zt/Q+Fl/mepsT4XaQHedUlRD6Ol5On/Ne6l14n1lfOrNGcP93eLmpfMv5azFq8fysVfvbXVh8dH0H+5dzLhXeDkS7LgEhAEpsEBkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tTUDuTmT0pzCMyHGXKPZFaAJDascoQJJTfBW6gCnyh4=;
 b=ViLkeHG2Kjnwitem08AQS2Sg4kPprzBvkUJC7sFfyCzGtvYfKVWcv+48nZQlUlByFJrlEHcXlaAoDQXeJimq+jdqxVeCXNSkoX45U+OlcuJj6kLrHCQyw5ShTJO5udR4qFUFeQvZRdvESrbr9+f7htK/zn/zErgvQwKWhsyRaACylF6K5yfPxveXtpeTvBFEej5rnACL3C2+XMtMmmGlvYlDTfNdYZK70G8fCPBPZ0hDKYXqHEVBUx5wxuA6OxQjSXEWoEN4TTzYberEvyZ6C5vw1BfN0GHYC2yYzOfqwnllZCiW8BhFtmT8r1tHIvMlnq+o1+Mw7AQ7bP/wvZiKjg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by CH3PR12MB8329.namprd12.prod.outlook.com (2603:10b6:610:12e::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Fri, 23 Jan
 2026 22:51:01 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::1b59:c8a2:4c00:8a2c]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::1b59:c8a2:4c00:8a2c%3]) with mapi id 15.20.9542.010; Fri, 23 Jan 2026
 22:50:59 +0000
Date: Fri, 23 Jan 2026 18:50:57 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
Cc: Leon Romanovsky <leonro@nvidia.com>,
 Christian Koenig <christian.koenig@amd.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Simona Vetter <simona.vetter@ffwll.ch>,
 "Brost, Matthew" <matthew.brost@intel.com>,
 "Kim, Dongwon" <dongwon.kim@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>
Subject: Re: [RFC v2 0/8] dma-buf: Add support for mapping dmabufs via
 interconnects
Message-ID: <20260123225057.GH1134360@nvidia.com>
References: <20251027044712.1676175-1-vivek.kasireddy@intel.com>
 <20251029002726.GA1092494@nvidia.com>
 <IA0PR11MB7185E85E1CFAA04485768E30F8FBA@IA0PR11MB7185.namprd11.prod.outlook.com>
 <20251030134310.GR1018328@nvidia.com>
 <CH3PR11MB71772DF7DC3776F838AA8CC8F8F8A@CH3PR11MB7177.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CH3PR11MB71772DF7DC3776F838AA8CC8F8F8A@CH3PR11MB7177.namprd11.prod.outlook.com>
X-ClientProxiedBy: BL0PR02CA0046.namprd02.prod.outlook.com
 (2603:10b6:207:3d::23) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|CH3PR12MB8329:EE_
X-MS-Office365-Filtering-Correlation-Id: c00334f8-4b9a-47fc-e663-08de5ad1e007
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?2ZzEE6AoH5G6QiVD5JfmJJ+HwkkjlU4+DeNg++Xr5LUW2LfaVXcNwBSePCHl?=
 =?us-ascii?Q?5oSH25qG6zDUAgutvC5+o/RaIonRdaNFUoOoH59QACmK7gOknu/pOTtXfNwn?=
 =?us-ascii?Q?YvI1u2wWRq6FrMf7PqBwQkHxgBy/u02eAlp+R4AjrtPc+y3V0DXONAkcqcIH?=
 =?us-ascii?Q?E5BsjAXJoOHVQwRbdWtGCM7h1J2C/416RBfrrXny4/6kgsuYAQHC8a1DkzaB?=
 =?us-ascii?Q?DfnQw2su/FBab2tVQzD1q2u2jeAR4GmHlr0NjmcfR5XknPcespawelQkzm9P?=
 =?us-ascii?Q?8sYuNkxpeR5/8lGXgZVy0NVuuci7kR+sSrMnO06/2GEkdsn/NXLeuOEFIcQc?=
 =?us-ascii?Q?Ftf28piOIO+r5tyWUNEn2XjjnN6FFERFuctPBnkVLsnUWAmd2vqwoGne1Vm+?=
 =?us-ascii?Q?/y4g5ke0nzqbrLmfJQWXMIYMoZIQyezvWnkPpMYRCKmdD+d+ahmTMfs4jFRa?=
 =?us-ascii?Q?gJzNM8PnVDNr5rutCI7MkDcPT2ngmTEOBs1a+iIugUxafmuESP/RvnYjiOdd?=
 =?us-ascii?Q?C1R2bxJiqZ5FUFPv9AkhtEwLgnPbgtKQyXVWTJv+f/ZDzvrB+cc0qNwu04BW?=
 =?us-ascii?Q?f8t+x2NySQYvcQ3e7usB7aPjQP0546dLXEPN4dax0b8zYhvz1gErJbzpWTZw?=
 =?us-ascii?Q?4cHzGtpKCRG+qpSfmNYOlyQfUqwJZiCzh1wHVLlm8Il/2ioIq+wgVh4TgkAT?=
 =?us-ascii?Q?4cKG+yIpKvYmNtdkl3tbmGVndtnM4bjeh9B9msGUglNPg2wX7WEvJlI1BMzu?=
 =?us-ascii?Q?YE7dGyT/Gd44/WzXEO/3RhJ4zF6Em0RfOMzWj7QLCjBZcggt7YMFBkLs2F3b?=
 =?us-ascii?Q?GxPIGhNDPUu57U7TqeKEIGKicvgjIq+jukbVTyieOnRQfhnEL+Sv6GWsRz8U?=
 =?us-ascii?Q?GQ8h1Bta9xpOyMthntvCHU2JMgOvYqItWoA7qzt5VwpifelV1WL10Zco5SPi?=
 =?us-ascii?Q?Wy2EjObWfz9NqJyD0HsUXkT12D5EW3m/qY92J0nGnd2q+72xFGKY1vpv8llN?=
 =?us-ascii?Q?DE2xI0kPv4BIOncqHo40rcq6Py+OxGnshBDHm7S9B1rqmQR3ASlWMsnzSPy9?=
 =?us-ascii?Q?dne3AApCdXqYrl88KV++ibR2b3hpZ8akBnAPXnKPRmhQForQRx0IeGhhjtmJ?=
 =?us-ascii?Q?E6nisYH/muUuyee3Cgc+HTgVBwE0i1xjRmqMFjGfrhTzv4E1bq1czdaHf/JT?=
 =?us-ascii?Q?QjcjWUu84PC/dds177Z5gy2rSsB1NA+LIxhmXgE6wvp3TnQeholg8dl3LLV9?=
 =?us-ascii?Q?pYZEjhSFMjS95Tuwq66LrJGXBbeXmvmZAQHTVOU6dYCQn+YzMIO1gnfQkAkA?=
 =?us-ascii?Q?GgpPbWSDthhiqRiWHo3FbK5/7+CciQ6yVeWSAzeV3VOUXk+jWVecFakCG0Bw?=
 =?us-ascii?Q?4lAs4N8jHcEjtf5QxWE6lrTyuk6qonbtVOYR21FOWZvdaHvcHjwR8NsNhZ5o?=
 =?us-ascii?Q?czTfqAIL6ffzrGnkxGfUrJIJtnRnnr5n64CFQYCi5W8HFj71J+r6zpbiPbr1?=
 =?us-ascii?Q?U4xJczg+LsO3VJfcFIKNyhsr0PhG3R+nJpIIIAip0VsfDYwhNp1aO9mY5yuw?=
 =?us-ascii?Q?RCqJw3K0tJi1+cQJibU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV8PR12MB9620.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YdLZIOt1PLPC4egiXsVRWaaEC+xDnB/4rjPPewf5XfKaQv78PoNq79td0T1W?=
 =?us-ascii?Q?504g8oWK95ni7vDhDf7B/jVE4jIiJt/dv119bJSansrocxINoWyhHi4poybn?=
 =?us-ascii?Q?g0867hV0MV3dxcsAKxi75QdTXdqL7aA+LOjetdJLV87t5wFlsOyBg+Suv8M3?=
 =?us-ascii?Q?66d17GFDLSSuQX4TnP/t1jS4sQOM5RPUyjL71vTfINaBRyLrfjJjpmOQ5ESp?=
 =?us-ascii?Q?B8D0FC7+HN2fay2EkmjC2fN6Ge2s9UukYb78eIHfcL6Mvy7aEhbHfEVkWE/E?=
 =?us-ascii?Q?85wBT8zQEKryyutcCVWlMsxou386kSfjpSLk/xTZFqXYdI7KRMNF74PQ8qQ/?=
 =?us-ascii?Q?gy/0twy9jIJ/be4DzKUXsB4NjSVTcqgu2wgpOpWzaCzmY8s5G0O/SQwju02l?=
 =?us-ascii?Q?7j+iZPIXDY033qoRR9bNkAs+TGAbXAseicqljuSDL/BIlX9GLzw4TCvpzV0+?=
 =?us-ascii?Q?mPvkeiEDwJg228Ztu0LtKQyU6+pihTw/dzU/jn1Sjjwa4oybdUcUsIEnnca3?=
 =?us-ascii?Q?sHD8uu/bVivOlc2Uo9Z6VnQzgsRODAnxATmOYI3cLTuSLgSZTSaiEJbyeza9?=
 =?us-ascii?Q?4SplMNdQtpLxJrh20aNUhb7NUpGK7fMzCF1kaGP2RdE/5b24Te3jAPyLGSdC?=
 =?us-ascii?Q?N+gO6KtWho8PTn51XA9p6tY5UfniOIfWNYQ1Xbn2S0lfmS4btxDhDelJbBkF?=
 =?us-ascii?Q?okIhN8vaj5eUFwqosF2q2ddUVTcn3Yl5p/QO6icyO39LpqRynY0Azu9M42ql?=
 =?us-ascii?Q?Kc5flulgMFX6t7edA4h8VF4M0tgpftSRr4MEhcyOTLR9dXnX82bmeFBf/tvu?=
 =?us-ascii?Q?iLTS6/Wiq0sNpLHjH7vXJfc38ldP8XewdJeTNQ9fojELiiyncww8yzJyuAsf?=
 =?us-ascii?Q?vxlcItu4Gd/GXB2Ot3TqxS0+kmKDBPNi/dwi36HpvgW/XDL9H6zAJT/UYAlZ?=
 =?us-ascii?Q?J4R6SN53rFqYfQQ0pBliUYscEEX+Z/9uhYEwZb7t68dOVMVExh8CoiX+QEDx?=
 =?us-ascii?Q?Qt70TvZz8uCy9v0u6QCW/sJFSFlZiS0Mv1ORFDamkk4rYIeGlXehYgEW2QDw?=
 =?us-ascii?Q?fFPqcTlnQcs76w9WKuqxlTcwj6iuYUGKxJ/XzrjM6h3ufm19r7uQ+CeRxODz?=
 =?us-ascii?Q?yUSqQBSIKN8usj2mYcGUvUvEv7A6Anl48UQkXO+l9U/ze2dtpDMCXtssQIED?=
 =?us-ascii?Q?bTGplVe2umjb2Rp1pBj2WMQCd1TJolgrYC5mKwLzuxlC8WIozwKVcSN1+T5G?=
 =?us-ascii?Q?8gJe2o2wk/2/O20wI29dcAg7FZoCKwOBrmSaEIFKLR+mkQ0QOlIi/8PbCdxk?=
 =?us-ascii?Q?fMTzT82DJq3WH39drDIIgWb6BSc4EAPuzXupCTLUa2tM4MQWffvcvaqlClaH?=
 =?us-ascii?Q?CQuBvAUxDcbeKlHSgSERVqQg3Fipf9vTf6eP7+DiUq4qChYrL6xu+i59bzrY?=
 =?us-ascii?Q?fsXKOipF44Rf2irGAHEuj+nkfGw59eNh2Edxg7hdyiUpcUeijHtURBXkQjn/?=
 =?us-ascii?Q?fQgHOXpYHSyM0QnCHDZqjbdhuaJzQXkVRU7t1l3oncjiZ75zzNuflbked5sJ?=
 =?us-ascii?Q?yDvhNhNDruQvevOiE16woZHiBv73A5hpT2iLPpw7ZvEcAyviHR7zgsizBOkC?=
 =?us-ascii?Q?Tsnt9x0F5O1vlV0rkA/+0GBWE4OXgbNov5CsdMqhznGJXJL5aXW7QftTN/3P?=
 =?us-ascii?Q?RAUKqtY2NXUo2yGnEyWWoGzCGkFcsZjSj/Oab6ruLveYr0x/kDNhZElxZjZT?=
 =?us-ascii?Q?d2MjZe1uQg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c00334f8-4b9a-47fc-e663-08de5ad1e007
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 22:50:58.8963 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A1tap0deQu86LnnsOP193YHlAxKDAPM8AevngRIIDjne8Sv/i8MjmU8JQsbfiR9m
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8329
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
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jgg@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.989];
	TAGGED_RCPT(0.00)[dri-devel];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,Nvidia.com:dkim]
X-Rspamd-Queue-Id: 9C4B47B42E
X-Rspamd-Action: no action

On Fri, Oct 31, 2025 at 05:15:32AM +0000, Kasireddy, Vivek wrote:
> > So the next steps would be to make all the exporters directly declare
> > a SGT and then remove the SGT related ops from dma_ops itself and
> > remove the compat sgt in the attach logic. This is not hard, it is all
> > simple mechanical work.

> IMO, this SGT compatibility stuff should ideally be a separate follow-on
> effort (and patch series) that would also probably include updates to
> various drivers to add the SGT mapping type.

I've beeen working on this idea and have updated my github here:

 https://github.com/jgunthorpe/linux/commits/dmabuf_map_type/

I still need to run it through what testing I can do here, but it goes
all the way and converts everything into SGT mapping type, all
drivers. I think this shows the idea works.

I'm hoping to post it next week if the revoke thing settles down and I
can complete some more checking.

We can discuss how to break it up along with get feedback if people
are happy with the idea.

It looks like it turns out fairly well, I didn't find anything
surprising along the way at least.

Thanks,
Jason
