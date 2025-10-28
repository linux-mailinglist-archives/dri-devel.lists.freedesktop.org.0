Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50B1FC146C2
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 12:43:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3E9B10E38A;
	Tue, 28 Oct 2025 11:43:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="pXVrDHCB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010029.outbound.protection.outlook.com [52.101.56.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E228510E38A;
 Tue, 28 Oct 2025 11:43:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fcyazG8uCx57fRprOWm5JZWMblY3WMuPMqPNN1J/kdczIPMlYvP5tM5z9xn8zv3XhPONea/oowyt5lQvhcPTtiC+y0iYCV5ankYp4PZmqN0qZvq3NWWqCytRx0+ljBOteFLMK5ygYEfAeeL+t9C4qydzd3w59sS4xXcwsfehmk0k4geip6yl9epWKMA4/sPgB0/xFafq+KWIvIiTxtCoqLPiFVaqR5yMvzpVAulm5j8v/dofdteeDkTAt/sAc4n8xJ1jjUUV41ocVm0fZWNQ4IyTRZDlFEgupyXJIkQtG2a0+HOqvJebVl/PgfFB4BFQptxOPD811H68Ck2K0fugHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fj8cF77kCFzYN9FB5bnj3n2JWZ0DU7jV4gab6q3FYW8=;
 b=yNGNueA0ACxqICTNikPVcGnL602XvWbSIa1G/tmGFSlgnSQepGEVQnJB4vpgX1RC96IaCoh3A+eBO5N/YgWAaJEV/7NVP8jKxfzu9bDPkN2mVJUwzrFcvRWNbX9pmuQx4+xIfI2YpO7/7jdU6ngbpTL4R8l1gbX7sGhWcKtdo6epXs0nqMrd0IR0Gi48Eto7NQy0FQo3JsSil3HuMyujyKtwM4ZZy90RlDWhtrrTRc2ynxu2xMYXVkAa56Tch/iQSP/xzrdYZ/7nRTpfPOkSLyfreAcjaJWV3XYP4f5Tk8JYpI1eSWF0yzVxictTt2DVI5CGHW1EE0194o6qVdmhIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fj8cF77kCFzYN9FB5bnj3n2JWZ0DU7jV4gab6q3FYW8=;
 b=pXVrDHCBVxTx80g2zY+PtXB1fZyVMhiCRO9iki2VtN2D1fG24fJMBSS43aVpsopdtlqP65rMDKUZaTJgwQlua03Rva1B5kfQSrxRI3nE8FSybSuzXuVRx9r0Z9hqahQSkpP0slkCGDThyryXXt6bIE3bQsEJJZKIu0zqH4Fxcl9qP1I4lwHlvD8BnIVuFunbdK6LxXcuDf+0IEEVUMtzLYleYlN8jTKqY/TaqYWcAJI0/OwyMKtVeOzqRe0ybp0OZ0u+HWC1+8eJWMuk9eOu3wKPwUpQHCHvT9vYLioJ+0weq0wEGndb0g57kAVTtwPXiCxGqn7LI8qOgGEQgmwcIQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by MW3PR12MB4459.namprd12.prod.outlook.com (2603:10b6:303:56::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.13; Tue, 28 Oct
 2025 11:42:58 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9253.017; Tue, 28 Oct 2025
 11:42:58 +0000
Content-Type: text/plain; charset=UTF-8
Date: Tue, 28 Oct 2025 20:42:54 +0900
Message-Id: <DDTXFOUXB38J.1EGUX4U5V0TQL@nvidia.com>
Cc: <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <rust-for-linux@vger.kernel.org>, "Nouveau"
 <nouveau-bounces@lists.freedesktop.org>
Subject: Re: [PATCH 2/2] drm: nova: select NOVA_CORE
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Danilo Krummrich" <dakr@kernel.org>, <aliceryhl@google.com>,
 <acourbot@nvidia.com>, <jhubbard@nvidia.com>
Content-Transfer-Encoding: quoted-printable
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251028110058.340320-1-dakr@kernel.org>
 <20251028110058.340320-2-dakr@kernel.org>
In-Reply-To: <20251028110058.340320-2-dakr@kernel.org>
X-ClientProxiedBy: TYCP286CA0369.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:79::13) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|MW3PR12MB4459:EE_
X-MS-Office365-Filtering-Correlation-Id: 47ec0ccb-557b-44da-a028-08de1617241b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|10070799003|376014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eUlLWmRaYjN6WWJKZ3ZEb0tSOGllcTE1UTEvazY2cmlub2U1UlAyYmxqZitu?=
 =?utf-8?B?TnkrV090emdHWmRkdFp4enJwMWM2ZmJ3L0NpK3JVNjJZYUV4Y3hPY1NJK2tE?=
 =?utf-8?B?NkR3WWUxSFR4RGhmSURtSGVmU1Bwc0pJeVFEdGtIU0x2RW5ZTlluMEZWdHRD?=
 =?utf-8?B?SDZ4bzVldTV3dFdTb3kwN0M1YnV0T2NnaC9oMXd3NUVld1dCUDFPVHNoWlQ5?=
 =?utf-8?B?cU9teWM3ODBmcFQveHg3SzdjU0p6ZU4rV2JxM3NOOXAvaG9BL2oyd3dFMlgv?=
 =?utf-8?B?bm9xUmYwL0w3Q1UxUW1PZDJhMGdtZ1Jia1lXUnlUSGdvOVF4OTdsZno2L2dr?=
 =?utf-8?B?dGxvenF6NUgwelkrZnZhZVZtU1Z6MkJPYU9PKzJ4d2N6SjdjNGlKeDNYZjJi?=
 =?utf-8?B?dU9PUTE1VDVKTlg2TldiNi8zRE04TVE3ZG1KMEFzYklVcE9KU2ozSW9YK0lZ?=
 =?utf-8?B?eWxtc0IvZThOejB2dGdhUE1Ca05TRUpZejVxbzJIK3R3YWFqdXViRkdMeGx0?=
 =?utf-8?B?NDROQW0vTUZiTWx0bmZ0YkN2OE85bFJGKzZ2Y1BlN0lxUkZaeWx2SkVYVkxE?=
 =?utf-8?B?TVdYekFvZmZmREJYYWswMERFRENsS2wxYjBQbXd1bm91dnFCRGs3djNCdmJJ?=
 =?utf-8?B?dStEWkZ0SE5uL1M0eUdWbmI0M1RCT2ZqVThmR2lEVExqQmUwd2oxbWlwdnVy?=
 =?utf-8?B?WWlqL00zK2xvTS9YNkY4bnRFVTN2Q3Q5QmI4UWhhZTFncTA2NStFbWduK2Qz?=
 =?utf-8?B?STZKTjNaTm1nbjZ6bDZvWG5zbnZGalN1M0d5c2NNTXJ0bGdLeFA4ZzA4aDZY?=
 =?utf-8?B?ZmV2M3JpTTZSbllQbU5zeWtLTWJ0RHYxRVRQaW9KSjczd1ZBdVE5RmJKbDA0?=
 =?utf-8?B?U2R2Z2ZaQUY1NzhJNmZMOXVRS0RoQlB6N3VGMXp4My81NGZiRTkyOEhLVzlT?=
 =?utf-8?B?MlZTVis3R1dHUnRkTTJ5UC9vcld0Ym1wY1kzM3FLaHNmUlZyZGl5Yk1TUFcy?=
 =?utf-8?B?ZThVTDErbHFybGhwaG1zdW1RTllKQWVkRkhsZ3JNUHQ4QWRzRWJQRVZpWGEz?=
 =?utf-8?B?SVc3eVpyUm4ycDAvV2JtUmJsN0J4UEFVdWE4UEFUMDBCa3pyQ1ZXNEl5TWNF?=
 =?utf-8?B?dFdCRmFSa0k2Sy9taVIzVU56YU92VDJiZUVpdnNwbGQ3YjZ2ZzAwc3JHMU9o?=
 =?utf-8?B?RlE4c1lHSWovL2s1R3J6VGJ5ZExGVzB4OFRRUngxQmtLM0tiWk9BL0pNNWJE?=
 =?utf-8?B?V3NISFV3YjN6d3R6ZjFsMDlYd0xndm5TMUN6Y2JWblhOUDkxUjZzS3FsZk9C?=
 =?utf-8?B?Z3hLc3hveldYQ2oxT3c3ZTc1MlNZdUVnRmVCNk1EK2ZWQ3c1b3Y2Rys4aWt0?=
 =?utf-8?B?N2pvRUJrbjc2eFl5Z3VrbCtvVEE4RkgyZndDall3bjZTT0tzdmVuSGdXOGE2?=
 =?utf-8?B?VENYdnFxRm8veEtEdnZpOTBtVDNtYWRNK0J4dzA4bk9iZkNNbnpZK09UZW16?=
 =?utf-8?B?VVBTSXBZQnNhRTR6NndXSS9BQktPSXZkY0Ntc3NpclNIaEdHTzlZOCtlbDZm?=
 =?utf-8?B?Skg3TmQzYzdwTXcwYnd4VXZFdWhQaWRUd2NONzlMOGJBM1MzUXBaQ1dhbHZK?=
 =?utf-8?B?djJ3MU92TEphaWVWYys2REw5eWJSU1ZHdFFLWkZ3eDVoMHJ2LzYrREJ0cEY4?=
 =?utf-8?B?WkwxTHRiK1Buamp2Y3M1NXVkcmsza0RoNEdVWHR1ZzRPUXpqUFdiLytmSFlv?=
 =?utf-8?B?UlowV2RGT2pIY0FIWHVuc3R4dFk3VUM3aVM3YlpGY2o0TzM0MjVGQlpPZklU?=
 =?utf-8?B?YUtlbC92MmxNM0ZMcm1tU3lGanB0UWtvcWNNOHZsR2RpTFB1YkhyTEk4TW94?=
 =?utf-8?B?bTJOMVZRbFp3MExpTDVPcVpHbDIreWc1MFNYaWwxOXNPTFdWWnZDVnc2VVdz?=
 =?utf-8?Q?MxYDe9YXXYlDJOXfNI+QfYxg68MRrMn1?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(10070799003)(376014)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WDJMQzlwM3lPOC9WNEl0eHgzRjlwT0M3UXVKelN0SDI0SHlkQWlvRHUrbXZN?=
 =?utf-8?B?cWtoVTFXTmx2T0xTNW9KUnpETWM5MU1HQ2IxcFJhQ1JEY0luRnNkc2ZUM29x?=
 =?utf-8?B?YjRUbFRqbCtxR0dLb0NacFZQYjBxZ09WNFNRRTVPc2NuVkVEd0YvQVA0b25w?=
 =?utf-8?B?WGpuaHNON1JSVXJSQkFqQWk4M2swLzJJbzdWWnRyajJCWDNUSTNOTHUwZTZH?=
 =?utf-8?B?OGhCY0pmOHMyWXVMMDUrSzExNmJZb1JmRllLZTlZRXZUUWZzdkRpblVnSWUy?=
 =?utf-8?B?elJzTG5ScWlYdTR4OXQyTjZoRldhNUpjSWlNa1FHb3ArUkkvS3Q3ZDhmK1dN?=
 =?utf-8?B?SjdXejEzbVRqQng0VG1ZYTRWYnVoa2xITGkyZHc4T3pzSzJKVnZzRTNWZFJL?=
 =?utf-8?B?cUZ1TWlmS0FwbE5Sd1phN25IMVg0bWFubHJOM2plb1Z3TjkwbE1hRitsTlR3?=
 =?utf-8?B?aFMzeUJrcXhEQ3p1ejRiR01JOFd4dU1wMVNTSmNIRHZUckFtRjNTZU1LQldY?=
 =?utf-8?B?NFhPell5Y1FNRGRJU2pZeTZ5TTBDYlF3MFhjR1d6S3BuOWRMUm5GTmRpTFcz?=
 =?utf-8?B?TXovbkZEZVg5U1ZKRDRnY1NxTFRuOER5dmk0OUY1WXhnVDkyRTNISVVZQzMz?=
 =?utf-8?B?YktldmM3dEpqa01NU0Q1NGZNeUlvNm1XYzRRMGxFa2Y3eFhhWlcxeW8xYWkw?=
 =?utf-8?B?MHZiQ1ptR0V3UGlyMWUxSDFZUS9nS2dLcFVMeC9zbm9oRUptOUp2SThsUGhm?=
 =?utf-8?B?THMvY2huUG1CQWthNGg0Qk9hdk5aM0lOTkFxamRlSHJBNmtDU3BlNDZqcHNo?=
 =?utf-8?B?bi8rZjh3Tzc5QVhZQkVXUktaR05FaEhWcDgySEhKUmRpK1dpYWYyWFh6RG9j?=
 =?utf-8?B?b3phNTFUY2IydTlueG41RENMdjA0bXF1dnRmUEpTb0VhWVRSUmlyWXVqdSs1?=
 =?utf-8?B?S2Z2SjUyYWh3YXVQSDBZUm51aUN4VlY0QTRGSy9FUEh5MGZnWmhDNEVKOHZK?=
 =?utf-8?B?eFNJdlhpdTlFTkRVdmN2SThtaFlEVjQycTRONzJvendoMWtHN0hFK3NvT3FM?=
 =?utf-8?B?ZnNkUHJQWGlTTUgxdGgzWmxFVTd3N0hoRVRkRHBhMENjTlNNanRzL3FYSExL?=
 =?utf-8?B?UGthZHQwUzFleFRNWWFtb2lqMmV0SnRhTHdpdnp2di9Ea0xkVW8wakFGZzA4?=
 =?utf-8?B?YmcvNnJpRUZrRko1UGJYYXdRb05URWl4ZUJJYTFIODVrVmdtMDB1L2pib0JE?=
 =?utf-8?B?RVhDOHFheSt0WkZ6dGl5SURJUk5VTDR4VDJEQkQ3NmIrTW8xTGRFOEhBN0Jy?=
 =?utf-8?B?eUVnMXlPejhvaXhHY1ViVUJtTjJWWnVpaDVaMzAvQ2lmTml2bUcrOVMxYnJn?=
 =?utf-8?B?Z3VRYXdRWWZzVVZkKzJhZjRRZjcvSERRcitDQXpmQXdQVUhXOWplRjBubVhJ?=
 =?utf-8?B?b3ZDTUdHaVNiWkswM2loR1RpMjdoV21Dcy9hZjM2amF3UVkyZVd4S1p2ODNW?=
 =?utf-8?B?eWNZRk1zeEhVKzFlNHBVSUQzeDFNZWdybVpyRzdsQjRMbUFmNkhUK01HLzFr?=
 =?utf-8?B?UXh3UHhKcW1HeHRTWkxnMlBmOUZ5akdobitueUg0YVdsMVM2aURxdG1HbzhG?=
 =?utf-8?B?aHFXYnkrNW1EOC9aM29xZVBEUlo4cDZwRGUrRVdNaHdTbGgvUUhoYURwNHZj?=
 =?utf-8?B?SHYwU3RmT3l1UVpqRGFwNDVhWFN4R0xEZE5nNEI3aEFic0ZzTTJkTDBvYWxp?=
 =?utf-8?B?Sk5mYnFrREF4Y09ZQlBDQi8ycDJEd25aYVZLdnJ6eWVqcnpKb3Q5MWVxL2Ja?=
 =?utf-8?B?QitKdUZSZ1lMMmVzZnZNbnF1NHZrdkRnMHhWUTJDMUFGcmJ3YXJyd2cyVlJF?=
 =?utf-8?B?NC9SRDhIVlZ3dWUvZHkxb1ZKYkpZSnRxY2RlL3BnaXBlVGZTWEVSUmp6ZGw5?=
 =?utf-8?B?dE1KMGoyUi9VRTZpY1IvQXBUUWV6dksyZithZUJnMjUxcnRTR0FOQ2xJVk5Q?=
 =?utf-8?B?R1BqK3M4S1FjanZwVFVRYzBDREdKR1VWRUIreWFHRVI0N0RDV1BwRkpBMlBN?=
 =?utf-8?B?a3B6MGI1UHBpOWNVQktlSExoeWVRR1NMeGZrTlhzSHdFMEc5NVY3UHEza0Zh?=
 =?utf-8?B?RXVqaGJhRVVCNWxrNTVoQzQ3M2tVMjFhaU9FNi9TTTlibnVGVVV0VFNSRHQ4?=
 =?utf-8?Q?hkNGJujk4bvhkKnIpUaQchW/F2r1awMJ4BnN53itkVAr?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47ec0ccb-557b-44da-a028-08de1617241b
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2025 11:42:58.0299 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i4a1+AV0UtJFCTKGoQk+LIAUpq3HnMUBoOEIm1Nei5BjDNL8D9AFo3D5oAgrKCJP4S5G7yg5ApjnxTZqfMjRxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4459
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

On Tue Oct 28, 2025 at 8:00 PM JST, Danilo Krummrich wrote:
> The nova-drm driver does not provide any value without nova-core being
> selected as well, hence select NOVA_CORE.
>
> Fixes: cdeaeb9dd762 ("drm: nova-drm: add initial driver skeleton")
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
