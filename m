Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20609B52F26
	for <lists+dri-devel@lfdr.de>; Thu, 11 Sep 2025 13:04:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 753B110EA79;
	Thu, 11 Sep 2025 11:04:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Utx4b5+g";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2049.outbound.protection.outlook.com [40.107.95.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A235E10EA79;
 Thu, 11 Sep 2025 11:04:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZKcQdl1rwDXb3uBOoeaeYbYYXXG3oU1jCJXZEBLHAGGuJH8J+WnTYmhJ5mAKgCCkvLD0xQ1HkCzQRKfN19a/j+rm5pxtIOnm97n6F2rKeCRVM4qEHNBYQQMn7wJpMw9Xf3k5ow0cI6mE0rMz1/hmau6iLXjxqBscn9/zFR5tqVsJA65XSAGx31QpQwtE3uUdxHPGz24nKudkKQsAeWK0WJgSpizIPETobUFkES0LOK0eiM/cjx4ULk0uP40TM3f4y8w4mZLPqlTHc7g/LR7ksK4/QlGPJ28bb0sia24NiRVYR+1Ag5hb+vIGN37fvP32DUiD/5vAecnWVvfOkslPsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tqLOQstfLiV9uqiMhBWn5MO5LrPhlQKCmvRODeTzb30=;
 b=L8pvGdOC1dyRmHD2yPoy/RSVyp7KkcZHByUykxUm2YI9Jr69qL139U14Gv7GCNCEaqj9hwsFIO8QtnZkvXXiHeiM+9eqgPWDnoS81vi07M38UQ2V5tq4jhPgp5tl1wBlMwLTCKnb7b3qwhztUc0rGjeb8x0eiyc5zjERT6HE5sgxKeO5Wugkv6d6Hrc2AuxLalbcITStBbrVqfaQeZdeSeYZcyS1aCAlVuoUo+ZuqV8EFJ1ipS+CrHLdI2fV/T+Yujmv4Wwz/X1M9xkVE1E2ETAnw177rD/w23g9bYnx/+j1rWVxe8xsw2nD/cik2M6YNmGYjy8bOi8YfAKCc/lDHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tqLOQstfLiV9uqiMhBWn5MO5LrPhlQKCmvRODeTzb30=;
 b=Utx4b5+g+bJshsI/hXJhuUCOyS1IBAieCF3K6G//p9NVXkzYRMl0xhkC7P2/AOsvbNRkIqpYxcTBzHqoB7GN1HbrD6BnK0PgWpH5twbNuWD81oyIy6+2p+pdFhjmc/r0BljHdRGNhPQvkfx60TARDMvq0emHb1USLye1Tek8RYtaDkbuXZxZ4sPYK3ix54OYj3mAXCoB7ttPrwXPIq285ndVDVEFMdEFzOz39iHLqjKwMVrGQS4HawIplq488hUJrFc+mYmaOOZ4iTgjsq35x12IuP/jWxOLq8isterpAw8J0OikBcy6RBh6W1C7c/D+erkF+q/5fjlti5eMIN7g1w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CH8PR12MB9840.namprd12.prod.outlook.com (2603:10b6:610:271::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Thu, 11 Sep
 2025 11:04:46 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9094.021; Thu, 11 Sep 2025
 11:04:46 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Thu, 11 Sep 2025 20:04:29 +0900
Subject: [PATCH v5 04/12] gpu: nova-core: add Chipset::name() method
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250911-nova_firmware-v5-4-5a8a33bddca1@nvidia.com>
References: <20250911-nova_firmware-v5-0-5a8a33bddca1@nvidia.com>
In-Reply-To: <20250911-nova_firmware-v5-0-5a8a33bddca1@nvidia.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TYCP286CA0318.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3b7::6) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CH8PR12MB9840:EE_
X-MS-Office365-Filtering-Correlation-Id: 8cac5d3e-c37f-4453-34c7-08ddf12304ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|366016|1800799024|7416014|376014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SHUxcWp5eWhmaVpmOWduMmN5d1ZZTUVCYjMxZUd6NjMzTUhtSGE0YWY4dkdo?=
 =?utf-8?B?eHZQVTl4SHFwaDM0ZlFYN1ZKVitIN3RWeVhrRVd0TkMwb09LSk5oek9za0lv?=
 =?utf-8?B?Z1liNE1wREJvUW9iZy9KM2FOaktNZHZLZU9GTi9ZYXk1RGdIL0pXRG5NVGUy?=
 =?utf-8?B?cDF6cSs1NE54YVJlRURLM0ZnUCtsbVBKdWxxR1hOWWd6RmdDZmsyaEFrcU92?=
 =?utf-8?B?bkhONTRYR1lFVEZrQi9wNUpPbHcxZDNQeVduN2JUb29VVXRYZ01RdkpYNXZt?=
 =?utf-8?B?N1dXZzc1L1RBcHJUN1pjVmt4bVliRHJaR2FNdmpmdXA0K2Q0bXhhMzFpRDNL?=
 =?utf-8?B?eTlNcDJ3LzVkRWpKMXZwZEhITm5QYmFwdnl1WkZVQklsT29NanJvakVmYmxN?=
 =?utf-8?B?NlU4K3c0RnRCQ3lDRnd2aEdCSEpXWjlHM29lYklqa0J5TW54M0VWbnRZWUYw?=
 =?utf-8?B?OWF6NWFObXExelM4RVdoQmdCOEtnUDVEV2dRWFlUWXhzLzJveUlTaHo4Qm9L?=
 =?utf-8?B?RWNaYTJKenpwWGdnOHJjZ3dFcjcwTGI4eXgyY1NEZTZKTHBUa2NtdmU5QUQz?=
 =?utf-8?B?OTZ0RW4ycWtSdTlXUkxkRlJWRHJxUlJJdlVsdXZSZDhEaU11NVBwQjU4TEZO?=
 =?utf-8?B?dWIwMjM3Mkk4NUZlbmI5eTZLYXpOK0M3UUlzbHJ1a25XTjlvb1ZzVTRzaDlO?=
 =?utf-8?B?bE9vbXF1NXBqN2J0eHpGY2RDOTU3UFpCUHFaRWRmTnBzUVVDUDdFS0FwYytF?=
 =?utf-8?B?STBIZ3A4OWNNemllNUY3SnpMMHBOTFhjUHBNZXBtKzlDUldyOUJ5bHd5a1dF?=
 =?utf-8?B?bXVEWkFSMkhsRUE2Tm5LTjg5ZGtKZEFZZGpubTI0Tit3cFRTT1EyNTVPSjVh?=
 =?utf-8?B?YzQ0bmF2aVphYUFXWS9JL2E5RFdzRUhYQmVkNXBzNWtIM3Y0V01tMFFlRmZr?=
 =?utf-8?B?eGExRkVWMWRlRCtYbThRZjFTaDRxeDhCN24yNmZNRVFMZEREZnptY0grRy9u?=
 =?utf-8?B?NTBYRWlaYzI1WUNHTzJVbWRXdTBUU3p4dzFDQ0c4THNRUEJIRjVUMGNMZ1FJ?=
 =?utf-8?B?RjVTUEw3MHc4V2NsT1V2SG9NSGIrQ3JMYmo0cVl4YzhCZ3p3OS9LbnJzMFZ0?=
 =?utf-8?B?ZHhDUFlnaTA4Sy9hWDZJZG1meTF1OTFUSEo4Sk1PcWJwN2srbTNoU1NZNmxI?=
 =?utf-8?B?SUk4VUtZUFFNK2R6ekZZUFJ6NHhCOW5CSVZzNmlMSW5HRFdkcENVSXI1MERT?=
 =?utf-8?B?ZWt5blV5V2J4bWFwb2NjV1J1aWtaTG1yeTZMaFQzNzJGR3o2cDFzMENFbm9N?=
 =?utf-8?B?c1NCbkttaFVTdzJmNzdjR3lqLzc5SzVrNmdYSWc4Uk5KcHU3TVJsYTJFNmpY?=
 =?utf-8?B?YUNyRGJ6VElUZjhDNlphN0JtRUJKUVlsNTBVK3Noa25QQ3p3eVdtWWREcE4y?=
 =?utf-8?B?WENsL091ZzVjWURjNUpiYUUrc1YxdGFLOEg1RVFHSmVBM1dnK3VHc0cvY2VM?=
 =?utf-8?B?NGxjaWxsWlFIOTR2bGc0RHVLQkxsK1ZvRUQ4SGJZVG0yWUwvZjhVR09OalJI?=
 =?utf-8?B?TmhONTZ4aWZteXphdG0zTzZDNmtHYTg5MGJFckRtOWhpNmFkVXU3QUpMS1U1?=
 =?utf-8?B?cXNsbDVDVGF2VHVhTkZHQW8zTHBVeDE4K1NFeXlJR3hHbk9uYVAxZkkvejhE?=
 =?utf-8?B?YmJjbUp2VStTSXBTbFg2cm53ZkFidzJUOEYvWXJjTFUxLzRPU1RQRmJIWXQ4?=
 =?utf-8?B?elRJdVYyTUdMUkJOVTVBbGtVQmJWSjlYSFJjRFkySXpPbzg1SGR5aWhlYmlO?=
 =?utf-8?B?Nkl1dTJpd2xHT056NlEyYTJLRWlOMW0xbzN2WDV1cnp6UUZjTXdnZjlPcDRi?=
 =?utf-8?B?TEVmaVlEUDZJUkNWcEV1cXRiNWpWWW9icHlRemJSQXg4RUxzK0RtQzdXVndn?=
 =?utf-8?B?bkdkc01YREkvdWVNYytQL2dCRTZCZVUzaDlqODNUdHlUYnBlaU4yZHIxY2Zy?=
 =?utf-8?B?RWEza0FOSDlBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(366016)(1800799024)(7416014)(376014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MXByaTczMFFiZUQrZkR4UHhBcitSRndZc0tiZmE3TmNodlpKd2JaSHdOOEt6?=
 =?utf-8?B?TXZuOXlSeVJzMEIyejJwd2dSdFpOVFI4NFJTSWR0NTd1R0tidHRITG9Db0ty?=
 =?utf-8?B?Nk9OYzJRK3gxZGFUMUVYa01WakZKUk55U2EzYjc0eGR0Y25tRTZMVlJybDZ0?=
 =?utf-8?B?aTdwSzNtakpMWUEzVEh1Wjg1MEN5ODBKSTg4MCt2V0xVdkxYcmNQSDBMVFFP?=
 =?utf-8?B?c3pyNXJMaXROVlVlMVRBUFJmcXFCNVlTUm5HRVhrSkhLeFFSODE1NnFrOG1j?=
 =?utf-8?B?Y212eVd4M3pCaDVHUkhqUnI4MWVhMVY0SW5PYVJyVDRhTmVWYTJYZGdScDQ1?=
 =?utf-8?B?T0xzSmdsZkdpTlRlZWZuQWRvTFIxTDlBV2dTRDAweHRVMlRpREh3QTlpOXNP?=
 =?utf-8?B?TVRXM3dReThONGNYdG5zRzREYnBnd0lPT0lNNUJ1bjRxS2dLZGxHeEhyUVh1?=
 =?utf-8?B?MkFtV3BtRjVrbklmNHhBQ2ZNcXhBT0x3ZTM3NEVzRjhSS0diMW50L1Boc285?=
 =?utf-8?B?N25FZUxWa2MxcXV1VXEzL21TSDZLWjhGY0xWbTFHaklMVmlSYlgwZWhCLzJ1?=
 =?utf-8?B?dDZtS28waHF5S29MVW9qYXJqaE5iRHgzUXQwVnZiNTR1UzBqY0VpRDY2enY3?=
 =?utf-8?B?VE1hRlpwWVM3U0JTZ3R5enZWNlFJcWMyMDFxWStXdm44V2ErWVB1NW1Yamxw?=
 =?utf-8?B?WXNEb3lJb21pQ1NCK1p5SE1tTW5iRDFFMndaZ3E4TkFPZ25oRmRWSU83aTNx?=
 =?utf-8?B?VUswNUdpNGoyVmNMLytyREFJalgvbVlRdSt2ZVo0Rzd1blliSHhQby96WkMx?=
 =?utf-8?B?ZXVxdWx6MGwxdkNBUThBbHorampiQ0RyWVR5SlZvRlpQQXFrUFNETlpFQ0xK?=
 =?utf-8?B?RWZBejdMdm4yMVlvaHVpam1wbENqZXRQeTNGNzgwenRsd09vT2VCZVF1UndS?=
 =?utf-8?B?MWNvbE0vamhaNmxuNTJoVHpVa2xiU0pTMnhlaDBUY2I1M2J3VitCaU5NSWdi?=
 =?utf-8?B?eWVpU2N2a095MG9TTi9Dd2tRaUd4aUhPVUd4R1FqdGE1TklRRnZ3SFdXa0ts?=
 =?utf-8?B?dDdtdlZuZmZEYmYzVjlLTGRUcWtGUnNZU2VOQVhNTHI1b1BPNVVjb0ZkdHJk?=
 =?utf-8?B?TllxbzdtaVc2N3V2L3FkYkd6djQzOHdHbXRLSENnb1hQOFpwV1ZMS2Z6MDBh?=
 =?utf-8?B?b1EwQ0hRQnRrU1U1V2YvU1piR1hFL2JRVkhMUDlqZTFyZzZYemVHeWZzQ1Zj?=
 =?utf-8?B?NEpJdHpmMlI1TjBHTks5YTBPM1FkZEtsc1RZWGRXNytWY0NjSjNVVm52Z0Zl?=
 =?utf-8?B?QzRFeStiOFVlbWVyZGU3KzlTcnlZYjRoZklYMU5HSVJRMktweXJBV0V4SGdG?=
 =?utf-8?B?WitGWDBmdStVUGVIdW5zSWRrTGdkbUtnOFZhY1pZR2xtajE1WGNLTDJQU2F2?=
 =?utf-8?B?eXF2NFEzcVV6RTJNSXhRbDdSNXFnNWxIL0wvdzA5N0VYNDN0ZFoxNEpUWFNm?=
 =?utf-8?B?Z0FabnRtb3pQaTA5aXk5S1krcWxVZVhFSk4vdEV3NzJYMVhGczdTZFMvZFcw?=
 =?utf-8?B?VUc4cTRVUUplanhHZ1BUVldVYWlsRjVCYnYvVWhNR3ZJVGQvTmE3SGVXdFdM?=
 =?utf-8?B?TmphbE1HWnRsSGJkSG9zMjE3V25xb0dEWUJESUUvYStUeXpzNWtEcXlGelVh?=
 =?utf-8?B?dS9CVGt1ejBaZFdGVXFWRVpBY0NVbDhaRGlad1BnSmswZ256VVFKbEVGTVhD?=
 =?utf-8?B?MW8xbDZabXk3ZU5NN3Z5czRlVHZ1ZnVlaDlCMW54SjZtZE10bFhPMmlwOTdn?=
 =?utf-8?B?aWFrbEFMd1liaXQ4NTBxQVVlcEdocFdiSWdoY1YxeEc0VHhqQVBIUlcwMUlq?=
 =?utf-8?B?dGQwWmtoM0NVR2I2OVhXa0NTajhnTFNVSGVQOW43QS9XVkx2ZmxmYUpwVkts?=
 =?utf-8?B?dmFMV20zZ1oyRlhaaXRNRGlWbUh1bmt0NVJ4SnQyekd3Qm8wektvK0grd3lq?=
 =?utf-8?B?a2xQTWdGeVpYNmJrRlNjSUxSRkZBNEd3cldmWWJzVjdjYVJheVgxSTc0d1Vk?=
 =?utf-8?B?TDg0ZEdUcFM3THhuaGxSTEM0cm9zUHJuQTk4WjFNQ2NISnpseEtQSkJYQitk?=
 =?utf-8?B?Z2kwOHFZblhNVVVFOElZVXJZeW0zSmMxeUZlcllQSUFQRzhkcGNEQktOK2JR?=
 =?utf-8?Q?x60bhKDMykE2GMwLlER8bgr/NHkuULiUZ0rPo7sn2Vrk?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cac5d3e-c37f-4453-34c7-08ddf12304ae
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2025 11:04:46.2310 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nHHqf7J8zho3mQX6PA7LEv3ibM2a1Xnp+sD0IrOsnWs41uRSgflqKkij9It29xzwLOFJ7JSpzv43fH3PFqATNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH8PR12MB9840
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

There are a few cases where we need the lowercase name of a given
chipset, notably to resolve firmware files paths for dynamic loading or
to build the module information.

So far, we relied on a static `NAMES` array for the latter, and some
CString hackery for the former.

Replace both with a new `name` const method that returns the lowercase
name of a chipset instance. We can generate it using the `paste!` macro.

Using this method removes the need to create a `CString` when loading
firmware, and lets us remove a couple of utility functions that now have
no user.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/firmware.rs |  8 +++-----
 drivers/gpu/nova-core/gpu.rs      | 25 +++++++++++++++++--------
 drivers/gpu/nova-core/util.rs     | 20 --------------------
 3 files changed, 20 insertions(+), 33 deletions(-)

diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
index 2931912ddba0ea1fe6d027ccec70b39cdb40344a..213d4506a53f83e7474861f6f81f033a9760fb61 100644
--- a/drivers/gpu/nova-core/firmware.rs
+++ b/drivers/gpu/nova-core/firmware.rs
@@ -30,9 +30,7 @@ pub(crate) struct Firmware {
 
 impl Firmware {
     pub(crate) fn new(dev: &device::Device, chipset: Chipset, ver: &str) -> Result<Firmware> {
-        let mut chip_name = CString::try_from_fmt(fmt!("{chipset}"))?;
-        chip_name.make_ascii_lowercase();
-        let chip_name = &*chip_name;
+        let chip_name = chipset.name();
 
         let request = |name_| {
             CString::try_from_fmt(fmt!("nvidia/{chip_name}/gsp/{name_}-{ver}.bin"))
@@ -180,8 +178,8 @@ pub(crate) const fn create(
         let mut this = Self(firmware::ModInfoBuilder::new(module_name));
         let mut i = 0;
 
-        while i < gpu::Chipset::NAMES.len() {
-            this = this.make_entry_chipset(gpu::Chipset::NAMES[i]);
+        while i < gpu::Chipset::ALL.len() {
+            this = this.make_entry_chipset(gpu::Chipset::ALL[i].name());
             i += 1;
         }
 
diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 92fb0e4765ed322484672a1e01568216c3e0a7db..1dfd085189cbf188f9cfa829eb0cb7484d9c4d62 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -10,7 +10,6 @@
 use crate::firmware::{Firmware, FIRMWARE_VERSION};
 use crate::gfw;
 use crate::regs;
-use crate::util;
 use crate::vbios::Vbios;
 use core::fmt;
 
@@ -28,13 +27,23 @@ impl Chipset {
                 $( Chipset::$variant, )*
             ];
 
-            pub(crate) const NAMES: [&'static str; Self::ALL.len()] = [
-                $( util::const_bytes_to_str(
-                        util::to_lowercase_bytes::<{ stringify!($variant).len() }>(
-                            stringify!($variant)
-                        ).as_slice()
-                ), )*
-            ];
+            ::kernel::macros::paste!(
+            /// Returns the name of this chipset, in lowercase.
+            ///
+            /// # Examples
+            ///
+            /// ```
+            /// let chipset = Chipset::GA102;
+            /// assert_eq!(chipset.name(), "ga102");
+            /// ```
+            pub(crate) const fn name(&self) -> &'static str {
+                match *self {
+                $(
+                    Chipset::$variant => stringify!([<$variant:lower>]),
+                )*
+                }
+            }
+            );
         }
 
         // TODO[FPRI]: replace with something like derive(FromPrimitive)
diff --git a/drivers/gpu/nova-core/util.rs b/drivers/gpu/nova-core/util.rs
index 76cedf3710d7bb248f62ed50381a70f8ffb3f19a..bf35f00cb732ee4fa6644854718a0ad99051666a 100644
--- a/drivers/gpu/nova-core/util.rs
+++ b/drivers/gpu/nova-core/util.rs
@@ -3,26 +3,6 @@
 use kernel::prelude::*;
 use kernel::time::{Delta, Instant, Monotonic};
 
-pub(crate) const fn to_lowercase_bytes<const N: usize>(s: &str) -> [u8; N] {
-    let src = s.as_bytes();
-    let mut dst = [0; N];
-    let mut i = 0;
-
-    while i < src.len() && i < N {
-        dst[i] = (src[i] as char).to_ascii_lowercase() as u8;
-        i += 1;
-    }
-
-    dst
-}
-
-pub(crate) const fn const_bytes_to_str(bytes: &[u8]) -> &str {
-    match core::str::from_utf8(bytes) {
-        Ok(string) => string,
-        Err(_) => kernel::build_error!("Bytes are not valid UTF-8."),
-    }
-}
-
 /// Wait until `cond` is true or `timeout` elapsed.
 ///
 /// When `cond` evaluates to `Some`, its return value is returned.

-- 
2.51.0

