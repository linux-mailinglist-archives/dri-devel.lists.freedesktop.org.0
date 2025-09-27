Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C332BA56C2
	for <lists+dri-devel@lfdr.de>; Sat, 27 Sep 2025 02:33:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 692FF10EAF6;
	Sat, 27 Sep 2025 00:32:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="WIQ8Rzio";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013064.outbound.protection.outlook.com
 [40.107.201.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7981810EAF6;
 Sat, 27 Sep 2025 00:32:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RkYl/joAv8q51ii7rjO23nZOtBPxp7yBjXw13He1Fo7btORPzmerXN7BkUAhbJAXdHXt3npQHum/VVBd+vvuJs5tMHHr2DZ/AL5O8Y5NqJEr88F/rVzyjL7xMQdXKjEZvJSldhYXgu2h/l2ab5AocXcND7y9bVYULCPIJtV3ZID3NMLcOv789Ga8nl9DpR4gVFULGgMohWXGLzM54cys2R6Xo+mPTidJdy/1gCDUIKVgxtglGfogIF7u5BC4v4SqADhac1PToTf7nLi9EDnnaq3pZaqcRC9icuXy/TklDjZNMunN0vurmTi0jijYsBoebJWstmpyktCXmxPhqwD/BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bcp3dwfhsrougl2Gc0K+3jDmizRpMkmYmDknK6hDEl8=;
 b=cPYVJ+QsEmvNudSENsreCvr/2uoKYzroxYB3oUK5o+EuHvuez2WYNg06IDwixt++cTrcK5eRe1aYIlSeKm6dmmGK6UZcO2MDNMinf5I6d86duajpOVsYzjf6b+oYLne4u1s6/S9A176hyextFB5KjYtwm0wS+CvQboPN8FbH1gGM/paD6pbspu/8gY2p47k4DkzzRXrjWVuQF5LYLYJicEjbTd9GaIoo/2YwcrHW/2dwMd9PeraHEv9iR0yKUnKGGcwoGKY3NGA8BSTr16+ldZqBVcjAqGVCWc/lFyqv2XQ6RU1ILaXN9l0Wht5enU5u8GdjN916YcnbuB11r1R01A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bcp3dwfhsrougl2Gc0K+3jDmizRpMkmYmDknK6hDEl8=;
 b=WIQ8Rzio37+wFYCNHy6U/0R/HqEMDDdBXmLEXWfSFNFsPmyVtqdx5NIH9YnkpECgL0VjdxOAV1nd3H5U/DBWemt2If4lKl/sRAYnKhObCcMP/ow8hu6XN5ubUASw8DFmlPb/gOBnMa2OHvbJoZ5N4ZnBPpXAdGlbPRovMb6RSLD1EI3hLzaVPJrlKRrgCryvOCmeEj7Ov8Yf98vJBoUtJCX5xynl6kBf7tx5IU4JPLy1KyRfSZgWzAaNGlm1Lij8y5TwjyLZzCY4Fpb1nYaHM37WEbhnjPibWN6EHZ+ulEFowRU5VIohhWtmtTkvgcyBypwQ1x3TpY/NN1PLZspFcw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4127.namprd12.prod.outlook.com (2603:10b6:208:1d1::24)
 by DM4PR12MB5818.namprd12.prod.outlook.com (2603:10b6:8:62::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.13; Sat, 27 Sep
 2025 00:32:48 +0000
Received: from MN2PR12MB4127.namprd12.prod.outlook.com
 ([fe80::a0ad:4e23:765e:7cb6]) by MN2PR12MB4127.namprd12.prod.outlook.com
 ([fe80::a0ad:4e23:765e:7cb6%4]) with mapi id 15.20.9137.018; Sat, 27 Sep 2025
 00:32:48 +0000
Message-ID: <eef10aab-ebff-40af-af2a-ab2a831f3f90@nvidia.com>
Date: Fri, 26 Sep 2025 17:32:06 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] gpu: nova-core: gsp: do not unwrap() SGEntry
To: Danilo Krummrich <dakr@kernel.org>, acourbot@nvidia.com,
 ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com,
 gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org,
 a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org
References: <20250926130623.61316-1-dakr@kernel.org>
 <20250926130623.61316-2-dakr@kernel.org>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <20250926130623.61316-2-dakr@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0122.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::7) To MN2PR12MB4127.namprd12.prod.outlook.com
 (2603:10b6:208:1d1::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB4127:EE_|DM4PR12MB5818:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f33dbb5-4ce2-425d-8334-08ddfd5d6289
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|921020|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SXJiNFJOdlNjM0VsRmVNZVhxUHByVEduRk1rUmw3YStYY3FQL3R3dTBJd3Qz?=
 =?utf-8?B?MXNJVUpXZHh3TE95VzRzWTI4TG91dTg2M3Z0Qk0xWllSN2c0VmdiZVdWSExz?=
 =?utf-8?B?WXBNSmQ4VkFBZW10dG50cEFGckJDTVVaekpTOEFCVGRHcEpUREt5QnlkaGhk?=
 =?utf-8?B?QTI4bTl1a2diN3BRMjJMQW9CTXRmUGVRYWpaL2Z1dDdtV0lwT2ZkN01pZ0Nl?=
 =?utf-8?B?dmcxaGVTQmUrUnpzQ05zVmpDVTMwUzdJOE5YZmkxUkkxN3JYRG5wTGcrQk5x?=
 =?utf-8?B?ZWxLMS82UDlCNngrSEh1Q3lsaXp5Vy9UamhiVlhpWnVkTEdOdzZNcVFSR0Jq?=
 =?utf-8?B?bDAzQk0vOTFET2hlRUJwQTJLd0ozMXR3NFUvaTdXK21BZGp1MnNNb1B4TlFG?=
 =?utf-8?B?c0czMlY0eU1zaFNncy9iUUtDdGZIck1yU0I2UVEySnlscEhkeHppWVNyZkR5?=
 =?utf-8?B?VkpXTDZIMDNaY056UGsyeWFQalUwVTNFZWx1cm5Ibi80SkMwNHhEUkZ5Wld1?=
 =?utf-8?B?ZDl6REFieVdZdy9WdFJQMm8xYjVUV1VkNG1DaFlSQmhiSGUydkxjVEhuTU8y?=
 =?utf-8?B?VzRJcy9lTlVxRGZ5cmlBMUE5OE0rTzgvQ2Jyb1NEN2JseWdibGdHRklRMUZO?=
 =?utf-8?B?NTV6L2JyTHBrTittSGxYR1dVRFZ6NUhYYzBFRTJkZFpUNUVsWXZScFFuRmdN?=
 =?utf-8?B?OXBLN1FEUC9lNGJaNHlmLytaQVFHZkZoeEF1eTY3Q1puRjVLQ1I0QkVXVnoz?=
 =?utf-8?B?cHpHaHcxazBIWWs4VTJCcXd2ZUlmdEZvK3A0by9JUnZsRXBiUFNXbDNhalNo?=
 =?utf-8?B?UURFTGlHNTJNSUU3STV5WTQ2aUV6YmtmcGlEemtXbENGNDB5cEFFVzVTclF3?=
 =?utf-8?B?VTRDVFoyWXdqdU5OSjJIbWREblNjMG5DWk5LYysrQWlINlFxLzREaE9oTy8r?=
 =?utf-8?B?OWF4Q1pDM0FaaENnNURZU1FYR0FhaGFnVFh6eVNqUGJvZGMxSVhIdFlqNWdK?=
 =?utf-8?B?eHZIVkFuWmx3VEdnbWtRenhsYU4zRWVRM0VrenkvQnd1TXNIdWlmSW9NMGZl?=
 =?utf-8?B?UFV5MDVkWndibzRQcjR4ejNSemhXOWVpL0NoVlZMZkFZSy8vR09LakY2RVQ2?=
 =?utf-8?B?eVd4OVFnK0VTc0cwVjd1WmtOclIyTytiQjRoZ0RYSk5CMk9KNDNkZzdBTXpU?=
 =?utf-8?B?U01DRjN6dFcwMjFFR0QrUHRaUWJvc2lnNkxSb2t4OTNNOTV3TndYUE16RlRB?=
 =?utf-8?B?TnlsVzVCcnR4K2pMM3JJY0RQOENSbFNtNjFyc0lBTnkrUmVCVysxQVk0Nm15?=
 =?utf-8?B?dzUzZ2JWZUhXZE4yYzVNa1ZmTyt4bjcxazVDRjBBYjdWR2QrZGhDeDYyenpR?=
 =?utf-8?B?ZVZ2UG1Xa2M4Wi8xcmFETmtFK1FXd2dsdWRiN0MxMnQ1UzM5T1FOanJVelZC?=
 =?utf-8?B?b1RMa09jc1RaVTE3QVBqejRVMWRpT09mdTlaTUdGd0xzUWFCaXpxMGhxWldi?=
 =?utf-8?B?S0RYZGorbi9NTmQ1QmhuZC9XSExSYjBJTXpEaU9rUVEvNjM3Y0xJUzFFZnM5?=
 =?utf-8?B?VzZISFZQYXhxY2RBNnllc0VqY1kvcmVZNVovYlI0STFKcXZHSjJ1amNSVU9j?=
 =?utf-8?B?VWhDM0tNL2kxZGlka0dQQ01CTXlHd0ZEanNndEQ1VnovYUR0N0t3eEZwMUdE?=
 =?utf-8?B?L0llSXRwWUpUR0dKNkNrQ0dkQzJKTkpWajFPWDdaZUxvbEJBbWtXWXhkTXEx?=
 =?utf-8?B?c3RJbklFM1VVdDhlVFdpbDVYaUdZcGRKbTBiNG5Kb0JWcEM0aHlldEQ3M2xE?=
 =?utf-8?B?TDRTN2JnaTdjY2plaU5NYTJjb1VjR25WcmdyY0R1b1JjcU9zdzY3QmgvQjZm?=
 =?utf-8?B?Y2ZsR1ZIYURGaXdMeWxZT29TZGp1MVJyYWN5SER5T1JMdm5NSk1WSlBnU3NW?=
 =?utf-8?B?S0srdG5lZUY4ZlJXaFNtU3FaeU1JN1p5OWtKUHMzZGVzNXI0U2tyM3lQQ0la?=
 =?utf-8?Q?/ccHtG11wnICBBbYL4XMv1justYrz8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4127.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(921020)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M1hKMk9ESC9BREVVaTlEaHlXb2ZEUi9ZUFNxOC9ZdS9SUmJBbXM1eWVJZUs4?=
 =?utf-8?B?UFRtL1NiYUd5ckZDYjJBdDZDUjhrTk1ieStaNGJWZFRHejN4cy9SN25qRjY2?=
 =?utf-8?B?QVFpMEFVSVlUNWZGeU1sSGZkL2xwV0VteXErd3VIY0F6S2MzbzlDa1l1S2FT?=
 =?utf-8?B?T0FXZ0IrSDZ0c0E0aDhUbm5tYlFuU1Nrc1k5WnlHVVkyZjROaHg2eUQ0OSt3?=
 =?utf-8?B?cWwxNUdKK2V4RVFNbm1weDZ4NTEvQzRCd0d2a0d5bHBOZnhZRXBVYzNra3l6?=
 =?utf-8?B?TCtSYit0cEU1L090UXdBVzY0YmZrU3haZVhDV2J0cWNnVFh2VTRLWXZ0Wm5H?=
 =?utf-8?B?WDc1NFQxVDZraW9PQzY2bVVyYTRGOTZXeWJRWU1MUW5aODRlTk9SbXJITk92?=
 =?utf-8?B?TFFEbDMzdlc4dUpodm4xVzI3UFduWXJBZlNvbWk3aUFENXJmajF4ZWJNeU1n?=
 =?utf-8?B?T0J1VXBod3AzMXBvZC9kZ0tkK2JSeENkY1VYOGllalJGa2c4d0pwb3VOQU1m?=
 =?utf-8?B?dVFodEkzZDdoQ2t6d3VRNXYzeFlkNy8vVk93WUdGV3hsd3pnR1M1SndYdEFC?=
 =?utf-8?B?ZmQra3U1ZHhzL3JRRkxveTFIOVlzSEo0NTRsMWVGNlI0cHBNZVhTbElDN0hn?=
 =?utf-8?B?dWRabVFTTXJGZGN4VjFaVWJiNWdEa2ZEZ0Q1bUxxL0lQbFBmcGExOGZNTkxS?=
 =?utf-8?B?Yml4am1Db2JEU0FmNFI4cEVtSzEyUXpBaDFTQlJhY2x2eXMyR3NRWUlJSGoy?=
 =?utf-8?B?ZmFjUFpLTTZVeko4cXNhMXRoa1ViaXRSVEFHV0RxODh0emdKYnB2Nzc5elZK?=
 =?utf-8?B?d2MxeUN6TG5objYyVE40OGlodkowWUZIT0p3TmRuaHBMU3AzN1hhRmFtbjVm?=
 =?utf-8?B?eFVFQlVlMGtDSHpmR3h3bjNCbVRHb1cvRVZpMk1FUjhYVG5jeEpmVTZDMFRq?=
 =?utf-8?B?Q0dqY2UzMmtEaUFFYzVid1lyMGNSUnpwTjc3YjJFQlZlbnJpUjlRdXEwaG82?=
 =?utf-8?B?ME9aQWFwOUI0ZVZoWmY4eDUxZE1CdXh2YlRLQkJiVHhvUmZ0ZjBXVCtzNnVx?=
 =?utf-8?B?UXY2em1QYkdKS25JR2RIWERRSHREdVk3TTBZRERyQlJJRkVzZmEyRjdMMlhH?=
 =?utf-8?B?WTFnN1dHRjJwUVFwc25yMHdxMDBlckR5M2g4blJLYmZrYVVWakV1VTVHZlhl?=
 =?utf-8?B?aGk2ZEJqZXpGTlp1Y1VZQzJ6cldZUGtNMitCbjBPTEx1TUFmdUhNdFNFMWJZ?=
 =?utf-8?B?bDdGSzQ2MTBDMEJOeUVoU2dlN2FXbjgxbXVLaU04SnFqMnd3Nk1ybVNtZ3k1?=
 =?utf-8?B?RDhCUksxc0xzM1E1UkpTZEtITlA3U2RjSUg2dHV1bkxhZjNld1NCUERxbis2?=
 =?utf-8?B?UVpFb2Uvb1FKYUlzcEdGbHhwTlZvVTR2NHJtN3JHZFVmRU5IYWhLTDZaNUtO?=
 =?utf-8?B?VmRlME52TFBFdWtZOGF4cXJKa25pZ3dpT1pkVXhGNW1wTWNZTzN5WCs5ajBG?=
 =?utf-8?B?N3NJMFBmeHZZdXI1SzFwSzE2UG5Fai9tSlFZWkpGaTFVcnZ3M1puSGlTQlpP?=
 =?utf-8?B?WTR6clVBdzBoMityZ0xySFdDa2w4WUVzUklZeTVuMGZZU2pBN24yRnJNVXc5?=
 =?utf-8?B?MG83V0tPM2pUVGEzdm4yMnZzaGFDZGVwdE9renpkMmwvMTRKR3NOT2NaOTJW?=
 =?utf-8?B?dWkxS3dYbWE2NFdBanE0NFB4emdYc09uWTNrR1d4Nm9oMlZEWVc0QlhzWlVs?=
 =?utf-8?B?OGFRcWZESzJZRU1Wa3JFSnhaQ0djbC9lejE5bm9FVHhiMWhtbWRkWTNPUHJm?=
 =?utf-8?B?S1QyNkhoZWwxbkNYNHAxVXNJZGw1d29rWmQvQ1VMUVRzWUN1UXpxTmNJczNj?=
 =?utf-8?B?V09kR01IdldPL1VtUlN5OCtLQThLeHVwTVJtbmpFNUg0dmVqYWIzZ3lRL21q?=
 =?utf-8?B?cWtSd3ppQlNJQm1URzBmMnJsa2xVMWRnOUNFUTVNQmUvVXY3Z1JGanhPMkRt?=
 =?utf-8?B?dEZrdC8rSjBMN0N4dEVOdGVWSnhkaFJtSWZaczVWNXQySWxObkVqeGVac1B4?=
 =?utf-8?B?TjVjekRIWmtXMW9NamZaaXVXcXEwa1cwVi9FOWpDNXJEaUJ3Qm1Ma0ZaaHhS?=
 =?utf-8?Q?XMhHTuK/Cwox4Xv2QDQAyYKrs?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f33dbb5-4ce2-425d-8334-08ddfd5d6289
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4127.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2025 00:32:48.5001 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RsnI6MOu9f7cSEM8cwKqoBEQmt4IorYQTd0WplSsa8YJUFyra2J3LRfa8UHmQu0t1N56Y3Ru+p2ZAiUAw2FXiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5818
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

On 9/26/25 6:05 AM, Danilo Krummrich wrote:
> Don't use unwrap() to extract an Option<SGEntry>, instead handle the
> error condition gracefully.
> 
> Fixes: a841614e607c ("gpu: nova-core: firmware: process and prepare the GSP firmware")
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> ---
>  drivers/gpu/nova-core/firmware/gsp.rs | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 

Looks good!

Reviewed-by: John Hubbard <jhubbard@nvidia.com>


thanks,
John Hubbard

> diff --git a/drivers/gpu/nova-core/firmware/gsp.rs b/drivers/gpu/nova-core/firmware/gsp.rs
> index ca785860e1c8..6b0761460a57 100644
> --- a/drivers/gpu/nova-core/firmware/gsp.rs
> +++ b/drivers/gpu/nova-core/firmware/gsp.rs
> @@ -202,9 +202,10 @@ pub(crate) fn new<'a, 'b>(
>                  let mut level0_data = kvec![0u8; GSP_PAGE_SIZE]?;
>  
>                  // Fill level 1 page entry.
> -                let level1_entry = level1.iter().next().unwrap().dma_address();
> -                let dst = &mut level0_data[..size_of_val(&level1_entry)];
> -                dst.copy_from_slice(&level1_entry.to_le_bytes());
> +                let level1_entry = level1.iter().next().ok_or(EINVAL)?;
> +                let level1_entry_addr = level1_entry.dma_address();
> +                let dst = &mut level0_data[..size_of_val(&level1_entry_addr)];
> +                dst.copy_from_slice(&level1_entry_addr.to_le_bytes());
>  
>                  // Turn the level0 page table into a [`DmaObject`].
>                  DmaObject::from_data(dev, &level0_data)?


