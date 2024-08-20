Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DEC23957B15
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2024 03:42:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46D2210E34F;
	Tue, 20 Aug 2024 01:42:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="LEbvYZhs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on2073.outbound.protection.outlook.com [40.107.255.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4B3710E34F
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2024 01:42:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LCdjcbeEh7zJzzF63S7yjyuzo9dCJut+Khj5C/T9dZD5QWmfD1eqNI1K3H/Ff+s3U60QW1AW2qfnLEvi+YEFSfFIm9YtLa91D654Sz7ctw1ZxBqgd6gO5KW7m5EbucZqO/WCcoQbqxDKo22aUTnuJpp/apMocU3q1GDIAotX3dkuHNGiXloglhAjYUuLDlZSpI2gWz9Tkh+v9UQrI26nkEFGkhjKXe+/JeQ/gKCH02LLKPSVNL10aBuW7o44thggGY+8TVJxvNKQXYUni3FRcSyqDp/FXAbhrGHQhNM6ltOie7dMko0SZ6UBpv00hS/RilVkWTBGyhmhwRNTiyALRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7XeMtCcJVgHvl4gR8oDoT+UiLxsm4geiGyjqyAErrd4=;
 b=ieLFWfZw00v7m+7fC7GVBV82At8AT6N8iO9B7Z70GIuzlcDhcYI3xeSW7RxjU/YyYB9jTa3GjqXSQkZTWUkDGQyJjX3EP1hZ6bRGH/ovd/eTKu6A+qFFcBIST/j2blH3pO6VA76lhUKAhn6xjlQxOQbG3KdDCA6657NBPSRb7FY0wUHltdH2KW8oe7clTIYtTEmspavI3uTAorEJyWOK0gAuS3gz3crm5vRb8JlkGloh4WnnhAUkbyHEYv9JMMN7qfNK3Bv6lg1MSW8HSyelLPB+nOqmcJI5Ru2AzlSwGcdEJXyDjrmE08w0eDqUyYJp6ypfdTJBFkaUNoX59gf0NA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7XeMtCcJVgHvl4gR8oDoT+UiLxsm4geiGyjqyAErrd4=;
 b=LEbvYZhsUgpU3cY6xf5ASMfd6pvHQ5u95BG1+a/AlGYzpm7kRVOreJ96ot548xiU07fC6nwsQR26202iDeaGe59qYIJPh6ZdVHNJDua4RkapElDwOnjgx2D3FwZg5d/zS7ZF0+XYPCFyLG3J7oVPViOJT1XSmP5SodjnVhPnMyEo8CkiC5ldfdPyPpU89pKBi/A5qnQO7ikDGSJ4ezhIKeDk/SAU7yBqiPi2ldgVKHskYV+JEFQ5aOof5xwg16IPN97Ra8ZzmCCjBel70QbfFyyojR//XHaIYy8QOya+17avQRLkAa3m38Fi0qIM2DYI6v3Fb7kw6s4+8LysiOE59g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com (2603:1096:301:f8::10)
 by KL1PR06MB7330.apcprd06.prod.outlook.com (2603:1096:820:146::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Tue, 20 Aug
 2024 01:41:56 +0000
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f]) by PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f%5]) with mapi id 15.20.7875.019; Tue, 20 Aug 2024
 01:41:56 +0000
Message-ID: <0f2e18a9-0a58-43fe-99b2-f5010abf8ce5@vivo.com>
Date: Tue, 20 Aug 2024 09:41:52 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/5] udmabuf: remove udmabuf_folio
To: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: "opensource.kernel@vivo.com" <opensource.kernel@vivo.com>
References: <20240813090518.3252469-1-link@vivo.com>
 <20240813090518.3252469-6-link@vivo.com>
 <IA0PR11MB71858D28621C745C1663B593F8822@IA0PR11MB7185.namprd11.prod.outlook.com>
From: Huan Yang <link@vivo.com>
In-Reply-To: <IA0PR11MB71858D28621C745C1663B593F8822@IA0PR11MB7185.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI1PR02CA0054.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::13) To PUZPR06MB5676.apcprd06.prod.outlook.com
 (2603:1096:301:f8::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PUZPR06MB5676:EE_|KL1PR06MB7330:EE_
X-MS-Office365-Filtering-Correlation-Id: dd720fcf-6cf4-4f3e-b55d-08dcc0b9467a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|52116014|376014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QXJLbUpwR2krTGhnenVlYUM0MXJvSDNGQm52aGdEYzB1cWhBUzU0Y1pKdDJi?=
 =?utf-8?B?a1RWTXhxK3Z3ZmhndkNFOTBYa29rMDFwR0tqY1p1UWtqanVuNGViTDZFNU9F?=
 =?utf-8?B?Q1ZRcUlCTzdUN0pGQTFRQWNGN0k3QWxUeUttbkl0OE9LTG1mdld2ODVnSE53?=
 =?utf-8?B?R3M2eVFpQTVRbVJnMkMzOWRXNTdNOHJQcmY0eFJGN0M5Z3BoUmVzYjJHdmpP?=
 =?utf-8?B?SGplb1dXZHk3RVYzVTFjNERIcU5iTXR4YnpTNlVOdFJnbFFmZmVUeVVNcVVX?=
 =?utf-8?B?cUNWS1VFR245S0RsbjhJRi9HRVpCbkNSN0tVTEs5TjI4Y0tkMzFBR0ErTWJW?=
 =?utf-8?B?bzNOV09PdVF4YllKazdSdVF4VSsvck5HKytJNDVCcTdiYTJVRCtNRWRZVlI2?=
 =?utf-8?B?aFVuQTBRZEhEdXdBQlNMdEwvaGtRT3NMVFNMZEMwMmFOWVZTMWFlRi9sYndU?=
 =?utf-8?B?MWZVekI1enFXT2wwbzhWSU1MeTg3VmZoVlZoNjdoVzM4RWttN3lOWlNPdU9P?=
 =?utf-8?B?eGs4b1FyaDN0Sk04RWx6dWRqd1ZTWGl3WUJzRDh3RHdDNVQrK3hYWXZyOGln?=
 =?utf-8?B?ZlF6Mm9BQzJ4M2FJSlo2WWJwQmUvMzJEaEFQNG8zOXFIangwb1pvTFlrVnp5?=
 =?utf-8?B?ZEYzcjQ3eis2YUJXNWtGeE5iYVpXWTJRWENGd0Q2Y2xoTmIyYnJyY0VMNVZT?=
 =?utf-8?B?TlhzaW53T3NRTTJtKzNZYlZOZU9nV3pXQ283dEZaV1loeHVTYmlTTU9Yay9S?=
 =?utf-8?B?a0UrWjliVENDbWJtaGVnNGU0WmV0MFA2ODlOamVKNkRabnRGU0MxOGNUM2VX?=
 =?utf-8?B?ZzU1SjA4R0FkOHNiTHNyeVpEdFZUOGo5SlEvUGN4cXlld3VmK3dKbTNLcHl6?=
 =?utf-8?B?UkRiRU5iZlEzK3BXdmRqRVhQRDgzbnFTMDVBYjM1MXMwcGVIVkNYLzI5V3Fz?=
 =?utf-8?B?SVlpRGFvdEFXd1c0UWE5eUVJREQ2TnZ1UFRQTlBBMXJzWlNSRzVxSFZzeVFZ?=
 =?utf-8?B?VDduYXQvY1p6U1RpUmNROXJjeVViZ25SVEFPVVJCWVNHclNnTSsyTmgxRUxC?=
 =?utf-8?B?WTUwTmM0S1dSb1VOQVc2cjU0UExrM1NZblVxKzN0WkMzWHhnTURDaEdmWmIv?=
 =?utf-8?B?VG1rWi9xMklRbG9mdnV2Uy9HQ2l5NElocFBUWDBtaFBGQitCRTlpMXdZdUhq?=
 =?utf-8?B?Um8zblM0dTlmT0NYTGY2MU5NMGRSbVR6ZndUejhyckJpK0lTREszZHIvTjNy?=
 =?utf-8?B?RERKekFoSWN3anNER2pEYzZlVXV2NS9jT0dsWDVLbG9sY1QzbEZaYVpmOUYr?=
 =?utf-8?B?QXdjV3BybGd6YURjNWUybWNXbUpDclJEWXZkV05JZktaVS9ISDBnSU9BcW1V?=
 =?utf-8?B?YjUzVUlVV3pJc21aMEFlKzU0Wld4NGdnektnd1lsUG0zKzB3QmFTYWJTSnNw?=
 =?utf-8?B?T2I5LzBnbjN0dVBLU0FmL0FiQ0pNVnBtZjlxaVB4M29tWVVYNmZYVzE0TXhh?=
 =?utf-8?B?S1JiRUZWbzVkYzB2LzhQOTJ3ZnhnVUhFNkZ6WEsyczJuOUo1MENidG5jMGZV?=
 =?utf-8?B?K0Jram12eXBlNXI3OEdoRk1zOGVQcFE4TEdFQzhuUDdwZjl4LzVDb1VXZC91?=
 =?utf-8?B?THNaOXNZR1pFckFQWWRxY0gzbTJwWHFWSU9GMXplUWFERUUzSGNOck52SHdB?=
 =?utf-8?B?WlNnZW5tOVlBMjJPZzlIZEtBNUNTcy93ODhHWEpwMWNCV0xKVEN4VG9aelJ2?=
 =?utf-8?B?YlV3WkNsRVNCK0t3UlZIeTNqeEZla1FTK1NzR2IwOVNJb0ZtOGRyVXh6YkRo?=
 =?utf-8?B?WVNPbHhYL0ExVnQwY1padjA5T2QrL3NZMlFWYWxWQnlkZnVMdW1uTllrakh0?=
 =?utf-8?B?QWhjV3lkeEVmd0ZjMkxxNVJkaDM2YW92YzBqREVnTTNEc2c9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PUZPR06MB5676.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MFZQcHVxczhzWDNvSjVqZDhwdGxtN2hJbTFsVm8vNkdUdGo1a1RnY1JZZnQz?=
 =?utf-8?B?MGxFQ2dXYXJpa0tmcGlTSUtxNkxaZm80L1QxbHhGK3ZOUkxDMituZ1RRaUFI?=
 =?utf-8?B?U1JLd0RkaDJOdkV1OUJQRGZjZXhhR1h0eDUvZnBHdWhaYWIra3Y5RnJoYmJE?=
 =?utf-8?B?RTlTRVlmVGpwdU90bk16UjNwR3lpM1pkcTFnYkx0Q2NTTkhIWVJyZjBPeE9K?=
 =?utf-8?B?eVhIR3FhV2c3SDcyajVVM1B5RU5zcndmUjNlRWgrOVRXTGdSWllmLzJoTy9v?=
 =?utf-8?B?UDlDNmdBRFg0UUppRjIvaFJydnJYMDVmZ3VsNnk4bnRvUENyZ2hRV2xtNWtS?=
 =?utf-8?B?TkcvNTBTeGo2UzkvNHlvek5wMDNsa2ltTWNMd0EvTlBSd3habVRJVDJpbEQz?=
 =?utf-8?B?cXUvMW5uaDZRS1NlQXdwUmdkSVBSNUIzRFNCSk1NTEM1TlVSeVowdUhOTVAz?=
 =?utf-8?B?YVdOOWVYcC9sY0t4Qk5DR3NsR2VDcWsxeEgrZDNEYXZHVzZHN1FweER1c0du?=
 =?utf-8?B?V2RrcTJwVU8waFNva2NqNk5TOS9NUHVJa09XT3NKRkFYMzN4ZjNneHU4Qndz?=
 =?utf-8?B?eWdvUWYzSXpTWXZMSDNsMGJtY1prdzJJZnJ3b1FqcHdyREplU2UzYjNNVW4w?=
 =?utf-8?B?RVZYcUlqMlN6d2w2S0ZjS2pSUUJzVkxGYlEzcEtKZlZKTkZxb2RwY2JxNmxN?=
 =?utf-8?B?T1QzU1kwN2pScmZLMkc2dVpOb3RDYnhSRVVEbUZ5cnNSNHFROE03bUk5c2Vn?=
 =?utf-8?B?YVA4Y08yK0IvTDFkN3YvUzdvTUtUTXZQR2V5Q2l2c1JuSThhb2h4WWpLT01s?=
 =?utf-8?B?M0IyNWdQbVdEMFBuSHo0N05MNmtVOUdkU1JTaWVZajJkdDd6UHAyVlg5cVRl?=
 =?utf-8?B?Z2lCWHRMR1hEQVNyUEVuWldzNGY5bFRQY3JzZ0VkbjJKeTdFcEFiMzlHelpJ?=
 =?utf-8?B?aVo4K0hSbFQwVi9JekwybFV6RkNIV0ord0hCc3hMK0ppbVVuYWprOTZBQzRh?=
 =?utf-8?B?aWswdS9RSHVJZXQ0K0xVc3ZuOXorb1NHWitISE14NzA3MjgzQlB6ZXZrT1NU?=
 =?utf-8?B?QlNHeHZ6TFNFR1gzNVFWUnZJQ3lQWjdKeUVyTS9wVEF4eDcrU0x1RjNMTnpn?=
 =?utf-8?B?cTkxWjFCaFgvMy9mZE96WFJ4TGlDc1NZWnRpL2pjcjhBTzh3T0dQUXZ6TWx3?=
 =?utf-8?B?ZEhXR2kwL2pIbWV6RTV5ZXdyUER0Sm4rRm5EUnhOUnhqNGI0cTM5TWcyZExa?=
 =?utf-8?B?eW5kZEJSNk5JbHJIYk8yQWlWVjlYME9oaEp1YVhWSUp5MXBBNHJYY2J3MDBY?=
 =?utf-8?B?TWNLNXVkQXFrZGNUanR5ZEFNRE5uc0UxZUhhWWdNTW04Z01SVExhRTgvTm1Z?=
 =?utf-8?B?NlFmVHJPbmdocUtwSENwN3FINXJFdzczVkhiY3V6ckxwSWpwaUI1TThtSVZt?=
 =?utf-8?B?Z2hCMGZDS2d1YUQzSy8zeUF6bWNVR2Nmd3RTckxKZlBWL3lZcGd4M0RDamNZ?=
 =?utf-8?B?bzVXR2VDUzFYTWdjYllhV1RSanNLVklPUDF3NTJOa3llT0pUaEIwLy9Tajht?=
 =?utf-8?B?SU14c1F6eWxENGIwVjArRkU2R2hhY1h3ZEd2L200WE5GNExGN1dMUk1ZNkkz?=
 =?utf-8?B?ZHRGTExrdmczVkNOT0J5OGtESUF4V251S0FTeUdFbCtDR0k5ZVZjcU9UQzhu?=
 =?utf-8?B?UEpuQUprKzB6QXU5QWEyS3lBSVVJMGEvNlZyVytheEZzUW02TmRxeXdxaHBM?=
 =?utf-8?B?NGRzVmtPbGpOWHEzbExsQnkzZXg4ODFNVmowU3Y5clF6bjhTaW0rNDNOVmYr?=
 =?utf-8?B?akpTQWV6bldlS3dsUjFoamxuVkRwcVpPeFdTZXFGaHpIUTVQbGVINEw4MFBC?=
 =?utf-8?B?blltUThOZmVhcnlVMkhkVUVtSGtlU0hMYTQ0WTN3UFlNTUF4VXRvcE1maXRk?=
 =?utf-8?B?TDJEWmVHYUpGTHVOQVZtZGc2djIrbzRnTHM5eUVFdWpnUURZWTlBU3hKT3N3?=
 =?utf-8?B?TWs4ODkwSWtaTTV3YUxPTlRiRm55NStscVh0VEkzTmF4cUlMUXRPSElzQm1B?=
 =?utf-8?B?NkVsQ0Qzb2F5OWhsc1BqSmhibzliajZBWC9MUEwwR2hxeWRUVC9wSWg1Rlk1?=
 =?utf-8?Q?U99H15m5TqpIeWvufDSjLADc2?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd720fcf-6cf4-4f3e-b55d-08dcc0b9467a
X-MS-Exchange-CrossTenant-AuthSource: PUZPR06MB5676.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2024 01:41:56.5545 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fL2SjT6ouXPLkhQFIjmxz/IfzKr3IlJFcl7UWYWtuU3U9mYuWy0A9eB9MOTOmv3Bg1LN6CXN7Wf3viMq12JL8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR06MB7330
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


在 2024/8/17 9:05, Kasireddy, Vivek 写道:
> Hi Huan,
>
>> Currently, udmabuf handles folio by creating an unpin list to record
>> each folio obtained from the list and unpinning them when released. To
>> maintain this approach, many data structures have been established.
>>
>> However, maintaining this type of data structure requires a significant
>> amount of memory and traversing the list is a substantial overhead,
>> which is not friendly to the CPU cache.
>>
>> Considering that during creation, we arranged the folio array in the
>> order of pin and set the offset according to pgcnt.
>>
>> We actually don't need to use unpin_list to unpin during release.
>> Instead, we can iterate through the folios array during release and
>> unpin any folio that is different from the ones previously accessed.
> No, that won't work because iterating the folios array doesn't tell you
> anything about how many times a folio was pinned (via memfd_pin_folios()),
> as a folio could be part of multiple ranges.
>
> For example, if userspace provides ranges 64..128 and 256..512 (assuming
> these are 4k sized subpage offsets and we have a 2MB hugetlb folio), then
> the same folio would cover both ranges and there would be 2 entries for
> this folio in unpin_list. But, with your logic, we'd be erroneously unpinning
> it only once.
:(, too complex. I got a misunderstand, thank you.
>
> Not sure if there are any great solutions available to address this situation,
> but one option I can think of is to convert unpin_list to unpin array (dynamically
> resized with krealloc?) and track its length separately. Or, as suggested earlier,

Maybe just a folio array(size pagecount) set each folio like unpin list?

even if waste some memory, but access will fast than list. (and low than 
unpin_list)

> another way is to not use unpin_list for memfds backed by shmem, but I suspect
> this may not work if THP is enabled.
>
> Thanks,
> Vivek
>
>> By this, not only saves the overhead of the udmabuf_folio data structure
>> but also makes array access more cache-friendly.
>>
>> Signed-off-by: Huan Yang <link@vivo.com>
>> ---
>>   drivers/dma-buf/udmabuf.c | 68 +++++++++++++++++----------------------
>>   1 file changed, 30 insertions(+), 38 deletions(-)
>>
>> diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
>> index 8f9cb0e2e71a..1e7f46c33d1a 100644
>> --- a/drivers/dma-buf/udmabuf.c
>> +++ b/drivers/dma-buf/udmabuf.c
>> @@ -26,16 +26,19 @@ MODULE_PARM_DESC(size_limit_mb, "Max size of a
>> dmabuf, in megabytes. Default is
>>
>>   struct udmabuf {
>>   	pgoff_t pagecount;
>> -	struct folio **folios;
>>   	struct sg_table *sg;
>>   	struct miscdevice *device;
>> +	struct folio **folios;
>> +	/**
>> +	 * offset in folios array's folio, byte unit.
>> +	 * udmabuf can use either shmem or hugetlb pages, an array based
>> on
>> +	 * pages may not be suitable.
>> +	 * Especially when HVO is enabled, the tail page will be released,
>> +	 * so our reference to the page will no longer be correct.
>> +	 * Hence, it's necessary to record the offset in order to reference
>> +	 * the correct PFN within the folio.
>> +	 */
>>   	pgoff_t *offsets;
>> -	struct list_head unpin_list;
>> -};
>> -
>> -struct udmabuf_folio {
>> -	struct folio *folio;
>> -	struct list_head list;
>>   };
>>
>>   static int mmap_udmabuf(struct dma_buf *buf, struct vm_area_struct
>> *vma)
>> @@ -160,32 +163,28 @@ static void unmap_udmabuf(struct
>> dma_buf_attachment *at,
>>   	return put_sg_table(at->dev, sg, direction);
>>   }
>>
>> -static void unpin_all_folios(struct list_head *unpin_list)
>> +/**
>> + * unpin_all_folios:		unpin each folio we pinned in create
>> + * The udmabuf set all folio in folios and pinned it, but for large folio,
>> + * We may have only used a small portion of the physical in the folio.
>> + * we will repeatedly, sequentially set the folio into the array to ensure
>> + * that the offset can index the correct folio at the corresponding index.
>> + * Hence, we only need to unpin the first iterred folio.
>> + */
>> +static void unpin_all_folios(struct udmabuf *ubuf)
>>   {
>> -	struct udmabuf_folio *ubuf_folio;
>> -
>> -	while (!list_empty(unpin_list)) {
>> -		ubuf_folio = list_first_entry(unpin_list,
>> -					      struct udmabuf_folio, list);
>> -		unpin_folio(ubuf_folio->folio);
>> -
>> -		list_del(&ubuf_folio->list);
>> -		kfree(ubuf_folio);
>> -	}
>> -}
>> +	pgoff_t pg;
>> +	struct folio *last = NULL;
>>
>> -static int add_to_unpin_list(struct list_head *unpin_list,
>> -			     struct folio *folio)
>> -{
>> -	struct udmabuf_folio *ubuf_folio;
>> +	for (pg = 0; pg < ubuf->pagecount; pg++) {
>> +		struct folio *tmp = ubuf->folios[pg];
>>
>> -	ubuf_folio = kzalloc(sizeof(*ubuf_folio), GFP_KERNEL);
>> -	if (!ubuf_folio)
>> -		return -ENOMEM;
>> +		if (tmp == last)
>> +			continue;
>>
>> -	ubuf_folio->folio = folio;
>> -	list_add_tail(&ubuf_folio->list, unpin_list);
>> -	return 0;
>> +		last = tmp;
>> +		unpin_folio(tmp);
>> +	}
>>   }
>>
>>   static void release_udmabuf(struct dma_buf *buf)
>> @@ -196,7 +195,7 @@ static void release_udmabuf(struct dma_buf *buf)
>>   	if (ubuf->sg)
>>   		put_sg_table(dev, ubuf->sg, DMA_BIDIRECTIONAL);
>>
>> -	unpin_all_folios(&ubuf->unpin_list);
>> +	unpin_all_folios(ubuf);
>>   	kvfree(ubuf->offsets);
>>   	kvfree(ubuf->folios);
>>   	kfree(ubuf);
>> @@ -308,7 +307,6 @@ static long udmabuf_create(struct miscdevice
>> *device,
>>   	if (!ubuf)
>>   		return -ENOMEM;
>>
>> -	INIT_LIST_HEAD(&ubuf->unpin_list);
>>   	pglimit = (size_limit_mb * 1024 * 1024) >> PAGE_SHIFT;
>>   	for (i = 0; i < head->count; i++) {
>>   		if (!IS_ALIGNED(list[i].offset, PAGE_SIZE))
>> @@ -366,12 +364,6 @@ static long udmabuf_create(struct miscdevice
>> *device,
>>   			u32 k;
>>   			long fsize = folio_size(folios[j]);
>>
>> -			ret = add_to_unpin_list(&ubuf->unpin_list, folios[j]);
>> -			if (ret < 0) {
>> -				kfree(folios);
>> -				goto err;
>> -			}
>> -
>>   			for (k = pgoff; k < fsize; k += PAGE_SIZE) {
>>   				ubuf->folios[pgbuf] = folios[j];
>>   				ubuf->offsets[pgbuf] = k;
>> @@ -399,7 +391,7 @@ static long udmabuf_create(struct miscdevice
>> *device,
>>   err:
>>   	if (memfd)
>>   		fput(memfd);
>> -	unpin_all_folios(&ubuf->unpin_list);
>> +	unpin_all_folios(ubuf);
>>   	kvfree(ubuf->offsets);
>>   	kvfree(ubuf->folios);
>>   	kfree(ubuf);
>> --
>> 2.45.2
