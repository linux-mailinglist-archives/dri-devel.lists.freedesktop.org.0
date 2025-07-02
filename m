Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13582AF12F4
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jul 2025 13:01:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11B7A10E6E7;
	Wed,  2 Jul 2025 11:01:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Ozg7UW1D";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2049.outbound.protection.outlook.com [40.107.92.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD2B410E6D5;
 Wed,  2 Jul 2025 11:01:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JPG0Z5yF0NPsy19y+Gz9Thkg5yOygSfLl1z8h7ZIDJuj6tNU5WpMmkh5CMEV3mfd9Lldb/WHM7YndUgGwIYl74VDvkdLa0olO6kWq8DP/k1wrsZUz1IKyvJv0/yw4ZZYzj21pHiyE815T8IYyBSkgTPzUjghoX9ttvuiSO/XJtJh2PNmg13MZNLoQUziiILgmikmB7yr3F9e3rZG6X894rwJiM/8Rn3U2JlCedaB0tg2vb9mKoxfgmiiGPx/NESxbEp1CQGf3h8TmKDzS283Uub3vonHGDtnnfU3d0qaL4/hKU0x+P53PyQAJP/8XhUsI5A7JKMGKUx2F3stvNZqyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RM4F8/tZnam+JP8hPdPF4svhwQ8Ig/bKiuPRHQMc1rg=;
 b=TJIoJjsKnjLyD36dwWOVEXOGIJUyBiyzOfR077dMIo0S/GXGwHSONzIjNqJNDL7VpZvbJUnAxXqW4qYsADa0v5PPwF7rc33WDygqn2mvWq0am5J+WoRXxPo4pwc42vdINP3Zzkf03kAJ5bd+LOKLoGNmpXXh8LDzBkObvEuYduunzK/tLSzp6NBj0cqSyIPYEk1R63NaffWqmRVpxqYw+t1WEj9L2EArsT+mxI3dtY776nM5UiZsjLAI91goqdDmSHZetoxHmHejTm135vh+b6dK8xXo5F3QQ7CLhGxocQHB23tMoPXTOXQYerQng633OZH3Jqt6lGHnH1mJIYFJ7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RM4F8/tZnam+JP8hPdPF4svhwQ8Ig/bKiuPRHQMc1rg=;
 b=Ozg7UW1D9Wrx7PcP6dMN5IwAYk/5Y3IfDBNMpeieNCY9tTwy7Em4l6/lTXkurZ2g0mkGLtWSf9P0VOND3+qQMpCd0t1VDE/tj+fLLYPDgX3DkZX05CSkL+Pp5tCwKQf/K4S8nhfi17IaRmQN8jocjL4529hMiupcsLKQzPfoW8mSQ/cHgb/GJu1lOKuRR9a6I0cXEqY/spceZjlUHzrpARpY0Rvi/pHnE1QUCrwNmYjbiXb7H4Z8OeWncv2JiFc261MTk6gJmPq7ARYEbqE2ooBwKUuWNChut+Ox12eAPCo2dzAldbRmo8pDjHPIT2Uc/Rcd4e/A7zGHkmvtdp/9Og==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CYYPR12MB8892.namprd12.prod.outlook.com (2603:10b6:930:be::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.22; Wed, 2 Jul
 2025 11:01:03 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8901.018; Wed, 2 Jul 2025
 11:01:02 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Wed, 02 Jul 2025 20:00:39 +0900
Subject: [PATCH v3 2/7] gpu: nova-core: Clarify sysmembar operations
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250702-nova-docs-v3-2-f362260813e2@nvidia.com>
References: <20250702-nova-docs-v3-0-f362260813e2@nvidia.com>
In-Reply-To: <20250702-nova-docs-v3-0-f362260813e2@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, Joel Fernandes <joelagnelf@nvidia.com>, 
 Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TYWPR01CA0035.jpnprd01.prod.outlook.com
 (2603:1096:400:aa::22) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CYYPR12MB8892:EE_
X-MS-Office365-Filtering-Correlation-Id: cadbf011-e5be-4483-0d57-08ddb957bc40
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|7416014|376014|10070799003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OW1obkpmeDhlQWYxM2VXOVRNRmh4MWJFMmJGTk1kWCtzMUozbnVwcVM0MURi?=
 =?utf-8?B?ZFNSZmxQRzNqQzltVlR1OVAwaEI4NzZqUlF2SmQycFVTVnBkbzdadU5QRHln?=
 =?utf-8?B?S2dhZ2lpRXBCNDh3Z1hZNEx3eDhEc3huRzVnSmRBbHlZTWh1SDljTk9pdUVO?=
 =?utf-8?B?bklOaThPWFhnZ2tlNitQTUNOa010UXpac1ppN1JzRW14V1QyaU5MZUY2ZUVL?=
 =?utf-8?B?ZWlhR2dSelJtaHVMejZHd3JrNzRKdmZOaHBtMFllaHhTT0gwRTBnZ3AyQ0JS?=
 =?utf-8?B?S0tMbitJRlp6ZU5GRFByb3AxbXhob1dqRldZVlVhWjI4TDNIK1RYVy90ODFW?=
 =?utf-8?B?dGh4MmlCNnRoOWJGRUpUZTM5czNkMGZ5am94ekpGS1BhZlByVFZGeDZlNWl3?=
 =?utf-8?B?WnRtZmIzaFRhL3paeEI2ZXVGNldVakxTcUVXdU5YREJsSy9zZUsvTGwzY0hG?=
 =?utf-8?B?cTlDSmlBekJndFJ2UXlsb1FidWlkcjhqN3dCay9rbE5HR0pNalh6NEREdmVo?=
 =?utf-8?B?c1Z6ZHpoeGVUcHpuRDVtbTlPdmgwVllLZGpsd1BGNDRPQ0xHUENBS3FkV2o2?=
 =?utf-8?B?ckxvTEZvWFdtVERvRzNhemRFUW53V09Mc1oxWjlEOGxPREkzWkdRNUZ6Zm1C?=
 =?utf-8?B?NXdDWmhJRCt3bHd6Q1ZwdzhHQ0FsREVIKzV1MWNjR1BST1dHRmpCKytUNEJF?=
 =?utf-8?B?S2ZnQUhrT0FWM3ZNMGM5OXNLaXN5d3pydjk0Y1hEQkwyczIrbEtuMjNtcXRS?=
 =?utf-8?B?a255YjFvajdRcC9jcnlVRlNmbEVtQTdCMGlVVkJ3d3d5bkhWL0FQWEVxSGtP?=
 =?utf-8?B?ZFlXbDdaNVF2MTRjNC80MWo0TS82dWVXZUNESEU0aGF5am13Zk5lclEyZUpK?=
 =?utf-8?B?aGtIVWRubUhZZ0VJcXVZK0R3bTl6cGFuVXlpcXBXZnU3Z1R0LzRGWmJhY0o1?=
 =?utf-8?B?eStmcUJpWUp3YUM4M2wxSjlUdFhZb1dYR21RWnN0a2FRblJEenIxRU1BZW1M?=
 =?utf-8?B?akVZVXZHMGlhWGtPRVR5cldhZ0pJWkY1SHZQVS9NU2tpZVZ0TUhHWDVncjZa?=
 =?utf-8?B?aXFNQ0IxUiswcDhIcUFOMHNWYnh5TGxxbXI2dElOd25UR0Q1djlPeUF4L3FX?=
 =?utf-8?B?VVlqUEswNENJVVNOa21OTHFieTdnV1NTWFBIamxiZGtnQnliSlpWT3JOcEQx?=
 =?utf-8?B?bnJjRk51SzhIVDQzZk9kZFVNTTFGbWxkc0cydVVNY0J4WU9Nc21WNG9JbEo3?=
 =?utf-8?B?dWlTZ1JJemx1M3BMV2F3cDgvelFOSUloK2ZoYVR4Y2JOZUxpZ1BNajFBRC9m?=
 =?utf-8?B?c1pvVFp4blc2Mk1EdmNCOG4zb0M2VGxiamZWeTJ5WVRWZ1U4VTBlOEo0TmhD?=
 =?utf-8?B?QWw0QVBZOFdkdnNHc2FZRWlqbzVjWTRsZjlnWTVYNWVjbXVnRWpLWCt5eTRT?=
 =?utf-8?B?RS9YZ1VUL1ZORDM5eVVoTUVmdi9PWXFZdnlWNUk3U0hLRzVNVUJsd0hERVhp?=
 =?utf-8?B?VzRiOFJ1T3JtRlFoQldCMklTNW1na0JMeUV0M2dUL1A0cy9GTjhUTm1ocDVK?=
 =?utf-8?B?ZE1KWm1OaVlWSFBHSWduZGNPSWFsUXlsVlFPSC9vK242ZWFxZmpXZmQ4cUMr?=
 =?utf-8?B?TkVROGVreXV0RDFTKy82d0dId0syQXJyeEtVeG1WUEl6dER1UFFsRjZ2RGRs?=
 =?utf-8?B?THlkZXdZVmJFcVhBZFVKMGFNWFpNZURsekpCNTVpQTJTNjh5QnhXU3BvVGNq?=
 =?utf-8?B?YVRlc3NVTDRmYkZCa3cwMzF5RC8vSzhCSUxiY1k3ZEFuamZReEdmdVdjMDd0?=
 =?utf-8?B?cklGNERhVndURGd2ZnNRM2QzWkg1TjFZOGtMNnhnWnNIanNpQUJsTnBIMnFm?=
 =?utf-8?B?NW5BREN3cXpJMkpIS3l5UlZ6bnNtc2RQdUNiWS9XbXplNVVBOW5uSGoxZlkx?=
 =?utf-8?Q?qHYpRfzcQp0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014)(10070799003); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V0lUWnc2SUZOREVjNWRNMUdBOWgxUllEK1FURDhkQkI0b2cvdEtIaDl5NktV?=
 =?utf-8?B?b3A4aFJ0SUNUenR0QTlick5pOGVKY2tsOHBXcXppc1RNQmFJL0E2MXptUE5i?=
 =?utf-8?B?RGRXMU5TTm1BbVZiODRURFdrbHJDemtqK1BBbDhiVlJYNkhDeXJibjU4VTdN?=
 =?utf-8?B?T1lBRlVvdHRsamVlR1Y4VVhralA1c2dlL1kxaVk0d1FXc04wMHJvbjdyQkdz?=
 =?utf-8?B?R2VNKzMrY2padFdaeFdZRzNNTVBMaTAxa29oZUtJV1E1V2F2NXBFK0FOSnRL?=
 =?utf-8?B?UlA4VmJqblo5NTdoUEg3VlFaaXU0M3pDRE1ZZlV4NXpSR2QvYjMvZlRLdEhS?=
 =?utf-8?B?UzV6bTdMbHpSdDdaaUoxZStNaWVHNzNVNVRkUjNnUFV6RnZoNm5jSmpGWmlG?=
 =?utf-8?B?b2VIMlZGeERwWE0yaWRpMHkvNnhIcmFZaHQ0VXpqbWo0b2pQOXpuWGI0SEVI?=
 =?utf-8?B?QlBQZzFjRkNlOGY1cWRZbnVnWTFud25hN3dWYVNvUEw0MkVTNVBJRTlVMk9S?=
 =?utf-8?B?L3VwSFVyRlBRZEZ0UUFzRlhFTUxDbm9TZzZkNUYvQ210WTlSRlAxRUJPTFQw?=
 =?utf-8?B?dWJ0MzRLcWsrWjRUSUdBcjYrLzcrdVNLcDFVV0dweERyWkhwQU9SME9tN1o1?=
 =?utf-8?B?YlNma1NlQndvMkI2L2tSY0VMZVpLZXZtcWJCS2RZMFQzQWRZQ1FaSVJOb1BZ?=
 =?utf-8?B?VmpxRWZabWE4RUhxYXhVcTFzQVBPUHEzcTFZSjRRK3VvV0c1Mkw1Tk5zYlcv?=
 =?utf-8?B?OTNENlNhNFYyUm5wNHZlTDNDT0hEZHJiZzBsTVk3TFBaRmpQVkc2ZW1Gbmt3?=
 =?utf-8?B?VHIwQUJtbkpxMkQ3QnVXYllGSzZRTCtsaXJLTGtZY29jV0ZHc09PbXFQS1hL?=
 =?utf-8?B?TlRUUU5YUWlKSVdzRm91TjNLaUxaMFNuUXJsSnlGemRYeGZrb1E2VXdsZ1JH?=
 =?utf-8?B?WlJhKzlYdkN3Um16djlQNzM3YU50WUpzMitmditDamFJV05BcHBieUZESGZx?=
 =?utf-8?B?UDROdVpndUl2UytHMTNnNVZudTdZSzhnbkRDelFuamtZTXV5amxVZTV0YXYx?=
 =?utf-8?B?TEFGdG53RGNyMXRGb242dkV4bW9TdmIxMDdCNTRXMG1mTFBsVDNpZVNVSlJR?=
 =?utf-8?B?bkZrOG9OOUU5OTBtNnArMHZTVXBIeVhKRG9XazlmOEF4YmhKYUxnTVIyY01n?=
 =?utf-8?B?WStXWmdQSHlsd2Q4aFpkelZaSDJRYTNkRURyNzlDWENHdVY3d3k5Z0ZwVFVu?=
 =?utf-8?B?VlpwSGIxNkhJNGVTVXR5WnkrdHlWL096S3dqVFJiMVZlaEJ2OWVXUHRpbDI4?=
 =?utf-8?B?YW5wTXhlS3MrbzhJNmN4OHVaSHVwWnJlakkxNnA4a2UyaDlHMzhlWmhXcGRI?=
 =?utf-8?B?eXdrODlVUkZ2V0pEK0FNNDVTcnJGbXVjZFZFSjhHQ3dmWW1WM2R1RWdHellR?=
 =?utf-8?B?bCtsQ0NTakx5alJVQ0pSZHRNdzloRVZtZ3ltVEVVbVNBWmQwU292eUp2Wldi?=
 =?utf-8?B?bjE1S0RaaURMMW95RUhWUWM5T0NGZkNLamNBZko3Umx5V3orL05SYlNwZnJk?=
 =?utf-8?B?NHpVSmFzSVJWWklzRWlOTW1UL1UzZmVaVGRqT0ZMbzgzYzdlNnRSNUluRytw?=
 =?utf-8?B?cjlpem8zemt2RnFkd1FudFFWMmFJdDMwNTUrdDFQZnN5dE5kekkzK1VIS2tn?=
 =?utf-8?B?MmFRZnR0NGdDUHRwS1RBb05wTjkxN2Y3RkZMVUdrdHJCZjBPaFY1KzBYaUti?=
 =?utf-8?B?cXlYbDg2Sk5sdDZIRnY4SCtBbTRyaXhaL3dkTWk5SkMyQkxXU01YaFlybVQ1?=
 =?utf-8?B?OUppVVphV0hwaTl0UnJRa2UwYnNmTEdLRGY3eVB0M29EYTBYTFMrZFdqMG8y?=
 =?utf-8?B?Nmt4TmY3Smp2cU1DTmhRSDlqcHcyUmNJTzRYSDFyT2xCcXlRWE5SRzhyVjZu?=
 =?utf-8?B?VDNsSzFxNkdYT0tYcnV5bllGZ2ZOby9za1k1bDBwYzhCUVR5VlZhUHRwSjlD?=
 =?utf-8?B?RGZLMUszOHczUzBzNFBSUk50bzN6OUJ1VVNRTEFpdlRrZ2RBMWxkYlltM1Vv?=
 =?utf-8?B?Y0hOeVgyd0xSZXJUR3YrOTNpcTM5TlhqS0puL2hyc2lrWElnZUZFcXRtVE04?=
 =?utf-8?B?b1NDQjQ4dnRjbTZwS21Vck9CaGFNeklxVzIvQjEzQ2phcWxWT2pqd1hjRXRC?=
 =?utf-8?Q?pNIOPxHy3vTD1c29+/pLE+syB8fa5HNi+wKlbJqFnB9J?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cadbf011-e5be-4483-0d57-08ddb957bc40
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2025 11:01:02.9305 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bmPgbaU04DCy1sJoHtRA4X6eqluEl33KQWwZ4/s0HMidoNb/SFPtKmftKbngomUtww1wtct6lV1AUlkvfnNYSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8892
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

From: Joel Fernandes <joelagnelf@nvidia.com>

sysmembar is a critical operation that the GSP falcon needs to perform
in the reset sequence. Add some code comments to clarify.

[acourbot@nvdidia.com: move relevant documentation to SysmemFlush type]

Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/fb.rs   | 10 ++++++++++
 drivers/gpu/nova-core/gpu.rs  |  3 +--
 drivers/gpu/nova-core/regs.rs |  2 ++
 3 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/nova-core/fb.rs b/drivers/gpu/nova-core/fb.rs
index 172b4a12ba2afc05860cc004fd1f0154402f467a..02c44c79cef500462bab10ea18678749f72404ee 100644
--- a/drivers/gpu/nova-core/fb.rs
+++ b/drivers/gpu/nova-core/fb.rs
@@ -17,6 +17,16 @@
 /// Type holding the sysmem flush memory page, a page of memory to be written into the
 /// `NV_PFB_NISO_FLUSH_SYSMEM_ADDR*` registers and used to maintain memory coherency.
 ///
+/// A system memory page is required for `sysmembar`, which is a GPU-initiated hardware
+/// memory-barrier operation that flushes all pending GPU-side memory writes that were done through
+/// PCIE to system memory. It is required for falcons to be reset as the reset operation involves a
+/// reset handshake. When the falcon acknowledges a reset, it writes into system memory. To ensure
+/// this write is visible to the host and prevent driver timeouts, the falcon must perform a
+/// sysmembar operation to flush its writes.
+///
+/// Because of this, the sysmem flush memory page must be registered as early as possible during
+/// driver initialization, and before any falcon is reset.
+//
 /// Users are responsible for manually calling [`Self::unregister`] before dropping this object,
 /// otherwise the GPU might still use it even after it has been freed.
 pub(crate) struct SysmemFlush {
diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 8e32af16b669ca773e63e184d34c3e0427bc9b76..72d40b0124f0c1a2a381484172c289af523511df 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -170,7 +170,7 @@ pub(crate) struct Gpu {
     bar: Devres<Bar0>,
     fw: Firmware,
     /// System memory page required for flushing all pending GPU-side memory writes done through
-    /// PCIE into system memory.
+    /// PCIE into system memory, via sysmembar (A GPU-initiated HW memory-barrier operation).
     sysmem_flush: SysmemFlush,
 }
 
@@ -283,7 +283,6 @@ pub(crate) fn new(
         gfw::wait_gfw_boot_completion(bar)
             .inspect_err(|_| dev_err!(pdev.as_ref(), "GFW boot did not complete"))?;
 
-        // System memory page required for sysmembar to properly flush into system memory.
         let sysmem_flush = SysmemFlush::register(pdev.as_ref(), bar, spec.chipset)?;
 
         let gsp_falcon = Falcon::<Gsp>::new(
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index ce08fab8fa96fcacf6947512ebdf4975ebd8772c..e94c1d2190f352e9316937dd3165cc2a390e0ed2 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -51,6 +51,8 @@ pub(crate) fn chipset(self) -> Result<Chipset> {
 
 /* PFB */
 
+// These two registers together hold the physical system memory address that is used by the GPU for
+// perform sysmembar operation (see [`crate::fb::SysmemFlush`]).
 register!(NV_PFB_NISO_FLUSH_SYSMEM_ADDR @ 0x00100c10 {
     31:0    adr_39_08 as u32;
 });

-- 
2.50.0

