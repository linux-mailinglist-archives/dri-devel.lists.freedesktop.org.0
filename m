Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6314DCFDA8B
	for <lists+dri-devel@lfdr.de>; Wed, 07 Jan 2026 13:28:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A40EF10E5A7;
	Wed,  7 Jan 2026 12:28:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Q8G0ml/a";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11010030.outbound.protection.outlook.com [52.101.201.30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE0F910E5A4;
 Wed,  7 Jan 2026 12:28:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XDeNhRtWNMgSJN31KMhCEqlpc5ZqrVvJ1dHIwkCud4fJKsT2+Qe2REfE18fNLfTadQqKH62z5gqb4ntL9UM9wzYy2mKuvwPpjGDC7sUIQpBbx2w2n9vKrzqPTswD2qtIQYAQYbO/f1Qal1mS1BV6vilzwUo0xdGhC0si/2V+Cnn4enwxaUx+YvY/pP4xLfC+7pdCLvUIJ73sXytSz5xfmD23GKIBdDbyCqIS+5F2h9s8Y0O9q0JHKSy1yZoQMU9tv5LH+KGPF7j4UT5ueHNBWzu2lqx8Vbnfef/A9k3P88s84glfFFLYKbeewPNfoH1QbB1lPLz7azeekAXNzibpKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PJ6SVXL53qqx78Z+Z1wZ0aqLyRiz7D0W9CMApqh1+rw=;
 b=PuMVAi4UiFxP3BRp4xfCazYB60yj4mkCD1k9CjhATKBx2dK3oQlWutxgr5hqTJ5stqEyysJUtSk5wqrdEK9TKbQuJ3ZVNOFvZs8iXnBj4RL2mppycnjiWYMsNJLQABxHTbjH8DQIJ31aIQ9t8yGUGGbJ+vGg8sTKRC/jZPJopKL4sp+8E/xqUZclGPplwFNB0tX58JgpaU296xyQhFirbLG7w4U21jNHryjF5nOjZ5PpqQZf4+yicsSQiaL+cR25m1jhrpdBsqPxHUFmUEHnibSP0S2KCpNcpqv6s8XMo9ljZfPvbM3FE13ASd8tlKmUzYXUuD0nDBm9GJWnWQhgzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PJ6SVXL53qqx78Z+Z1wZ0aqLyRiz7D0W9CMApqh1+rw=;
 b=Q8G0ml/aYtfMloCur4Pp4S/Ff/QLh/VEIVzAT+yANz9ujt1vJuVZZ9nNwai2PRVaGhjqu3TYT+bHK8UMN0tIyaA4O93Wo98a2Ro1239TtoPQZfYzk0B79w5x8Lk9I1K1XppVWmj8UdEfHBeQFDJnf3USrCqGLbUq9oE5RW28sDk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by LV3PR12MB9257.namprd12.prod.outlook.com (2603:10b6:408:1b7::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Wed, 7 Jan
 2026 12:28:33 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9499.002; Wed, 7 Jan 2026
 12:28:33 +0000
Message-ID: <b6bd1fdd-fae7-4ee9-ae06-9abe168adbd4@amd.com>
Date: Wed, 7 Jan 2026 13:28:29 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/radeon: convert VCE logging to drm_* helpers
To: Mukesh Ogare <mukeshogare871@gmail.com>, alexander.deucher@amd.com,
 airlied@gmail.com, simona@ffwll.ch, amd-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20251220080156.1961026-1-mukeshogare871@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20251220080156.1961026-1-mukeshogare871@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4PR01CA0094.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:ff::8) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|LV3PR12MB9257:EE_
X-MS-Office365-Filtering-Correlation-Id: 77afaf07-681e-40cc-9721-08de4de845f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NkRpbDdkOFJtbnY3N0FFSEtGQnZiRUk1TWVhWE1CSERBWXgzd2R4RW5MUnZW?=
 =?utf-8?B?WEZDRVM1bWpTaDV5dzN6ejdDbFpLQStuOXYxdWxSMGw1NDc5bTNsTGJ1aTdy?=
 =?utf-8?B?dlh1Y2w3NFgyMU0xdlpMZFpJbGJBYUc4TWVMWXBoU2ZMVXVsNmFnZjJSSzlT?=
 =?utf-8?B?RjFCdWRrdWxlaThKWlNpTW50WmlqaVRhdjZPR0pzcGlDcS94SHdyN3FRZHNw?=
 =?utf-8?B?MDN5UWF3aGdIelZtWllkQWpOR2puZVFNVGJhWFhzV2RwTDdkVml4QnNXSjZh?=
 =?utf-8?B?YnlrdlMzRy9UdWR2cW9lOEhsN1BBeGx0TzFaSHB3VVFXN3RTWll4Mkdsa2Mv?=
 =?utf-8?B?TzBuRHhsNVF0bVFYTnhFbU1DbTcycHhGK0ZFOHY2UUI4RCtOV2hUbmRKeFh4?=
 =?utf-8?B?MStDR0hTR3ZpdnJ1SFZTLzJuV1AwRWJnZUlHQlltbVl5emExY1A3UHJiYlpm?=
 =?utf-8?B?T3NDVEszTlh3OHhObk5ZTlZvTGRhNEVpSEJxVlRMUzlVVGsybnJJUlg3Njhw?=
 =?utf-8?B?bjN5UHJjbUNjRzR0eW5yYzh1Vmp1OTVzSk9BZm95SkZnS0IrbVFCVXkrQnYv?=
 =?utf-8?B?dkNVWmdBdGNDbU04Q21Pb0hkZVlpbjZtdE10V0RlVzJ3OVlXTzdPNWcrOG5Z?=
 =?utf-8?B?cEhMMTdHaUhFOU1PWnh1SEZSY0RkWDhSNDA3TUhLOU8yMURlMmZQUDQrdnRh?=
 =?utf-8?B?NElxcUYvWTgwTFNNUXpUWExVbkxFUlhvd3BkYU1KMThIRTZUQy9XMlh1SWl3?=
 =?utf-8?B?V01MSVR2czlxbXVuSDhZY3hRNkVhK3R5SFdrMXB3SS9SYXFTNi9NZXp2bDRS?=
 =?utf-8?B?MXgra1l4a0dSY21zRkQ5NzJQRlFTcmR4NStKL1R0YTVTRDlveUN2VEc5Y3B4?=
 =?utf-8?B?NlRLZ0NmQW93SExQQ0N5U1o2VEoyL0xTTC9JamFkL01xVGFKblRxZDZpTy9I?=
 =?utf-8?B?WlpmYjJwUGVrZUllVTFFOTVYcUZvWXdEazh5dVJvWE9iNmNUWXd2UUFlemJV?=
 =?utf-8?B?RXRwZkkvNGFsZW5ndHBGaDdLbDNWUVVhRmQvVzEvQmlpZFhjcHZCOGROU2NJ?=
 =?utf-8?B?OEE1WHJGZXVzYmlSdWpxWDUyWE50ckdUTHZxZlJPWDNCb0J2YWYreS9PRE9F?=
 =?utf-8?B?MG5SQ1VjYUFKa2RRUGZpVVdncXJrY2VIMnRZdnZ0U1JWN2J1OHRSWDJGVkxa?=
 =?utf-8?B?ZTdPVXU4ZkNKKzV0cEZVZE03TmdwOUtMRW1pMVVsSnV2OWY2dkJLcDBrN2tH?=
 =?utf-8?B?WFFDVFhqeWdOWXkwWkFtTWswWG5wTTVlT2VQNnQ5ZHNRbitSZXdxMUpIRS9s?=
 =?utf-8?B?dXNybGljRForRk9zUVFGSzBZWUhvNVBYWFdMVWNXWnBiclhSbVFhYkpUY1kr?=
 =?utf-8?B?ZDUvQ3orQ2VYaUxHcG0veTVvazZ2VU5OdnY3OUU3MzVZUGdOTzN0MHdwSnY1?=
 =?utf-8?B?ZXhtQjVROUNPZ1Z6T3hNOWlyWnZvaUtOTldNdjZGZjhpeGE2RW1veTAxRlpj?=
 =?utf-8?B?d2lTV2p6YlVxTy9TTDNIZUFOSU9rdjRCVER6eVR6Y1k4TkRrck1JWWtvK2Jz?=
 =?utf-8?B?RDVNbStFWEFRK29xWmt2MnFvanhaRnNQTlpwNXY4M1Y0SXQvWG9mK2d5cFNx?=
 =?utf-8?B?WlRuMWFFRVR2YUM1cm5ya1cwNjNFS2k5T1djS0V3bzhsNm40VWdrdExPRmhK?=
 =?utf-8?B?TEhZM3FIRWhiK01COTlrbUJrZW40dmJDRW53a1BId1FPSFR4NHVQaHFoWVNC?=
 =?utf-8?B?eVdZSjBvSDBSTzNpN0lyU3ZXWlR3Q0FsV09BWmJaMDNFR2xaNXV2UjlPWERx?=
 =?utf-8?B?azNMZC9YYTlocXVmYlBobnRyUENtTi82QStuQXJTTjNPQ3hjTzN3ZDNNS1Zt?=
 =?utf-8?B?cGFNdDNMUDN6NWpyK2J3L09pZldNQ1ZBR3gyUll0V3BMWlN0VlpHT29saVBL?=
 =?utf-8?Q?WT9fwSgBXulAoAogyfjvPhs5IN9omC9n?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VE9DcjhIc1g1RUE1ay9SNEJmblNkTmIvRkp4cE5Ud0pWSmpPdStpbTIySVV0?=
 =?utf-8?B?VEJVME5NNXhQWmNMbWRZQ2xuQVhMcmw4dWtseHRVaWVhcThjMDFuWW8zeE5X?=
 =?utf-8?B?ZDIyRGhyQ2lGWWxnVzMvank2Nkk2RmZuUC9OYnpMUFdnVEhFeGJrMEY3Z05q?=
 =?utf-8?B?ai92TzRnMnFLT21QeTNLMTIvNlRhSEdGSlBoZHZCWXJIOXdvRkQ1UVBWaE1y?=
 =?utf-8?B?US9KeFR3VG9VYzdlRzVYV1VnSEZ3Z0l2WHJkVmlVNG1GVzljRklxVU45T2NU?=
 =?utf-8?B?OC9mTVpIZzQwTUhMcHV5aktDdnIwRmZaQ2UzRDZQWnRud09TSkRoWkkyTHZu?=
 =?utf-8?B?SFVocFptQ284YWxZWS83MFNvT0lCTDFUSlBEODFETk90Qk5PcnF3Z3NjZEph?=
 =?utf-8?B?anpGVUhaN0pnR2dkMlgwNXJFY1JpQmVNRVk3eVd1Q0hidXhTZ3VJdXVsaTRv?=
 =?utf-8?B?ZjM1Yjc4c2tOWmRmTWpqVlNYT0RmRlVuV09JS0VXQTZ4T1dJT29VMVAwMWxs?=
 =?utf-8?B?cG1DV3N3ZVRRd0M1SVo1K3M1TXpiYkp0VDlYcTJqS3Q5TWVPRUVqaW4yMGMx?=
 =?utf-8?B?R3RSU3Rnbnl2dllpdjVMVXY0Qkx6U0YvSFJpK0Z0NFFSRGVnTTJjdE9JYUQw?=
 =?utf-8?B?bWxoWnF0ZkIxT3IrUkFFODZmSXYwQnBKY3l2Mi9RSmIwR2t2S1c1ZXR6ZVpP?=
 =?utf-8?B?M0xIakVxRit2V1JWYk1RcXZBTGhFWGVJU1U0ZHZzc2NHVE8zYmd1WUVzQ1lG?=
 =?utf-8?B?VUtkOUIzdkJrdVZ3OFRjb0RVU1B0SWFXSUFMdkFuQjRXZDBMTkJaZXN6SFZZ?=
 =?utf-8?B?VXNOTVJjMlNoUlpIbjMzSFhBTFVEcmVLLy9TcldpREgxcGRkZHQ4eDlkMmRD?=
 =?utf-8?B?ajEzclRVd3pxaWxjQ0oyYUtjWnpJenpVWC9lL0pTT0NUcWovdml6RVZGKzRK?=
 =?utf-8?B?N2tibFh6eXJjNWwyUkRKb1cyWTltSmJpVEtONnRCajV1djFJSGdaZ3ZKSFlO?=
 =?utf-8?B?bnlxVS9nVWlWQ3VETTZPeUhEd3FtZm9uVGRtSWtwVDE4YUw4WldVK2ZBeld0?=
 =?utf-8?B?SnNUcDNUcnQxRm5aVDVFejc1aURNK3ZZdHNRenBBMWprNEhtOWRmWVdhanFO?=
 =?utf-8?B?M09haHEyY1dQbHd3cC9iaHBaTEZOdHBJemhPalNoeFVlbUlMY2tyeWRTdEhM?=
 =?utf-8?B?d1UyYXFlUGk0OHY4cGc0b0NZd1A5VXhXMTNDb0MwNFdRSFQvOFh2aEk0T3F3?=
 =?utf-8?B?eXhESXlCclRMd05PTU5TMTZWQlJKTEFGN2daTy93Wk9KaXRUbTdXejlTN0RS?=
 =?utf-8?B?ZjZ1NXh0QzVuT0xQeG9jdVBZazF2cXY3blFDMG9KSy9yVmNla0NzbThJekxE?=
 =?utf-8?B?UVJjanUrZitvU3pkaDhEVFBxa1ZoUkQvQkNnblg1aVZla0NjREJaNVUrMVBE?=
 =?utf-8?B?SWhPam9XS0FQc3JEZUdvUGZ4QlZ3dnZIMWhLQkpIZlU3RXU2WVhYZEQvZnVZ?=
 =?utf-8?B?eUxkdkVuVkg4VmNGZ215MWo2WmszQVRUOGRjbkJlSzd2cmJGaWVCc3Qzd2F2?=
 =?utf-8?B?c2U5T3ZFandXenVCWWNlenNsaCtrUmZIek56QkhjMFpHY1NmV0NpVEV6NEtU?=
 =?utf-8?B?RGx1MFBGUHJGTnVJOVpIMEhmck9FT2J4RkpuTGZJMlJuVTFFRXdIbWo3SUpH?=
 =?utf-8?B?TUhVMkZ3WEhNQWFGZkhVUEtWWWJGd0t6OWhRM0poTEswdXhsa05YcVB5Ty81?=
 =?utf-8?B?ZmJEM2p0K09IZzNSV084dS9taDFhSlJ0UEZvQ29lSmpaN2ZkYkpIUnM2VHg1?=
 =?utf-8?B?ZUhHRmRIeXB2amg5WXl6eTBYaXVSdjU0ekw5VkhYRkErOHFrSlF5WU1QQ21q?=
 =?utf-8?B?eTl2YzY2U3MvNjE2ZWtxcmtweFVEU1RSOENsNkZjYW00K3VuN3grbWlrQjdO?=
 =?utf-8?B?K1pvT0VPeloyNEpHWW04VDRhaGl5ZlU0SklobEk2YmdhU2NYUGowd0w4NHZJ?=
 =?utf-8?B?VUw0b2FOQXR5M0MxMXFaNmpuajZ5UjZhaEFWN1hHQUh1RzNLR1V1YzJ6Y1Rp?=
 =?utf-8?B?cWZHYy92b1IwdWhjSEJuVmo4YzRUQXIzY0JTeDBFVkVSUGpFQ3A5K0dlbW5y?=
 =?utf-8?B?SjlLUWhjOWdRZ3V5bWovdjdqMTNRNDRJcStsai84TkdzS1ZabGdWTjRsRUdT?=
 =?utf-8?B?N1ZnbkRXZmlybjk5TnpKT0FickZENzVqcW5XSE5IdmgyYTV1THI2NzF5Wnhm?=
 =?utf-8?B?QlYwS0RISzJPNE5ETHFwNFpmNjRLeXFVb0pwY2dyWVFQYjRTWjNJT2trV0lY?=
 =?utf-8?B?S25TYzRLcmlScXNyQnNyK0pQSWpsTUxhd2RTTzFSazJ5cHR2Z3M5dz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77afaf07-681e-40cc-9721-08de4de845f4
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2026 12:28:33.6689 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Nvfyt95XB3KgLtp5OOWOY6GAvTae5ZA7WwKAyOJSHvCmLoywVWQo6lhm7MLDRCkG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9257
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

On 12/20/25 09:01, Mukesh Ogare wrote:
> Replace legacy DRM_ERROR() and DRM_INFO() logging in the VCE code
> with drm_err() and drm_info() helpers that take a struct drm_device.
> 
> Using drm_* logging provides proper device context in dmesg, which is
> important for systems with multiple DRM devices, and aligns the radeon
> driver with current DRM logging practices.
> 
> No functional change intended.

I agree that this should only be info level, but you turn an error level into an info level, so that is a functional change.

Please adjust the commit message accordingly.

Regards,
Christian.

> 
> Signed-off-by: Mukesh Ogare <mukeshogare871@gmail.com>
> ---
>  drivers/gpu/drm/radeon/radeon_vce.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/radeon/radeon_vce.c b/drivers/gpu/drm/radeon/radeon_vce.c
> index a203992cb932..fd176034b251 100644
> --- a/drivers/gpu/drm/radeon/radeon_vce.c
> +++ b/drivers/gpu/drm/radeon/radeon_vce.c
> @@ -121,7 +121,7 @@ int radeon_vce_init(struct radeon_device *rdev)
>  	if (sscanf(c, "%2u]", &rdev->vce.fb_version) != 1)
>  		return -EINVAL;
>  
> -	drm_err(&rdev->ddev, "Found VCE firmware/feedback version %d.%d.%d / %d!\n",
> +	drm_info(&rdev->ddev, "Found VCE firmware/feedback version %d.%d.%d / %d!\n",
>  		 start, mid, end, rdev->vce.fb_version);
>  
>  	rdev->vce.fw_version = (start << 24) | (mid << 16) | (end << 8);

