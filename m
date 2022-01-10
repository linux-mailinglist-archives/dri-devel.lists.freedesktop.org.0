Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCE314892FD
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jan 2022 09:04:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90A9611BEC5;
	Mon, 10 Jan 2022 08:04:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2064.outbound.protection.outlook.com [40.107.94.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53CC311BEC0;
 Mon, 10 Jan 2022 08:04:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fnUJoOc0jewY1onvBdY3ufhRYmj13fr9DCWe6feqUvK5WVf6EYje83THjCvFHLC1v4kbO8OsJeAozDA6TM3J9KZh8NCpwKvWREGYszdIkj+UPiTx778D4Q3uojy6Eb3brT2U09Lx5HevwcSwQtXdZofXeJgJJBijbHFvjEMsarYdweUmyEU97fZDUKQ0QHCExxyjljCA6ZP2OSDfvvnoiWtnmiTwmCxc52mnEjKjsF2qVTpGT1uRgmN14GHCc0HiduOF8RIgLe1P80yT6GqJbURbXik7R7n8yfNgNGrmQlzVWGV5r8iT25B0MqmF/HsLUXPPydEj7KG/h1H+xZY8IA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kR+CDsO2XetxaSd4Naxs89KIS4jlbCJp3pCwV6b2X/k=;
 b=SM1kqFK5IhNE1xRM8QcgcEvPNgpOYdtnOAq5ptC/rcCVddrgtcjR1c5EN+4l8GegPR17csyzLrU7n9ZAYnGaktQcVIQ34tNDraq3eoTWvakbHY5pFOkSMLcSb7n2RjE03o++0HTKVtxaoAKtGA6jgxrqJxEQmdWQee/wEDibmyJkCKVGhEGbsJpjXe8Qq1wk7u9fHlIn5mO6hIKBiscjhNaYr4uX89ZYsYJdXY9pzYK2GO8BaH+0CRzctP0kckrCzvLRZJMZDUN7yi84yY+sGdNSb+WpOjAA+tc5CaxG1XxrVBKWk6NNuY3Ht9dVtRHKVfV7Oe33QVfV3THRbPRiWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kR+CDsO2XetxaSd4Naxs89KIS4jlbCJp3pCwV6b2X/k=;
 b=E3SxD1/XGF4NkzDCEOc0Bue8Ym62Ai78nFu+WriMVcAe6E7/Bd7HAP/dHPqQM1kdf3Dw5NWhPdsfLrOzmHwKWeKcmBVtqP821lzvow6CZh3AjZx2VTMv+dM15usTFdXdiHnzKQMpVWMZWqzEydsiRH0ZC7aL+CBmGhVxMcQTwy0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14) by MW2PR12MB2426.namprd12.prod.outlook.com
 (2603:10b6:907:10::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.11; Mon, 10 Jan
 2022 08:04:03 +0000
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::b4d6:f148:3798:6246]) by MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::b4d6:f148:3798:6246%7]) with mapi id 15.20.4867.012; Mon, 10 Jan 2022
 08:04:03 +0000
Subject: Re: [PATCH v7 1/6] drm: move the buddy allocator from i915 into
 common drm
To: Arunpravin <Arunpravin.PaneerSelvam@amd.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
References: <20220109141951.134432-1-Arunpravin.PaneerSelvam@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <7b7db015-3673-c5d3-baa1-e0282aaf864d@amd.com>
Date: Mon, 10 Jan 2022 09:03:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20220109141951.134432-1-Arunpravin.PaneerSelvam@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: AM6PR04CA0018.eurprd04.prod.outlook.com
 (2603:10a6:20b:92::31) To MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c1cbd42b-446c-42dd-55bc-08d9d40fc43d
X-MS-TrafficTypeDiagnostic: MW2PR12MB2426:EE_
X-Microsoft-Antispam-PRVS: <MW2PR12MB2426230DA4E77EBF4E4DA5EC83509@MW2PR12MB2426.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qlnfRKznB4UzdL6BS/usVPpec86n7e9WfnMHnBKDd3eevHG+6uZwH5TmXI32NnVUuGL9gI3dJbbDS91zCGUXq2Lr6uJbNzSN+5qcd6H2CrdXnsBmXnL4XW+/g5t2yqrL0OA0h6Ns4VHG/99GXPSEJmg+9NBJQnjl6rEkg3DiNRz3ecZ8ifN6pKpZCMTjDFsCFNYA2QLmIGgXjwWNZSqL3rXc1goGDMKGQ5HXXGo2DRoAZJ23vLHQUe76zx/mEESlsTMO6hQMk3zv+o1kshcgHFEHh/EohtR0305I6Qti3iXkkp65PZRrgWloCyrqdfKVeb0tfTbFDy1W24St+ZOrUtm8hPngd95SvfxkTufcBCLJKh6GbZ2zVpQPxa84VBjlSTVHVd5ETGkZfXOFrVP8nkaHZfe/cV0Odu5xnUEwUqDuYjCAGPQziYMFzdmO1yY9ff7CA/22OIaKIWsADgt4XZukll1CF2ujJN+q1prIlLvIEh5xPGpdzQjM95m4TSzP8mNQt8+nP45O23mKipBoVZFnsfIAlDmXRV1Zy7mg1VSO6BchnB8yhZ39klAagV9rK6wMOblwX0v6CNnyI+TAtFspOdXoDJ3uIfA1o+/G0kr888ttdoRElq6t0+Xvk4INCjK5ZfSbhnbpqly2/kxMZLSTvc2tL0Var8c4Z1OaHRE3ntbdzkkMzf+dnNXno305MHTsS+EuG+Q5mThPQ/1E9YONdSyQHMY6AZkLo9bJaz4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1201MB0192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(558084003)(2906002)(8676002)(66556008)(6506007)(5660300002)(6486002)(31696002)(6512007)(4326008)(8936002)(36756003)(186003)(316002)(66946007)(66476007)(31686004)(6666004)(26005)(38100700002)(86362001)(2616005)(508600001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eWIvNktQUG13UnQvV2F2T0FFWWxSOWxXRlRQYVhka1dXN0FVN3U2K2hFelFY?=
 =?utf-8?B?UHJQNGljWWI3WVd5NHozc0s1Y01VK2JiNVliVlF2MitTZjliQWdqb3NycVYy?=
 =?utf-8?B?NG12SUVaU0gyZmlaV1ErTVhlRlhSV3pjOWEyVmw3TEF5QngwNDRCbnlYK3ps?=
 =?utf-8?B?RE96Qi9NTjdPY0JRZnBYdkd6Y2IxNFp2U08zZHpPc28zQk1SSnhQbTE4dWlZ?=
 =?utf-8?B?bUxnU0tXMSsrNXFVTklvYWg4OXlldmhhVzBYQUJMS3dIeVE2emNIWHRaWGhG?=
 =?utf-8?B?czY0NGdqakp5VHY4WXh4Y0tTSU9jaGQ0aUxoQ3lLdDIzQjhQemZtNnNtalVt?=
 =?utf-8?B?WUF2QVFlcWlZV3lpMzF3NVl6NTNtVUhkM0hPNXFSOG45bmNRRE9mdXZMcUla?=
 =?utf-8?B?bTNIRmE1WGFNSUowQ0J4bGJWU2J5NEw3YkN1K0lvb0hyZGdKTUNEbTF4Zjhl?=
 =?utf-8?B?TU1SaDczRnVTbkdvcEJINjgyTGoyQ2QrQ2lLQUtpTkJUZThkN0hGaWFOaWNk?=
 =?utf-8?B?TGlKc3JDWTNpVlVZMVVPcUpTY1JOdC8rMnE0VWQxVWVpaEF1YmtVa0ZIL1VF?=
 =?utf-8?B?K1FYckVuKy9SS1N4eVR2cHhnUFVxaEtkZS9BMFByVzAzc3kvaXkwQXp2SHRz?=
 =?utf-8?B?YlF0TWF1dnA5R09tOHVBWFRtcmg4VzUvSmpJUVNCNXhBenZPZzlxdDNHSHhM?=
 =?utf-8?B?aFdwL01OQjB3TEJ6YkhhcXY5M09XZ0k4MytONWUvaWVvaE96VDZFbC9MZnp3?=
 =?utf-8?B?K3BkdGJ1UXVRTDF1SFB1NFV2eXBpVFVpem1ZNU1kajBTS09LVXBGNHFKWlJJ?=
 =?utf-8?B?VkI4d3ZSSmhSYWc4UUJwM3lxQm5ocFlURUZCUFRHNTRwV2syL3J1ZFdWTW5j?=
 =?utf-8?B?RmxmbEZMaENxWG1TQmQ0YjVzQThaWmUvaEtScmsxV2VUNktmUmMzU3Q2SzJF?=
 =?utf-8?B?MEhxZUV5UHU0RitEY1ZPcklON2E5NElLaW53QzhVdzRMdUI0OStkR3o5ZXhn?=
 =?utf-8?B?cW8veXU5cW1mbmhBYkgwRmhwd0IzbEs1TDhLdFpzdnlnU0JvdFBPcGhaeThH?=
 =?utf-8?B?NTFwN3JNbDlBQ2Iwc09hWDF4eGRyYThOdTh5dzJjSHVYUXhQUHZ4REdjZHZu?=
 =?utf-8?B?SDgycFlQRWsyWk41aHo2Z2xLSnVXRys0OHR6K2NOQmFYK1NYSVN4UjVFbXNI?=
 =?utf-8?B?Ni83UGJpa3J2VjdyK3dhbUxrajM3ckJ0eTJBMnFGWFlrNkF1dG0waU5MWUpj?=
 =?utf-8?B?bXpMZVFHRmh1RGhWSDdrQkZsd092Wk4vNWJTTGpkNW0wMWZ3TE9aK3piKzYv?=
 =?utf-8?B?S1JOdmUySzBFS0UvQlcxN00rYXFKTHM1Q29kZXdOY25uTVQzdWtCS253Yjgr?=
 =?utf-8?B?bVNKOGJ4QnduUU5Ra2xURFRmdTlydnVIK0JRcEVRWTc4RlFkTndqVHFtKysv?=
 =?utf-8?B?VTJ6cUsvTjk2Z0U5SU9QUjNKb3dJUG5hb0dQSDdqcTROZ2REM3ZHMFNZSVJo?=
 =?utf-8?B?Z3NYdUZ5WGdPVUlJbnZTTG5xYUgrd2lHYlBPVkIvelVqdU9oSUh3c2ZmcVVH?=
 =?utf-8?B?dGd6cmtMVVJmNTl0MURYVUFmTEc5bTFjUTZyR1R1amY5eGdQSUJpd3lLdFJS?=
 =?utf-8?B?d1BNL0lYKzdneVF5TjQ1emtjaFRJMElOdkp4THY2aHA5RGxiNmlGdHNtdUdj?=
 =?utf-8?B?Zk9MdXIzaDQ3dS9uYVFnNURTemVBemJ1am9HSDVqejM0QUxGVFliTVdqSlRi?=
 =?utf-8?B?cmEvUk5MeVhOb1hCYmN4M0F6RTRIVXpzUFNMQ1FxdXFieXN3cHh6c2RncGY5?=
 =?utf-8?B?QTlhcDhPUUwzdzFYQ3BGYkJaWUFNT0tXUHl4VHRTTGtOYXdsMlBUSUVib2g4?=
 =?utf-8?B?SDQwWnZod0VIQ1BtWENXbTZ2SkdXZXJEV3lWK1g1OHMxYVFVcDBPbVJOdXBZ?=
 =?utf-8?B?ZTlWcGhtZGkvN3ZiUWttTktJSDN2RnBMSTJPMUw1ZFQvbmRjVHBmdCtqejZu?=
 =?utf-8?B?dnNyUG8vak12SXcrc2E5d2VPN2NkYjJqTTdobzdncTJVV2lMRExORDh6dWll?=
 =?utf-8?B?U29ON0NmRU50elczRU9BR3Y5Skhidk9CQXowK01oTGlGWTBTL0hPUC9GODRN?=
 =?utf-8?Q?zMnw=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1cbd42b-446c-42dd-55bc-08d9d40fc43d
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1201MB0192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2022 08:04:03.3306 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uN7npuxIYA+2AeXmgAJ26cWyur6Ad+KSXuN5iCg8hBeC8f5WQTdXi13RQpJ3iVYy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR12MB2426
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
Cc: alexander.deucher@amd.com, tzimmermann@suse.de, matthew.auld@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 09.01.22 um 15:19 schrieb Arunpravin:
> +// SPDX-License-Identifier: MIT
....
> +MODULE_DESCRIPTION("DRM Buddy Allocator");
> +MODULE_LICENSE("GPL");

I'm not an expert on this, but maybe we should use "Dual MIT/GPL" here?

The code is certainly MIT licensed.

Regards,
Christian.

