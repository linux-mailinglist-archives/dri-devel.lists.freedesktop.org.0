Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5C4FB09C70
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jul 2025 09:27:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06A0710E8F8;
	Fri, 18 Jul 2025 07:27:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="MQEaF3zI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2066.outbound.protection.outlook.com [40.107.101.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCEDD10E8F8;
 Fri, 18 Jul 2025 07:27:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=asFnHoQ65HyA2yzqagXXIkyBJFXLVPOkUeD0A2gXLHRH5uNQV+u9exyCcHn/yB5qPGoi3pXDAQRf35O90rj9dpZDqr/3It/paPx2RqXy0cSwtkrpMnJEHr5hx/F1dvlUDEsGXBs8RxP+oL0qOuJW2l9cfJW9pKBIct5YT7iOOm1HOhXybGris7BMmCD03oogeemso2HlvYY0IReHAPR8Q/ZGAQPQnywAL+wSSU3PGFWE5CNUX7rZU6id42UkXWsrVNLdwvj81gQmNfuzKdhBehGfK4xnLneoC5Wz0udBtYjBEWDAnj+NxT1OZ4z7rqQKEgtinMXCus/zI/xiv0UPbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QmQijlHZJSq+125OpM5XCjf4EKB5ZTwUcOEr4NgyoHE=;
 b=L/fDFMTE6jY1330j5KBzvJVpZi1Z154FgPT8IrGOAKyVBIKuNNDmf9RLNEdf1IfZdYGhf03SbKousHUvZNVEFTnVibyOpx86yahbme/2yRTyBzRMMZh6Q88e7cPDiH2/KevOP3G8tWeGc9FZo0Sv0fXd8VnOG/AvB1p9it5meokuhDYaW66kR39XSyucU84Z7OLEP9Z78yy21ROvlLvc18Bu5tLxcGeQCgnoszxK9pCHTjCF7ty4fRIt+DZvPbHRUzOhx2BrlrOx3uVGXV5ulFuRZW+OOkKhBMRnej5lqKbgaavo0/lE1G6w+BBkMTrW4pZmdbn6NCj6j00M7UJPEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QmQijlHZJSq+125OpM5XCjf4EKB5ZTwUcOEr4NgyoHE=;
 b=MQEaF3zI+GcsLEN6d/ViEnUeGVIdUrFXZHhRqby3FV2hMUZ6bfdokdIDFHqiEdWyLHPs/B1dHeaVhAiUchcUy43EYn8u3Ojd+Zbr2L+g0gxtBOa5SCP7SQ84MeyNazZzeeKAG5thyCuzfLQ1YbHUqZiDHqyNPabZRrnYJ0h0fUR910B297jXFyz8KUykUyDXwB0fFf/WSriBm1PEexhoigeMEA8reoVg124QQnDT8TVtuEJrfYzguF3EnTRfC3sqBklALsLuS+wYL0E8pIZSjZ3KnY0qezS2uiOI5SGbFdQzrzqQj0L86Dm0YO9J3ALnNwHMwA5lWsFZ32vE4gofpQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DM6PR12MB4091.namprd12.prod.outlook.com (2603:10b6:5:222::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.25; Fri, 18 Jul
 2025 07:26:57 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8922.037; Fri, 18 Jul 2025
 07:26:57 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Fri, 18 Jul 2025 16:26:16 +0900
Subject: [PATCH v2 11/19] gpu: nova-core: register: improve `Debug`
 implementation
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250718-nova-regs-v2-11-7b6a762aa1cd@nvidia.com>
References: <20250718-nova-regs-v2-0-7b6a762aa1cd@nvidia.com>
In-Reply-To: <20250718-nova-regs-v2-0-7b6a762aa1cd@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: Daniel Almeida <daniel.almeida@collabora.com>, 
 Beata Michalska <beata.michalska@arm.com>, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TYCP286CA0359.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:7c::13) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DM6PR12MB4091:EE_
X-MS-Office365-Filtering-Correlation-Id: 552ad851-8a5d-4d27-3e21-08ddc5cc7a5a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|10070799003|7416014|376014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VnphQ3ZRamdGR09iZDhTdDQ2RFN4dTZpeXdkZzlPNDhMc3crODNQUXM5SzlO?=
 =?utf-8?B?Zy8rcmlKeldXRTVCMVVwQ2NmbU9CWWQ5Mk5pQTRjUUVyQmJxSlB0ZlhnUWxR?=
 =?utf-8?B?MmZ4aXJuYk9wRGlVNXNBNmdpeW5tV3lxZlFpbFA1QTh2NWxEZ2Racmo3TGlN?=
 =?utf-8?B?SWZWV0lRcThvQ0ROb3dkeTFVa3BHUWp2aGZGSjJIRDdLZEVMaHI5d3cyejAv?=
 =?utf-8?B?S2xoOFJMb2R2eExUSnN1dy9KaVV0NGZOMXNEcVp1dlZqOG1nTEJzMkE0bU9E?=
 =?utf-8?B?OGgvQWxBMDMxNHJrbU43a3hYaGI1d2tRTHhTWUxmWFlmQ3ZKQmVYZlVlVHFh?=
 =?utf-8?B?d2V3UzlrVElqbkQ4alhEQWE2YndLaENqYzM0KzVCYXRNbUZpdmxjWGJ2dk11?=
 =?utf-8?B?bUk4cWN4U1RtVmtuYkNaU1BaWElGbnJsbFM3VWEzN2xOWUI4Smc1Ry9TaDd2?=
 =?utf-8?B?SmFKbHRUeittS2ZnRERpWHlQSVZNRWtUUDhtR0pCODlXdDIzaml2Tk5DWlpU?=
 =?utf-8?B?RkZUTno2cUloRkZRelhBSEhvRDBodDZkQ2pVL0luOEwxYndMTjRpSjVjWHI0?=
 =?utf-8?B?OHdNcWY1dXk0QVc3bkVRaFV5NGN3dnpXUkZSZWVHeGdxUDllVU43Mjd0cGlX?=
 =?utf-8?B?bG51c2dqZmUyQW9scTNlUkRNUXFvbVJObWFYV0cveFlmbjEwL1RnU1o3OFZl?=
 =?utf-8?B?cFdUY1ROa0YwQmZjUXBIV1cwMzRTUzQ4YStYZ05tK01MS0Nqb1VZTkNSUUY2?=
 =?utf-8?B?RWNxT0c3YlBXbUg2aXpGeEErSkF3QVJPcTY3UktUbSswUjZiVzYwTlFSR1FE?=
 =?utf-8?B?bVJjciswSjlLQ2hCSUNVSmxPa21PdzlnL1paVDYrNGpxa2VTd2J0RGtzdmlh?=
 =?utf-8?B?MmsrMm5qSWVQM016amdhSUpkUkU0aUQ3czZIYjZ5dVdiSzJCeUt5b1lZaE5K?=
 =?utf-8?B?N21iT3c0ZXlHK29tbkVKUzN5WjYvUFByZER2L3FwaUxob0tOeVUrK05PSGhR?=
 =?utf-8?B?UjFRMUxWOFdISE9GeUJYenBvRnk2QmNxMkc5b3VObEw1aGN5Ti9ySW4xdkhj?=
 =?utf-8?B?NzNXaXI5a0tJdUZzTjczKzF3RnFnWjNiT2VWN09jNUFIR0N6ZEhoN0NFVjJN?=
 =?utf-8?B?dEFGb1ByeTdmZDh3ZTFWUmNSTXdhakJhZTN0R0pvakJWbFFDUWRSMGc5bXM3?=
 =?utf-8?B?V0xhejRac2NydWNjWmd3TDhyMy9ZRWlnMzMwam1uNDFwRkV5TjR3R0VmT1dv?=
 =?utf-8?B?V2lyTWJRZXkrZkRkZWJ2YnRhWk1FUEpyeVdUWUF0NlU2Y01WWHk1ZjB3R2RH?=
 =?utf-8?B?MnJKTncrb3BWTFJDWHJaYVZhb1FPdVVZbUhaOEc2QTNDSkxraVJxZ2JTZXVH?=
 =?utf-8?B?Z2I5NUg5Q09WMnh1SjQvNnpRNTFzQ1VyNDFibVpVbTJtZ3Q1aXFzWGsxUVgx?=
 =?utf-8?B?bGw0a3RRR29ja2wxSzdqUklpYWxJU2trRW8vc3FWd0JHbExaaVpGMHArTEdD?=
 =?utf-8?B?K3MwMmp2Y202b3daUnZrNGlsZ3dibkY3SDB5K2pZeWh2U3ZjcGVxUit1Z0tl?=
 =?utf-8?B?V2hvSkhRVFdxOUIzdEp5S1JxTTJpUWlMTmZvQ0RjLzZEVmJvMHg1UzdCUEF1?=
 =?utf-8?B?N0dLQTUxNkw3dE5kc3dHaFFGSllnRVNJQThrZEtycGVmMlZHT2gvbXJDeVRz?=
 =?utf-8?B?bHJ5Q1NCK2hZcTgxM3RHZU9hRFBibno2WTN3MnpYZzAySXdLVG1DWUZsKy9X?=
 =?utf-8?B?bGovMWNNQlZFV0sxWUlHczFJVVBqbXFUcUFnbVZGNWI5NlN6TStESm1qZmpR?=
 =?utf-8?B?QWJ5YWNFMnowcDFsZFQrOG05T3Y0Wi80YnQ4QzU4b1c1a1hGQS9hdjRUcDNv?=
 =?utf-8?B?djdqc0hEWXBieEdDMFB6QzF0ekVTTzloeUlGNzkwYldBSmc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(10070799003)(7416014)(376014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bVNVTGN3U3YyMEZsb2pJQjRFdC85ejJmTkxBVjQxL2NJY29oZ2dMaXRnRzBJ?=
 =?utf-8?B?Vk94NXJTeDJ6OEtLNFF2dEFuNWNOdld2Q3M5azh4SkQwbURsbDd2eFlWM3N4?=
 =?utf-8?B?aVdnVHFtTVBlbWY3eGdLWFd4TEwwTU0xdlJEQzhSZW1iSmt0MW5ia0RxWXQr?=
 =?utf-8?B?bCtVU09PZ25kM0ppMVJLOWRlV21Jcng1bExzYXl1ZDNPaEk2akJrQmwzT3V3?=
 =?utf-8?B?T09TSjNzdjhWN3BzU1ZvZUhWRGFHNVR1LzNPWUtlV1lwcWhTZzhnZ05RbmRr?=
 =?utf-8?B?eDVUZWp0eEVHR0NHamp4SVcyR2VHYzRUMkdQMjAyaE81K2NuUDlIODN5ZDI2?=
 =?utf-8?B?V2VEeG1sak12S01Gb2NEQVZ2b3JEOVhlNG94SkVNSnd2UmVlTXJ5TTNxb0Ix?=
 =?utf-8?B?aWg2M3FMSkhxbkU3bCtURENqU2tFdkhqSk1qSldIMWIzQnpvUHA0OHpybVJs?=
 =?utf-8?B?TFpRWXlGMGREd2RvWUJsbWM2WS8wSk8wYUVXQy9mT1lKRVptMUlnbW5jbUhu?=
 =?utf-8?B?Q0dKOGQrbzJFTzBuYjR0UjJwRXhKQmRCd21EOTczNXQ3UThYdUhNaEpoM0d2?=
 =?utf-8?B?ODRaVDI3U0lZZllDVmVQL1JVZWR0dk44aWpSQXhMaENwZzBxYzJvNFZFVUh6?=
 =?utf-8?B?cHYvN25iT3o1N0lVZ0o3eUVDYVlhdyt6M3dQMXRrRnJaaXBYTzc4TFRFTml4?=
 =?utf-8?B?eEZYd1UzTXBXSWZjU0JOTm84RWFhR2JDSE1neHA2OTVFQWhyWE9uMzkrd21H?=
 =?utf-8?B?TlIxekhRWG5IM2FyZ3V2MFFVdXVLc3VWQzFwOFVseW1zSnp0UFhHSnE1YWV4?=
 =?utf-8?B?VlZRVnFzT1JIckxGeURlai9CaGZDM20wcUFoWDRKejV1K0dsOTJ4S3o0VDdi?=
 =?utf-8?B?RWRVelViTG52M0xoZUZob05NWDhkSFY2NmFZUFdSSEVtTmZiUG9PbWszeDk3?=
 =?utf-8?B?aXd3d1ZXR0Ztd2VnWlZkVkZzdnhBNzlvcGhqZmRrRzE4VVlpL21RQ1p1WG9x?=
 =?utf-8?B?aGRsNSs4dWtLem9kTEw0N2phS25uK3dNa2o0OTRkNTNVRm5TT1NnckY1RkV0?=
 =?utf-8?B?cVArZUl6aFNST2hqUldXTktZY1pjbXRuWXNTNVlJdTlEeGdubk1UWDJwM3dJ?=
 =?utf-8?B?ZExxakFxMExESElEY2dtN2tRVUlMTHFraVRIcjBRN0VJWExPQnhNcFNacW9j?=
 =?utf-8?B?ajNmTEZFMGdhL1ZMWE92UUhDWHlJbmM1SHBJY09saC96ekdZcGlYVXFBVW5H?=
 =?utf-8?B?Mmx1am5hajRabTVHK0VjUnc1OTNaYzBhOGVXWnJiejZ4bUVpdHJ5Ujh1WDkz?=
 =?utf-8?B?Y2NWbGFLdTI1SDZpR2cwQlJ2OGs4MExlWkZOY0xHakVEYjFHT2FqbmNqa3Vj?=
 =?utf-8?B?S2xvejJPQS9sZGJySVd2MnZ1aEpGV1YvVW94aFprOEFPZFhWMkRBNlV5R0Zq?=
 =?utf-8?B?TnhpWU5YbGNIZ1dYaU92MXVjR0E0bmhJUGNRbFdIMFFqUVRVRVJCN00rSXBK?=
 =?utf-8?B?UE8xMExIbG1EWVpZNkVQZzJuNDMrZXZPdjVWSW9ReUhkMG5veVF6eWhtVXBT?=
 =?utf-8?B?amhUSHhNWGVXeithSnc3TlN2NTRmc2Judjc1OHduNklTMjl5MDExbFNxZ3pT?=
 =?utf-8?B?S3VmczBjTnJjSVVucTBVTXQzVC9ycHY3VHNtTTU2R3RJZjN2OUNCWVpzSzYw?=
 =?utf-8?B?R1JxRUhEblhTeVl0TDNRbDN4dEp5WHU3ZTcxV3Y2Ym1BeVc1K3NaMCszUk90?=
 =?utf-8?B?Nkd6UjE3U0ZCMWNadWJQTzBOY0xYVlFqQ3oyMmJTQytBTjFLaXR4S3g1Zldw?=
 =?utf-8?B?WUJ0SmFVV29iLzJwaGlRNkFJZE9GYXdKbHhiMEhKVmhOMTh1RVZLaTFKNTJW?=
 =?utf-8?B?dWRRQmVwbEZXK0VpSmN4azg5ZTVIQUJMQ3F4enlNUGUxamlNWHo5TW1hYkZo?=
 =?utf-8?B?SFBZTmNpWCtpRWNsbm1jTnZNS05aUUNRZTI5cTdzWEtENWNzZzFZU050Sk5K?=
 =?utf-8?B?RTkrOWF2RG1Pa2pydG0rNllBSmtMTjZxOXlhVnZnVkRVQWx0QXhqbWQyc1NX?=
 =?utf-8?B?b3RoTkIvam5hVm80dE1MckNFMXF1Mit2TFJqMVJSUFA4U05vUWlDc3FWa1JC?=
 =?utf-8?B?aU51TnJYL2xJNXZWeS9Ea1EybnVDS0FGNVlycmZUbWtseitMYk5PekpEWGda?=
 =?utf-8?Q?gScHSYCF3LJRT8UinBMwgCUTvRVCHVyfK5b0Q9meNGNU?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 552ad851-8a5d-4d27-3e21-08ddc5cc7a5a
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2025 07:26:57.5770 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B6+QkXlaAzSczcMo148L7BhVzAC/7NLOrzFwnuQe43JkVS/frpG2xn9USe8BUTyRf94P5/G2wxGe7WQUiqZJXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4091
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

Now that we have an internal rule to dispatch field information where
needed, use it to generate a better `Debug` implementation where the raw
hexadecimal value of the register is displayed, as well as the `Debug`
values of its individual fields.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/regs/macros.rs | 25 +++++++++++++++----------
 1 file changed, 15 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/nova-core/regs/macros.rs b/drivers/gpu/nova-core/regs/macros.rs
index 8b081242595de620cbf94b405838a2dac67b8e83..485cac806e4a6578059c657f3b31f15e361becbd 100644
--- a/drivers/gpu/nova-core/regs/macros.rs
+++ b/drivers/gpu/nova-core/regs/macros.rs
@@ -122,16 +122,6 @@ macro_rules! register {
         #[derive(Clone, Copy, Default)]
         pub(crate) struct $name(u32);
 
-        // TODO[REGA]: display the raw hex value, then the value of all the fields. This requires
-        // matching the fields, which will complexify the syntax considerably...
-        impl ::core::fmt::Debug for $name {
-            fn fmt(&self, f: &mut ::core::fmt::Formatter<'_>) -> ::core::fmt::Result {
-                f.debug_tuple(stringify!($name))
-                    .field(&format_args!("0x{0:x}", &self.0))
-                    .finish()
-            }
-        }
-
         impl ::core::ops::BitOr for $name {
             type Output = Self;
 
@@ -171,6 +161,7 @@ fn from(reg: $name) -> u32 {
             ;
             )*
         });
+        register!(@debug $name { $($field;)* });
     };
 
     // Defines all the field getter/methods methods for `$name`.
@@ -316,6 +307,20 @@ pub(crate) fn [<set_ $field>](mut self, value: $to_type) -> Self {
         );
     };
 
+    // Generates the `Debug` implementation for `$name`.
+    (@debug $name:ident { $($field:ident;)* }) => {
+        impl ::core::fmt::Debug for $name {
+            fn fmt(&self, f: &mut ::core::fmt::Formatter<'_>) -> ::core::fmt::Result {
+                f.debug_struct(stringify!($name))
+                    .field("<raw>", &format_args!("{:#x}", &self.0))
+                $(
+                    .field(stringify!($field), &self.$field())
+                )*
+                    .finish()
+            }
+        }
+    };
+
     // Generates the IO accessors for a fixed offset register.
     (@io $name:ident @ $offset:expr) => {
         #[allow(dead_code)]

-- 
2.50.1

