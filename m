Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4985DAD94DA
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jun 2025 20:54:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9254810EA43;
	Fri, 13 Jun 2025 18:53:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="bNvKFI2K";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2045.outbound.protection.outlook.com [40.107.236.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8001F10EA3E;
 Fri, 13 Jun 2025 18:53:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Go577RI+JCm77Ae/CbFH3uNlN6JdhAg1arh9cyvAFH4ShXa+NJJGlXQAB2ueEcS1VCgqOoM4LdpPxYpPgmjrb63j1Zfsj+pQ74GrPwqTGwL0a6Hsz0EybZCesCHoAKohs/8xKk7QTwJ4kHw4zsUls3aduBCk2XpSINaDiAcKu3fzkiLe/u1HCuSf+GbJCVvdpVaIGwrkQ4GfTyOvYvIFdJWxdzMpqzwHpBKcQmVuFmCqqYxTeYolc+md8LqrAcUn13AxC+bu/GzganstUnfrOLL/flkKWihBVZw8exYJ3wlaE9QHFZIMcN8YEZBPezaDIDCFA0YdcppYE2gvns/2Lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H1VpHIEk8C45vF10PBzlL5fbm5tHozSrrfINOJNTPRY=;
 b=RhimSedAvNKE5egHsAVz1mobhDQa/ww0ZaLoBjoYmAeVcSUcfH0clLW+xLypb7N2c/Ae9bXjl6s8/kECBtD1h81mPy1FCsZDFNDwusnP8gdbQqMn7iOhey7obj1qCyAecCS4iuGnt7QmSR1OvFPYQlqb4fCJMGUJ7+Ye8cPiYbRbP5LOYiXmsJjRN9xVQH9RVWuW0ng0SjPK2coUtwvo96xgmX/SGxCvvpleGFM3Shcpi041Z8r6hwDo8gPNKsg7HgMjiphFBFfuY7Q98XoYrRnKL7WwoOvoik0QhkhK9Kabwbmh1/upFyZ/CTr72vOPmC/jhh3y0kIU+GyM6HrDHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H1VpHIEk8C45vF10PBzlL5fbm5tHozSrrfINOJNTPRY=;
 b=bNvKFI2K04GYa8GSqsF43WNO6moBbAeQN98Ls7sNusaR0WKJjwv5WEiOOIBP6u+ajSQJr6IGsQxX8CTcJlRMac5m9ougkAQnTTMVIc+XGuNJ7BUUnIRNNxM7ONJwJ5g7qZnf8IJ4LY9/wNqJrun50JsKVZ7HXJRVf6o4OUqDywQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by MW4PR12MB6873.namprd12.prod.outlook.com (2603:10b6:303:20c::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.41; Fri, 13 Jun
 2025 18:53:42 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%7]) with mapi id 15.20.8835.018; Fri, 13 Jun 2025
 18:53:42 +0000
Message-ID: <0125efb7-85df-4911-a51d-8e6fffd6f648@amd.com>
Date: Fri, 13 Jun 2025 13:53:39 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 03/14] drm/amd/display: use drm_edid_product_id for
 parsing EDID product info
To: Melissa Wen <mwen@igalia.com>, Alex Hung <alex.hung@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>, harry.wentland@amd.com,
 sunpeng.li@amd.com, alexander.deucher@amd.com, christian.koenig@amd.com,
 airlied@gmail.com, simona@ffwll.ch
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Michel Daenzer <michel.daenzer@mailbox.org>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, kernel-dev@igalia.com
References: <20250613150015.245917-1-mwen@igalia.com>
 <20250613150015.245917-4-mwen@igalia.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20250613150015.245917-4-mwen@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN1PR12CA0093.namprd12.prod.outlook.com
 (2603:10b6:802:21::28) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|MW4PR12MB6873:EE_
X-MS-Office365-Filtering-Correlation-Id: 84b305cd-b900-49a5-ac0f-08ddaaab9dc4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bElVc01DVk9DOHYwQURzUU45Z0p4cXF3YlJVRFpNbXppOUNTak13UEU3dU1k?=
 =?utf-8?B?K1NySWpHTTgxRjF1RytnUml5QTBjeTgzRWpCUjZQbk5MOU5lTmxjY0t1dWhZ?=
 =?utf-8?B?WEUwZ2JsaUZiTFV3UGE1OGlDenVPalZVV2J2WHFBYmlISnpGT254cnBYOGlJ?=
 =?utf-8?B?MEpnUVNqNkNlaG54eFFyYjhwWGV3NVhrZnB4MnFFRnNiRHF4OW93Vk1NZkVS?=
 =?utf-8?B?dnZYQUlwcFd6TlVOeUM5S3RSbFdOMjE5SGRNZ2NiQzVFbE0ydllnQTVWOHJq?=
 =?utf-8?B?NUlkN0RZVWtTZ2JiNDRkOW1iL1Q0czRkbnpBSVkvS1c5V21ZNWVLNlIwRElN?=
 =?utf-8?B?cEhma1NEYVpSeWUrRFlTcEhrTGI2aENCbmYxVVJpUVhZVjJRSnJHQ2pIZGtF?=
 =?utf-8?B?TUJjY1Y1eHdzcW1jOG9CekVDcEVNQzRtL3RsZEVPSFhUMWdWQlNuUEs0bnpZ?=
 =?utf-8?B?ZGE3UGVXTjd2M0crSTY0UFpDVXVvcC9NMUw0QUdNRzFHZEw5MkljU3lWditz?=
 =?utf-8?B?ZktxT3BwMDc1NDFlNGo3d1Z1QzZsSkNlQktVOWs5VjlabWllajBiZ3RhMVl3?=
 =?utf-8?B?eVdiM2lsbFpmcDdkM1lqZk5CYS9tQlFiMTZocUwrVlhKeXd2V0NmWWNpWGwz?=
 =?utf-8?B?TUcyblUvN3pSRkp0SUdkbWt5R2NVN1dGQWR6Vk1ObHAwN0dXTlQ1T2FtdjdI?=
 =?utf-8?B?NXduM2hpRkpJc3R2YXl5ZCs0b1V6M0hiZlFoMzcwOHdLODVnQWo5TGFERDB1?=
 =?utf-8?B?UHZvSTkvclFHekZaK2lWc3VTRmdkc01kbFhGMGRFMUh3MzRZL3ZYR1AvcTlL?=
 =?utf-8?B?N2FKZG1KWS95Y0JxVU1BWCt0S3VaMWd2MkJoTGJnYkdab1pzZUtwV1Q5bksv?=
 =?utf-8?B?dFdwSlFHR1NwMW5yaEt1bmVUOFo3UDMyVitSU0crVWxrTG1Ja0lrUGQrZGpo?=
 =?utf-8?B?ZkRvVkZBUi9FMzRXZXpWY0M2bG5mK1ErU1hXZmNncGJoQklXN3A2WkVSRFRU?=
 =?utf-8?B?SVNGYjFOTWJUR0NnS1lYY0ExVmx5TS84SnVxUU1SVFA3WHNYZmMvbUdDcHJk?=
 =?utf-8?B?ZEF2b0ZOVXVaTDFNN2Vyd3ZPMlZack4wK2Qyc2VvN3k1dHVwR3lrZFpteDFI?=
 =?utf-8?B?R0FjdnB1dnVhNkIyM3Z5UTVTcU9HbjBpUDlsbXpqR3ViYjQ5a1Z6cks1b2xJ?=
 =?utf-8?B?RlRpcUtMeFdtbWpuQ3MxY2Z3VnBLOWR4UzMvMEJndnZ0NVFBa1RucjhteG84?=
 =?utf-8?B?b0NCRng2UGUrT2I0S21jRTdqMWgwQjg1M3lUSWQ2YkNQd2JpTVRVWmJHOFJW?=
 =?utf-8?B?d3RLekZvVjJsaVk5T3RpU0FaREdZZjBNYXc2N2ZSTU0yWGp0ZVVNQUtLVmc2?=
 =?utf-8?B?RlNlb3phRUdmZkNxS0txMlZzYllabDZBN2k1YUdpZUZnN2daZHN2c2d5ZjBm?=
 =?utf-8?B?UTRVMzVnNVZkeDBxVFFxUmJFazJBZ3JBb0E2T2lubUFnaCtLMnlRSTE5MW03?=
 =?utf-8?B?L0xSdzF3Y3VCMzI4QlF0V2VlNnpQeUlJcU00SEFBZ1p1M3lvRmdiMjczTit6?=
 =?utf-8?B?T2xvMVJheGQrd1E2azdUa1dQWG51U3MzQ2h2NWtrRG1XanlHczkrK1JUTXFK?=
 =?utf-8?B?aWcyMjQ0aVZsaVFuZHVSdEorWUJCSFJJMndkU3NMTzRSNmo4NnhUS1NMU3h4?=
 =?utf-8?B?dDdaMVFYdy9jdHNLNkNRdG9Vb0E1ZUxKbXgxQmUrVjFaTEJWUkpWaDFBdHM0?=
 =?utf-8?B?ckJ6UFpSelZhdHhnTjZTZkZFVlM4Rm9zcXB2WG1Fdm01dUJrNEZUekF5U25H?=
 =?utf-8?B?dXJEK0VqNzcrSmhCaHh2ak1qQmtPSjhKVmVZN2UvRkV3UmVEOE1GR2tPZFVE?=
 =?utf-8?B?UG9PYlhUcnM2aHZhaFd5MUVTeFlFdEo2T0szTzYvZkk3K1dsS0VlK0pLYWo0?=
 =?utf-8?Q?HSVDSiv0MmU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dVNxVi9PN3IxVDJyRHE1YWEvNjduTDcwVGt4RjlXeUN5ZU5QRU81aVEvd3Nt?=
 =?utf-8?B?aWRzYXUwdCtuSGJvczVLOThEMVF6Q21OZGM1ZlhmZ1pLbGFNV2tzRDJFSmZr?=
 =?utf-8?B?dFRMWG9seUg0YndqUHMyMWJXcUhQcUpEaUVEd2hqY2VhUFYvMmZMN0hVV1F5?=
 =?utf-8?B?Ukc0NFRlQ1JabCtVcU9rd0NOaFVMa2hQUWVqOFdxOTEvQ1RGT0ZxMndVYW1J?=
 =?utf-8?B?enJYazUvTTZhanVEQ1l0YTdoZEt1Z3VkdURyeHovWlJhaTduQUVFd2pLR0FV?=
 =?utf-8?B?cmNQQWNyMitFMDFZQmhDVlZIYU5nd0krYzgzVnpXdVZYY2pzcTFpd1VHRkhF?=
 =?utf-8?B?TUxqbjFsUldLYzVXelpZazNSVTlocDJWbTNCZTltRGNKUTdEMUtNZG01Tit3?=
 =?utf-8?B?Z0tNNjVNVkF6VEpyYUNYcnFNWTgyZVdycklDQlB0L2xwYnlVSndyR2tsSk9k?=
 =?utf-8?B?bTd2dG9PdnZRNGdOeWtldkFNakxDdnNvL0IrNzZlU0ZUUktTdWpKUVZzWjNO?=
 =?utf-8?B?SFBuRitNa20xdmdZWGR2ZVloQkF5Y05FSFc2dGE2Q2g5TnU2QUZRVE5pV3l4?=
 =?utf-8?B?a2xHRk42RzB3ZHp5ZHBMenJSenJsem16K3dDSSsvdDgwdFB1L3lrcTN2OWlk?=
 =?utf-8?B?bVY2MWE0Qk9BNU1TaGtRL09mYzN2NjVjOE9GYlhIOHo1Uzc1ZDdWekZxY2pM?=
 =?utf-8?B?ZHJHZ0QyVGo4cGo2aWoza0RyVlorRVQ2eWtxTzZGWGkzSnp2bnBNOUVITnV3?=
 =?utf-8?B?UnFHeVZkQmg2alZHcnk5QkhxUDVORU9ybDlaVFYvNXFmU0ovK1hpcGlXNFFo?=
 =?utf-8?B?WnBmVlNMeUs0SVRlVFVJelV4Y1RJZWFVQXlZNEpjRVY3K2UrMEZ0MDlxQVhV?=
 =?utf-8?B?bEhjWjJTQXNTaVRKQ0NhQ3hsTm5NSE5lSmRNcmROYnFnaXo2M2xUMm5idHFY?=
 =?utf-8?B?Um41YmI4TjhGWG5vN3grcHNuUHdWTnJqNStqRzM4U3lrcXkrUFZUNm9mOHJo?=
 =?utf-8?B?Z2RvVjBITEF6NWVrdlRGbVZFRGU0M09iK08rc2VsbnBzalQwRGtaOHhtOEJW?=
 =?utf-8?B?R3JQU0ptMHQ2UU0yM2FBTVV0QnAwQVpyMSs1cXllR2dCZ3BWMUtwWnl2cW1R?=
 =?utf-8?B?M3JnYzV0OE9GZE45dFN6VVpLVm5ETmRVaFNaUVFpeHZ4SHJPSE0vWWNaKys2?=
 =?utf-8?B?SnFCRElLeHk4UjY0YzMrQ3ovRUNGOFBFQkxSalJPblRBTlBjNFdHaHhmRTlx?=
 =?utf-8?B?QVNvbjBhR3ZVeFlNRmE1bFNRcTdmeU5jNWwvUURkVEg0ZWlxc3BSdXFMeGY2?=
 =?utf-8?B?Mk5YVnJlUjdGc1d0TVJqUmZvWmtGekJLSE1SSVhuQVlGZmErUjVSc2VyM0RF?=
 =?utf-8?B?bXVybk55Qm1saDZIb1p6bjVjMGRBMjRVWFordjhad3RxUkpYK2duMUk5eVdW?=
 =?utf-8?B?QmNYYWRuc0dJSkdBOWhMRm5kQTNoL0pUUDZTMXhtTGh4V05tN3BCR1hNa2Fu?=
 =?utf-8?B?bjJsK0p1M0k4bTg5UWEzSytYenVDMnBjbytjZUV1UWRLQnpoaHM2NTJrL2Fm?=
 =?utf-8?B?Tkh6aU1HN252VEx6RTE2azk3UzNVbC81WDYycmdBaEVTSFNJWnZhMllTVzZE?=
 =?utf-8?B?Qm5oaFFCQWNBYVY0aVZsckpZZFhIcFlzNlUzS2RwRGZyZHhOeXVEdkhJR2h2?=
 =?utf-8?B?S09yU2lwMVFPOXB1SG11Y29SZGRXZUhkR0NWNFZuTlphbGJMTkc0YzBzV1BI?=
 =?utf-8?B?b1hPWDFMY3FkV0xTaXFlYVFROW96Syt1UlFSVVluaXppRC9HR3RxQkhHSEYz?=
 =?utf-8?B?MUhzekZJdHBJc3d5azZObHg1cFFhNnRrNE9rQnJvaDl2Y01FdElxNkYvKzR0?=
 =?utf-8?B?ZU5ZNXJQaWRzbC85czBJekJZT05OMFBtenlGZE9QeXdRL0t6WVVSbXhtK3pv?=
 =?utf-8?B?VkJtdGwrM0R4Q25BeGdIb1lwQ3pVNENPSDcvUEpyV21Jem1zbmhCNS9zN1kv?=
 =?utf-8?B?c2lhSUJkZFMvNTFySGE5YjVvNnVWUHVHWkVyY2VhL1c3d3p2L2gzMmZtQytL?=
 =?utf-8?B?azJCajhGTEJ0UVRnRlJCUlRrVnFYOFZQUngrR1BBeWZGdXhzTE5jR283T3dx?=
 =?utf-8?Q?P86tfsz+jX3oW4GMJ76uJi6R9?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84b305cd-b900-49a5-ac0f-08ddaaab9dc4
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2025 18:53:42.1114 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rdOXlDkBvw1UQX+sLvErR0dqZlnQI13ZWwrP8Nr1iJWqkHj+SnXAGOYNYqljBDr2PknZHOuZhu2JxNRGekA6Xg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6873
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

On 6/13/2025 9:58 AM, Melissa Wen wrote:
> Since [1], we can use drm_edid_product_id to get debug info from
> drm_edid instead of directly parsing EDID.
> 
> Link: https://lore.kernel.org/dri-devel/cover.1712655867.git.jani.nikula@intel.com/ [1]

This is a pretty old commit.  It's landed now a while, right?
I'd say if you're going to reference it in the changelog it should be 
referenced by commit ABC123 ("Foo the bar").

> Signed-off-by: Melissa Wen <mwen@igalia.com>
> ---
>   .../drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c | 15 ++++++++-------
>   1 file changed, 8 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> index 5543780f1024..b1085f1195f7 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> @@ -109,6 +109,7 @@ enum dc_edid_status dm_helpers_parse_edid_caps(
>   	struct drm_device *dev = connector->dev;
>   	struct edid *edid_buf = edid ? (struct edid *) edid->raw_edid : NULL;
>   	const struct drm_edid *drm_edid;
> +	struct drm_edid_product_id product_id;
>   	struct cea_sad *sads;
>   	int sad_count = -1;
>   	int sadb_count = -1;
> @@ -125,13 +126,13 @@ enum dc_edid_status dm_helpers_parse_edid_caps(
>   	if (!drm_edid_valid(drm_edid))
>   		result = EDID_BAD_CHECKSUM;
>   
> -	edid_caps->manufacturer_id = (uint16_t) edid_buf->mfg_id[0] |
> -					((uint16_t) edid_buf->mfg_id[1])<<8;
> -	edid_caps->product_id = (uint16_t) edid_buf->prod_code[0] |
> -					((uint16_t) edid_buf->prod_code[1])<<8;
> -	edid_caps->serial_number = edid_buf->serial;
> -	edid_caps->manufacture_week = edid_buf->mfg_week;
> -	edid_caps->manufacture_year = edid_buf->mfg_year;
> +	drm_edid_get_product_id(drm_edid, &product_id);
> +
> +	edid_caps->manufacturer_id = product_id.manufacturer_name;
> +	edid_caps->product_id = le16_to_cpu(product_id.product_code);
> +	edid_caps->serial_number = le32_to_cpu(product_id.serial_number);
> +	edid_caps->manufacture_week = product_id.week_of_manufacture;
> +	edid_caps->manufacture_year = product_id.year_of_manufacture;
>   
>   	drm_edid_get_monitor_name(edid_buf,
>   				  edid_caps->display_name,

