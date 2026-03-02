Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SAEFJa2XpWmPEQYAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 14:59:09 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E525C1DA410
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 14:59:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAA3010E4FA;
	Mon,  2 Mar 2026 13:59:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="HQOhajVY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11010055.outbound.protection.outlook.com [52.101.201.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F53510E4FA;
 Mon,  2 Mar 2026 13:59:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Wgi0a1zTWTRXdGMlO6jhBMWKbbVX5V9seLfszBuJoBjuwrSgqTAVVeJPr/qVO9meebcZaDsA2ixACkLwBbD0pjxwUgwXKjN8vp9VOJ08UPFxxFjhnqPzP6IjzozEKHuJV+BDg4A3R6MGFkXUItaQUYvdXi2bxtvcFpvAbO75FV7IQsTOipAwjM6f/vyuoUOZjTKHf8m2iqJMk2ysC4uMeAtVz1Z0Ys5F61PrDhbC3Tllj+WqT753VsjPuhA1evZWf/R1hdOI6HykLFhyyFhV+6iSJMEV7jLo8dSxnlpcXXDcg5Ow16XvVnUAbjYFQMrpfG8nxfSNVpYPvm23SZzJBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fvk+KdHJWpwgtE20rmk5rnspvKis9Oeccv6Dy65Yv9E=;
 b=vREpGJmBFkg1DDbXFEr8m6JDUcPHCEBq4zxrFhM0L/9ycqQjTED7ixXl7Kb65u1MFthCsYTfppZ43HsO1lICHbrNGVoFakk38TDPB0x6PrEcnvXnd0fvbWUkUa8pGIrxBfg62Zk06xFeUHJDhD6f48fby6w5XJ7J1SSTs3pSlQ/OkQoPkf7wKltsjcOo12Kf7kVua/GXPSteThpCy+k6IyXEtRiEI95c5v185WVblPK86VyZXrtyrehT28Dz89j7h+Jc4QbF9vwgn5RQt75RkISKsxMaD+nEIeZLlc+QvBBuqDpK0NQK9sRJtqN7t+BW0Uz4BAODfo3gAln+lTPsiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fvk+KdHJWpwgtE20rmk5rnspvKis9Oeccv6Dy65Yv9E=;
 b=HQOhajVYL67DuxN3m5nkfyfDrK2pN2AiDlpDSTFikc5GBfd3jxh7WwqmI1XpMaBuXi6Sy00yAex7EUZL3CHePQtkLX/opsDqpUw0xQK1uaihjFJkKC1seGnki7xlPI3tOiC+P/D8GYclHIqe47MCc5nAVx1p2uyr0iEkgM0XUJE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DS4PR12MB999076.namprd12.prod.outlook.com (2603:10b6:8:2fa::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.20; Mon, 2 Mar
 2026 13:59:03 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.20.9654.014; Mon, 2 Mar 2026
 13:59:03 +0000
Message-ID: <c088698d-0bb2-4b0a-acad-946ec3df5777@amd.com>
Date: Mon, 2 Mar 2026 14:58:55 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] Replace the dmabuf custom test framework with kunit
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: David Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>, Tvrtko Ursulin
 <tursulin@ursulin.net>, patches@lists.linux.dev
References: <0-v1-0a349a394eff+14110-dmabuf_kunit_jgg@nvidia.com>
 <7c30f527-abc4-43a9-a11c-9233015b0a59@amd.com>
 <20260302130113.GV5933@nvidia.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20260302130113.GV5933@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN0PR04CA0207.namprd04.prod.outlook.com
 (2603:10b6:408:e9::32) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DS4PR12MB999076:EE_
X-MS-Office365-Filtering-Correlation-Id: ead43ae5-2532-41b5-25af-08de7863dc6e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: 30Ut3JnSvAcze54VavS+F/Q+GzwFg2YuSgN4wcLBMDXhihyvSnHBjBwVPn6WeGHORLhg5YK6hBLIC1KEpthWF/95iKV+jek3awOlgbe1O8RoW5Bifs4OsWPWTNZ7jtsNWI9YPTmeVWxKPenGGOyebwe6rG/sogKL+pFCDbs95B5qIrhRfZuWy6FmlfM9qrs8T7GlD+d1eINpFLQRp2rdh+DvfZ0M/cus5doq5wWBHJqEhTVwuqrWMH6s/Wh4YMigrkYc/xtn5IleQUMl0j3d9whOYd0pW5HBaF1EXFHErPpV9p6Jc7wtEzmMViKWGr0+LvR7s8asNLqa8h56YEBGtjPbnR9Uvbu5+/IViiVBB5rxOeKYGM8bbJLkfdsfs344qJAfTW56AUTE0FEbJM+0GINSXjwvedyo929L84sFc2YlYGGPHbAQ/m4L6JyNc89Z3jjslgGmc0FZr73TTiOCZhcdLICc72eMTcQSDRploFM5jqP0iZwHf8F37tIanstzCG31ZlFJO6yOfgc0ERIAPZCYCHAzSpnb1T6KgzIUeW3XEOvzlmkB8KOAFECXWDsCdvTvMWPgAh/F1ZAO06FVt3h6AGbqcxlFFQYA1aCAy5ms2tCVJJPDoh2SGSu2hU+cPbwDKdmiPLQ6iWG8Sl4nQLjx8zWpPZqdmzpDmC68Q3Wj3B7r1Dy3ioDef0juFGsSz20ui213PRCI+RFQ2+00XaFEl8zsDoXgJvP/7v0p7QA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SkwxZ3pRWlFTcDdlaXN4WFlydUlUQmg5c2RKNDlvdHgySXBLQmpzZldERkFt?=
 =?utf-8?B?dTVsR1oyVmVJeS85eW1FUWxGR245eERSSytsK1VHckk2NzRpTGNGbEF2alE4?=
 =?utf-8?B?WTNCd3V2ZEFRMVZDeEorNGtSR2NkZkpwbFd6Ylk5SFlhMnN5c3k2QnJucnZy?=
 =?utf-8?B?Z1Y3ek5WbzViTlp6NGdtdE1DMkNKekNSbTRweDY5aFZuYktUQkJQTzdVQmJM?=
 =?utf-8?B?M2l2aTRXN0NDcEZPb2hRdkpKU3YrMFA2bEFNQ1plQ3JNTUNCSGhvWGlvbEU0?=
 =?utf-8?B?azhtc3NaZGxHVElTZGtHM1lPeEZOWWFqUm1SMkVyMlkwYkN5WmtMSW5nSS9l?=
 =?utf-8?B?TFVlWktRMGczdkY3aUMzNGwvb296OEhQODJDTnQwSzcvL3FiVE5sWmJHaS85?=
 =?utf-8?B?bE02YVE4ZGR3ODRsbHB1RFVSME5NT21nZ0RGQzZJdVBOczRPM29waE5rd2JO?=
 =?utf-8?B?WHJvODdQendvZkVvNGZUVjljdHBFRzNzbHpGWXpsY25QQmtBWjdRUUZQS280?=
 =?utf-8?B?YlU4bXRjWGtGTXI0QllRaXdMdFBQaDFuVVZUdjJuYVFoTjZOcXNFMmhGRy9S?=
 =?utf-8?B?N0NtdzZFb2lHNnk3RDMxMStBZk0zRWRtRXRORzhneDFvYVhSRktXSzVTL2xV?=
 =?utf-8?B?NW9PZ1RPRXU3YVhPK1BIbzVuNys2QlhrYTBhemkyNlkzamh0TnB0WXBRTWFv?=
 =?utf-8?B?eWYrbncrQVZJRTlqL3hXWnZKSkxDaHY0SVdpTnoxRUtiQ0k4cVFLeis1MS9s?=
 =?utf-8?B?dERJckNRS1I5OUxFQ1hwTU9aa3BRcjUrcEtUNStONXJQdkl2TmgwM0grZWdV?=
 =?utf-8?B?Zkc4ZWJlaVVxWmQwaFUvS3JLMHUvZHBzc3lpRnJWWUd3SlRwaWNFVlZyNEt6?=
 =?utf-8?B?cEYvTGUzTUk3NkNQVXhaRUZwRlBnVGx6RHE2TWwwYmVRczl4WS9waTJtV1U5?=
 =?utf-8?B?QjlxS3ZRR1ZiK09sR2x4K2VPa00rUFNlVERDUWVBb2twcFhGNDJ5dVZuQ2NT?=
 =?utf-8?B?cFVLMkVBYlR0L3AzN2k3cnpuU0Q1Y3lFbGFjN2hZK2l4c1NZWE44KzFuMGI3?=
 =?utf-8?B?U3U0L2hrc3k4OFVnWDd3bUlENmF1bjhsU1FMamNWYzhWb1Rqa3VneHJ0Z2pX?=
 =?utf-8?B?Mm0vTW9YSGVXMWNLbUgrUldreDNrbnpTSVRnUUc2cWFiN2Z1dEM4Q3lJVERz?=
 =?utf-8?B?VkhqZVhxQklUdWljcXRzYkd6WFZadTh0Y2x2ZmJRdHJVZE5WeUYyRzNwQThn?=
 =?utf-8?B?N2cvcWdFVmJTejk0Myt5c2laUDY5citLU043K01MekFQMEs0ZUxWTGoxVDFn?=
 =?utf-8?B?b2lieDUwbUx1RGNRcHF3K1pBWGQzR1dNOXQ5N3YxSjhWdlFFSjcxSmVIek5l?=
 =?utf-8?B?ZU9TLzRRUHBDUDlFSHA4YXhqUklOME92Z1UzOWlSRzdNc0NyenFOUjFGTTBF?=
 =?utf-8?B?OGdUQVY1bTJLTzJFeVNGUTYwaS9wcm5PZEZzOERxaHRybUlWOTU0NFhoaGdl?=
 =?utf-8?B?Qmw1NGVoeXh4ZVpmZzFGRDlYTzFGQTYyZjFqN0poMEF3WG5BaFhIWW9nT1o1?=
 =?utf-8?B?aC9aWmNHbVlDdTk4Yk1OVEZ2d1E2MmpTZGd4WVZyNlFybTdHNWVjSkkrc1E0?=
 =?utf-8?B?c0xsdXBpdGJrWXFVOUZPWFlIRjZ2ZUZ5T3pYdGtGSE9IMzRXbm11cmk1TDcx?=
 =?utf-8?B?TDlrcFA4aUd3YmxoT3Nhbllra2tFTzFqNzA5cVlEU0dMNWkrVUxjcS9tbWdO?=
 =?utf-8?B?MGxOUkoyMEFNZzNiK0NuQlNyRitRVThFNENGUS9FbHlnakNqYXp1dlVSanpQ?=
 =?utf-8?B?TGJvUDk5WkJweXhOV0dnOHFXenFjVUxUWTFKRTRrNUxDVmR5OXRQUWdYdFNI?=
 =?utf-8?B?NEMxQ3g2ZlpMUlU0K0FGOEZSVG9Xd1gxdWFCT0c2RlI5TDJ5ajRWeTJsZUF5?=
 =?utf-8?B?aDVDc0I2R3U1T2tXb04xa3lNMGRhYXhPVHYwL25XY1NYcGRmZU95azFOM2tZ?=
 =?utf-8?B?RGFrWWdLTHFKRnRDNUhxVHJxNEZTeU9PWmRSM1ovU0IvWkh4aDVuWVd2dVpQ?=
 =?utf-8?B?ZTBQMURpbG1BblNQeVRoSGFiNHpFZFNQcDI1UXNqOC9WemF6bHh1ZkhCeUlT?=
 =?utf-8?B?eGhpZWJFemZoOGc3cTBiU08rQ2toZTRwbE1qVER3elVGYkwxK1BkOGIyemMv?=
 =?utf-8?B?WDFYNFk5aU5XbUozL1pCVjhmSDIxeld3Qi9TME92U05kejMzeUFCa2FqclBO?=
 =?utf-8?B?b2xZa2FUeUZNQTM4YVh4dUxWamxvVlMzS2Z6MUQ1SHc5a1o5cWlTWE0xNnUr?=
 =?utf-8?Q?h37upnR+HjIhgzgkiZ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ead43ae5-2532-41b5-25af-08de7863dc6e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 13:59:03.0158 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G4t7MB9QFidkugl/al+qO2G+k1h+U0gcQDho/1ReEiCRYFq45uNZAGQySYUAmpq4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR12MB999076
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
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_CC(0.00)[gmail.com,lists.freedesktop.org,linux.intel.com,lists.linaro.org,vger.kernel.org,intel.com,ffwll.ch,linaro.org,ursulin.net,lists.linux.dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[amd.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,amd.com:mid,amd.com:dkim]
X-Rspamd-Queue-Id: E525C1DA410
X-Rspamd-Action: no action

On 3/2/26 14:01, Jason Gunthorpe wrote:
> On Mon, Mar 02, 2026 at 12:43:34PM +0100, Christian König wrote:
>> On 3/1/26 19:57, Jason Gunthorpe wrote:
>>> Using kunit to write tests for new work on dmabuf is coming up:
>>>
>>> https://lore.kernel.org/all/26-v1-b5cab63049c0+191af-dmabuf_map_type_jgg@nvidia.com/
>>>
>>> Replace the custom test framework with kunit to avoid maintaining two
>>> concurrent test frameworks.
>>
>> Oh, yes that was on my todo list for like an eternity as well.
>>
>> No idea when or even if I have time to review that, but feel free to
>> add my Acked-by should that go upstream.
> 
> I'm confused by this statement, aren't you the person who would send
> it upstream?

Sumit and me are the maintainers for DMA-buf, but the drm-misc-next/-fixes branches used to send DMA-buf patches upstream are used by much more people.

> It is just a kunit, I wouldn't expect an intensive review. The tests
> still run after all

When somebody else has time to take a look over those patches I think we can push them to drm-misc-next ASAP. I just wanted to note that I'm ok with that as maintainer and those patches doesn't need to be reviewed by me.

Regards,
Christian.

> 
> Thanks,
> Jason

