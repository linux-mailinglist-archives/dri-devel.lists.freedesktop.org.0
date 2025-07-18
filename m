Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EAE9B09C7C
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jul 2025 09:27:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D63FD10E911;
	Fri, 18 Jul 2025 07:27:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="dqxLNZCk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2069.outbound.protection.outlook.com [40.107.212.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02C4410E914;
 Fri, 18 Jul 2025 07:27:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kyDrBMAUY9QJn5VtnvwsSkrCoboe7bDLPueQwdhbPI2ginvqhZwaBftZLz0urHmR6AmNXWl09rafna7a8CVol3v3L2Y1I+1gg94gbzhsfEZzU6J85qM38aZw0T5+t2+dZYbo9Jnk1iQzfj0lknZz6AqqfqpmAX4jQ8MI4Yj9Dm1PivGAUjkA2NJAcYYhNhUG7sjpciDCF2mT9zHLQpVK4DQW5YrBNgbNjFse7sqW49jPTWoXCppmKBWzxqOeUhWeNVL3YWbjWxckZlmzneJ8ODNmDbiwCHrj5t/ajHLBO5OY2wPUzf6qk3EhhG5jTxuNkCbYdwJIZms6BLLKJ4PXbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3y8Oe6AdsGgbvX7UY2j39SBSAqbs2dcKCpUm2G2G2B4=;
 b=XSTIyd/f9ofiyUIurem6faqUVni4SS8crpzddDVgclgX2qgGlzjZ1x/zHXbVrTf6EZPp3mH2sMC7Q+sF3Qymt3tfRaTBkc/BlMG0aYQtVM4YMN7k9WCXuZ6SrzKa79U8QJCeg7wcZwrP9nVPoX6dHKMdpgZrFDKfB3I9NfJbQoNHK8QsDRrsQxOXH4Y2IW7pu/R/Qg5RKMCYPcpa2DOjxeP+/j8e5ifU53uVle9hDvYsTrzbtJ3HXM3OwiHHNogvC3gWlC3fq+CpH052SaH08ox7CNljeJYEiuiIoSo+02rq+u55quRIcj27zNuStpmvH9TLhFu/77qh9B8tR5WWYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3y8Oe6AdsGgbvX7UY2j39SBSAqbs2dcKCpUm2G2G2B4=;
 b=dqxLNZCktiAe2iJvWpID+cfePejOeVrq3qJCktPyeLgZ9o8gvRT/aJGgQ0W3a9/kMfFh0LRFk3vq0+DPAQIibjkxZciOhlefRo88n5/IHL3TCGT2LqsJI/15NNZip+qVkggNzNrAL8FEbq4/4sDx2YVAEj45w5fYkAYaGD/ljy6pMLmD+zbu7um5iZSecwjWwjCgHa4piYEQrHQkJA1OcA9XGijskqy4YxAQrVDcdhNRiLxLLY85OACaJ3zP79MbO981dZmU6BU7MGRWqtg3LG4v3T2HAsotcDBNlrW32vjjI9yrKZ20tVuhb2NdvfFh6D3yOYE/OmkScRp1CTjIcQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by MW3PR12MB4427.namprd12.prod.outlook.com (2603:10b6:303:52::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.26; Fri, 18 Jul
 2025 07:27:18 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8922.037; Fri, 18 Jul 2025
 07:27:18 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Fri, 18 Jul 2025 16:26:22 +0900
Subject: [PATCH v2 17/19] gpu: nova-core: register: add support for
 register arrays
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250718-nova-regs-v2-17-7b6a762aa1cd@nvidia.com>
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
X-ClientProxiedBy: TYCP286CA0248.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:456::16) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|MW3PR12MB4427:EE_
X-MS-Office365-Filtering-Correlation-Id: 56007d16-5078-42c0-6791-08ddc5cc869c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|1800799024|366016|376014|7416014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Y1BkVWhYcWl3WWQ5NXZGZ2trc1BnakFtSUt5ZU5vYWFxOWJndU9XQWVwMTRv?=
 =?utf-8?B?UDQzaWFCa09TYU5KYUxVKzBIN0JEZ1JLQkUxY0YzNi8wdDNRY2ZuRWtZOEw1?=
 =?utf-8?B?b1piUjlNK05yNHkyeUY3MzV3cFM5S3ZPK3NSUkV1UEpGQXVoVVlyZVhvWlRj?=
 =?utf-8?B?UDdWZHovcFhMc0FKdzgvdHhEVHhtMk53M0pCMDQxM3gzUnpNRlZYTmJHVTd3?=
 =?utf-8?B?dFZ6LzBDZnRSMnF0VEtKUFJkcG1kZTlGd2pmN05IeTAyYWc2Yi9jY1FFeFFa?=
 =?utf-8?B?THBobXhlYUs1MWdTejhHQXI0THQyZHdHdUhhRVR1WUYzc2VJcGhramluQnVE?=
 =?utf-8?B?eTlzZUVxbkdmcGh2Nk9HRzM4eVpvTW1TZEZFMlRMK1A5VVNGUjVobXI1UitW?=
 =?utf-8?B?UXRzWmlSTDlFWC9TZ2VZNjRyZTQ0dkZSdWIrdjFjalJaZVNxdm8xWFdjUTVX?=
 =?utf-8?B?WEc5UE1VN2tzR1JORktPSmRjTE5CZFBIQ09qa3l1NlY3M3hXRThTYUhma0Zk?=
 =?utf-8?B?Zi9jT3pWYkRSQWM0TVB5OEU4S1VsRGo2NXNid3RML1BSY1V2UnlPWXA2VVBt?=
 =?utf-8?B?Q1VVMWlMbDYvUjFEbXB2WS92MHhWbkUxalEzYjNPWmozbHNHZUtGQ0tUVGtm?=
 =?utf-8?B?ZXRTcmtQQ3E1T2FLLzNkTm0xcTlPYjFsTVdNYXBZZUkwK3U3WkFRVnErb0xK?=
 =?utf-8?B?d2ZvRU5NbEZ4aXNOQlJxN2lrbVRqdHE1Qm5ROGlWZjY4YmVhc05ISmpoNm01?=
 =?utf-8?B?TEtzTG9MNTJwS3pFNC90QXovQnp5c2VjV0hUMHFCaVc5MUxpTVpMbWFTTGNw?=
 =?utf-8?B?QU1BWHJEOHZlaTZCM0NFQmxZM3o0N1c0ZkpYYVZZWDkwT1BxYkZnQVVkeWxP?=
 =?utf-8?B?MjZlZW9pOEJhbklSM1ZqT1BLWU9xZW1mQzFxVnZJRXBBS28zVjJOVm9lYjJL?=
 =?utf-8?B?WllBZWRtd1JQR001cW9ZTzlVL0lLU1JKTlpMdG5WanNNTnA1RE44d3MwSFZP?=
 =?utf-8?B?VzN5VUtCYTh3c3JBZ3Fqa29abi9ZdWc3VGR3SXJRVkswWTFOTm1ha0kzQ25V?=
 =?utf-8?B?SC9tZFdxc3V4YUVZQ2NKUTBBekpjT2dBUmVVc2xXSTcvOVlqcWExdjVZaXdG?=
 =?utf-8?B?eUVWbGU4aDU3NmRubDJTU2poQnlpWU9ZWnpld3ArR0h1eitZQStYemcwa2tU?=
 =?utf-8?B?Tm1wK1QzTW9ySVZvNW1kUjdkNFNqOUIxczh3WGJ2MnVhbmd1SFMvSmRqUm1R?=
 =?utf-8?B?TkNWdTRzWnF0L01neS9PbE8yOGQzNU1UUzFSUmtEczRqWEJGeUttK2dSSEEv?=
 =?utf-8?B?SVAwV29STit1cU9ObFExN0xOeldVbjkrUFVWT0tYcmxqQ2dtMjk4REFGL05u?=
 =?utf-8?B?RVhPVGFqd0ZGd2pVdGh1U2xVOU9od25QUUJPUWhpZ2NjL1BIL3UrVzBlaW5j?=
 =?utf-8?B?S3ljTVUxYmZCNDBNVEpTMnloUVBGaDl1SVZkTVMvTjgwbjloNXFsaStmRW5l?=
 =?utf-8?B?R0FlSnJGaE92a0xFU1d1dVU4NVY5TmtUbEM3SkdqVHJ0Q3hBT1ZKVW5keFNJ?=
 =?utf-8?B?Q3NiZVUyYlZrS3JLcW5CdDZQY0QvaTRjaXQ0Y2dCTVVjbkVid2xDUTZEcGMv?=
 =?utf-8?B?K0JCRjhSeXpBYWxIcVZ2Zmt4TGZVNVR2QVZMM3FUTVB3NXRPWkQyKzRFQk9E?=
 =?utf-8?B?QlFZdlErYkFiS2sxYXRiYmdkejUrQ1RtOStDSEVJcDQvbW1ETXRsTmJYbHk4?=
 =?utf-8?B?SEU1OVpkOTEyTktUR3QwYzc2bXhvREE3Ym1ocWlFZHQ5cE1CaHE4UUdIeTdX?=
 =?utf-8?B?WklCeGVrTjNEaUEzVnNNZFBzcVB6elM1T04wSlVBeFlJWnBJYkU0ZEJtcEg0?=
 =?utf-8?B?aFFOaEJGbGJ3YkNWVkpBWlJuL2M4Y0RNWkFXZFJUWGxHQU9SNnUvM2l0VVBS?=
 =?utf-8?Q?JFA+JBPXFSQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(366016)(376014)(7416014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cmNOZHpOUzBpUDVSOXFkcnNtT2VYY01ybHJ5S0xDci9pRDIvdFUwQnNRZUgv?=
 =?utf-8?B?VTlOMFo0U3hqTVp0NzA3MmJZUmVmQlUzaXhDQ2hFQzBIeVVwOXdtKzN3OFFq?=
 =?utf-8?B?N2FwTUNiWWJsd0ZKTS9RbWk1a2hCOVRnWGxwcm9KNDk5OFBscW1aWERoamF0?=
 =?utf-8?B?NmFYR1NXeGtXK3F2S00zWHAvNnpxMDFQWEQwMjBnRUpYRUJFOVZ6RmZUTmt3?=
 =?utf-8?B?S1lXWFNiYjY1Ty9vYlpMOGxpa05EcHVHOVdqajZaNFg3TUxuMjhlbXhMd2hO?=
 =?utf-8?B?Yk8yZDVSUzhycHNOczNuOW1qT25kdk5wblBVWnN4UTQ1a2ROazRrUE9KaDg0?=
 =?utf-8?B?a092TmNxcG1CdkFPWUl4YkZBWGxKbUFlN0pyTVV3Z2tHZW5GWWpJRTUyZDcv?=
 =?utf-8?B?d29zMmc4OFMrQlhxME9PaElKQnB2LzhLZ3NHRnl0QTRXT1F6MGU2U0ZRUUt3?=
 =?utf-8?B?UkVzUzVqMmpKYlJ1RVpKMlJEblRPbUhXYUZnZTJvMWtIcjVWcCtZR093TDg4?=
 =?utf-8?B?K3ZKdTFobC84V2VVenkzeW9xMlhwV2VHQm5TY0JEd1lLNzNrQTh5c0g4WjZ3?=
 =?utf-8?B?bnZXM08vZEQ4a2JHYXB0UXNnemVKanUzSFNtSE04cVVLbkV6bnlHNzVvZ0VM?=
 =?utf-8?B?b1o1SlZTMVBUL3oxeTFza3hmQlJqcFpUSjlCZzlvTlNBZTNOd3E2SVVyVlYr?=
 =?utf-8?B?Y0FDWkNXL1Z0T1RyQnY5RTRYOENmcllhckZqU2NtK093S013azNNRWEvTSs3?=
 =?utf-8?B?SmljUFhQSU9uQUJ4ZENJS2xyMlh4bmRHOXRZM20vY3NReDd5eXd0V2x1bkpF?=
 =?utf-8?B?RG5GbWtsaC9pNk00MHU0ekFxYmtHNlpSSlE1Z2JVUHhSTW9nRE1iTnB4NUlp?=
 =?utf-8?B?dkIxaG1LaGVYcWpnaHcvL2xUVW03VnlacWMwVFdtakN3WndlNlJZRmU0TTl6?=
 =?utf-8?B?SFZvcHJHdkRJZ01pMk1IRUF6aDZTSmxXcHpKa1FXUWlQL0pwV2FXck9hTHZh?=
 =?utf-8?B?all1d3dpejEwTEtoNm5kQ3ZGTFhPSjVyTnc2UHh2aWJXc3lmOEs4WFRpUmdS?=
 =?utf-8?B?ZzNzQTNrSTVQWFJsSlJ2bGovUkdiVThEbC9pNUE4eWJWVWJkRTJUcWFwa1VL?=
 =?utf-8?B?K2tDQTg2UXVpQVM0N2NTSVB4TTA5ODlpd3QweFhYYkxOeFlzT3c0Z0tWRXpx?=
 =?utf-8?B?VUlOVlJEcFh2TFM0bEY2czFjQnVuWTZ5N2Fza2c0TGVmWGNqVEtRSHB1Mkpv?=
 =?utf-8?B?ejBITWpwTGJaTGwxMExLUUVuOTc4SWVyamI4KzdaMkZ6azVFQ3lpSFRhU0Fj?=
 =?utf-8?B?K2hUNkNVNHBudnFHV0ZrNDNDNHBQUVVOa1dZMlQzOHpOQkhZcDBUU09FN3di?=
 =?utf-8?B?QnlYVXlFakdIYXVZM0JhdTIrdFhJUXEvK2kxamZvRzBRQXkwdm1aWUtPRXU4?=
 =?utf-8?B?bHdjNUFCbjE0eGM1NVFwejR4ZFMyV0tlMVkwS3VlZFFNRlVTRHNIVVNtWk9K?=
 =?utf-8?B?UkVDYWU5TWRhWStRNWhzSFhONUtYck5GM3ZwY0p2bW9jM045eGx1S1N5c1Ri?=
 =?utf-8?B?MW1BSWtpVUZZOEZyOHlFZ2h0SmVjc2pkOHoxdG1FK0NSN243cjdNVEMrbFFx?=
 =?utf-8?B?cm1FZG9QSTRodXJ1ZnI5eXlwNlp5NHI3YnZpVUd6Nk14amhqakNPc0xJTFFW?=
 =?utf-8?B?NDIzdUZDVmR1YmFiNUJyNmsrODAxL2tzSmxrYWNtVzFZemc5OWg1TW5QOU1B?=
 =?utf-8?B?UlJoVjhGYTBlb0EvNHJWeXIvWnZ4MkVzTWIvSmUyZGViYmd3U1IwYTFPRUg1?=
 =?utf-8?B?UHgrS2pVRTRHRFBNQmdCQ1dxVGF2eGZRd1A1NDVDUXd3QmVERC9sTUU2bmlE?=
 =?utf-8?B?a2hrVFJ5Y1YrOTJEL2FhaTdXTzAreWUzcTJkTFJTdEY2V2tXczgwQXBkNTUv?=
 =?utf-8?B?b2R5WmhzdlVEL09XUjZYNTJtRGtsZ3NlQzZYUzd2dlhWK2xqekpZcEgvR29H?=
 =?utf-8?B?eTBGaFR0YjRvZ2xTdnFOTEltSFhSMUw1QUdVSkpmSWNCZkV2Y05jandrZUFm?=
 =?utf-8?B?MmphYWU0S0thdTBHeUgwOUdiSVFlRDFhMkZPalB6NWFaMGdmUnFHSXZRZ2FU?=
 =?utf-8?B?ckZJWGkrVzY5MjBCVFgvS0RPenI0ZGEySHNXaEpzZHdyM1JoSVRFbUxXNUlo?=
 =?utf-8?Q?saja8FoAnNW3MVrKFM/ELFbcA33lc9beTzER6bJ1d4Pd?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56007d16-5078-42c0-6791-08ddc5cc869c
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2025 07:27:17.9855 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mLNLntEJeFOmZNaLszrSyrGiSCtXKZB2gY+7k5Rkhetwnjncd41SObDHz1EL7kjyG4MfzgMzghvTzFuH+LaQkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4427
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

Having registers that can be interpreted identically in a contiguous I/O
area (or at least, following a given stride) is a common way to organize
registers, and is used by NVIDIA hardware. Thus, add a way to simply and
safely declare such a layout using the register!() macro.

Build-time bound-checking is effective for array accesses performed with
a constant. For cases where the index cannot be known at compile time,
`try_` variants of the accessors are also made available that return
`EINVAL` if the access is out-of-bounds.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/gpu.rs         |   2 +-
 drivers/gpu/nova-core/regs.rs        |  15 +--
 drivers/gpu/nova-core/regs/macros.rs | 195 +++++++++++++++++++++++++++++++++++
 3 files changed, 204 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 72d40b0124f0c1a2a381484172c289af523511df..325484ecdaf03d4dcdc4ac2aecc10ca763f442db 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -221,7 +221,7 @@ fn run_fwsec_frts(
         fwsec_frts.run(dev, falcon, bar)?;
 
         // SCRATCH_E contains the error code for FWSEC-FRTS.
-        let frts_status = regs::NV_PBUS_SW_SCRATCH_0E::read(bar).frts_err_code();
+        let frts_status = regs::NV_PBUS_SW_SCRATCH_0E_FRTS_ERR::read(bar).frts_err_code();
         if frts_status != 0 {
             dev_err!(
                 dev,
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index 35d796b744e933ad70245b50e6eff861b429c519..0c857842b31f9ca5d842ee5b1e5841de480d1f1f 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -44,8 +44,10 @@ pub(crate) fn chipset(self) -> Result<Chipset> {
 
 // PBUS
 
-// TODO[REGA]: this is an array of registers.
-register!(NV_PBUS_SW_SCRATCH_0E@0x00001438  {
+register!(NV_PBUS_SW_SCRATCH @ 0x00001400[64]  {});
+
+register!(NV_PBUS_SW_SCRATCH_0E_FRTS_ERR => NV_PBUS_SW_SCRATCH[0xe],
+    "scratch register 0xe used as FRTS firmware error code" {
     31:16   frts_err_code as u16;
 });
 
@@ -123,13 +125,12 @@ pub(crate) fn higher_bound(self) -> u64 {
     0:0     read_protection_level0 as bool, "Set after FWSEC lowers its protection level";
 });
 
-// TODO[REGA]: This is an array of registers.
-register!(NV_PGC6_AON_SECURE_SCRATCH_GROUP_05 @ 0x00118234 {
-    31:0    value as u32;
-});
+// OpenRM defines this as a register array, but doesn't specify its size and only uses its first
+// element. Be conservative until we know the actual size or need to use more registers.
+register!(NV_PGC6_AON_SECURE_SCRATCH_GROUP_05 @ 0x00118234[1] {});
 
 register!(
-    NV_PGC6_AON_SECURE_SCRATCH_GROUP_05_0_GFW_BOOT => NV_PGC6_AON_SECURE_SCRATCH_GROUP_05,
+    NV_PGC6_AON_SECURE_SCRATCH_GROUP_05_0_GFW_BOOT => NV_PGC6_AON_SECURE_SCRATCH_GROUP_05[0],
     "Scratch group 05 register 0 used as GFW boot progress indicator" {
         7:0    progress as u8, "Progress of GFW boot (0xff means completed)";
     }
diff --git a/drivers/gpu/nova-core/regs/macros.rs b/drivers/gpu/nova-core/regs/macros.rs
index 3465fb302ce921ca995ecbb71b83efe1c9a62a1d..0b5ccc50967b1deb02cf927142d5f422141e780d 100644
--- a/drivers/gpu/nova-core/regs/macros.rs
+++ b/drivers/gpu/nova-core/regs/macros.rs
@@ -162,6 +162,57 @@ pub(crate) trait RegisterBase<T> {
 /// // Start the aliased `CPU0`.
 /// CPU_CTL_ALIAS::alter(bar, &CPU0, |r| r.set_alias_start(true));
 /// ```
+///
+/// ## Arrays of registers
+///
+/// Some I/O areas contain consecutive values that can be interpreted in the same way. These areas
+/// can be defined as an array of identical registers, allowing them to be accessed by index with
+/// compile-time or runtime bound checking. Simply define their address as `Address[Size]`, and add
+/// an `idx` parameter to their `read`, `write` and `alter` methods:
+///
+/// ```no_run
+/// # fn no_run() -> Result<(), Error> {
+/// # fn get_scratch_idx() -> usize {
+/// #   0x15
+/// # }
+/// // Array of 64 consecutive registers with the same layout starting at offset `0x80`.
+/// register!(SCRATCH @ 0x00000080[64], "Scratch registers" {
+///     31:0    value as u32;
+/// });
+///
+/// // Read scratch register 0, i.e. I/O address `0x80`.
+/// let scratch_0 = SCRATCH::read(bar, 0).value();
+/// // Read scratch register 15, i.e. I/O address `0x80 + (15 * 4)`.
+/// let scratch_15 = SCRATCH::read(bar, 15).value();
+///
+/// // This is out of bounds and won't build.
+/// // let scratch_128 = SCRATCH::read(bar, 128).value();
+///
+/// // Runtime-obtained array index.
+/// let scratch_idx = get_scratch_idx();
+/// // Access on a runtime index returns an error if it is out-of-bounds.
+/// let some_scratch = SCRATCH::try_read(bar, scratch_idx)?.value();
+///
+/// // Alias to a particular register in an array.
+/// // Here `SCRATCH[8]` is used to convey the firmware exit code.
+/// register!(FIRMWARE_STATUS => SCRATCH[8], "Firmware exit status code" {
+///     7:0     status as u8;
+/// });
+///
+/// let status = FIRMWARE_STATUS::read(bar).status();
+///
+/// // Non-contiguous register arrays can be defined by adding a stride parameter.
+/// // Here, each of the 16 registers of the array are separated by 8 bytes, meaning that the
+/// // registers of the two declarations below are interleaved.
+/// register!(SCRATCH_INTERLEAVED_0 @ 0x000000c0[16 ; 8], "Scratch registers bank 0" {
+///     31:0    value as u32;
+/// });
+/// register!(SCRATCH_INTERLEAVED_1 @ 0x000000c4[16 ; 8], "Scratch registers bank 1" {
+///     31:0    value as u32;
+/// });
+/// # Ok(())
+/// # }
+/// ```
 macro_rules! register {
     // Creates a register at a fixed offset of the MMIO space.
     ($name:ident @ $offset:literal $(, $comment:literal)? { $($fields:tt)* } ) => {
@@ -187,6 +238,35 @@ macro_rules! register {
         register!(@io_relative $name @ $base [ $alias::OFFSET ]);
     };
 
+    // Creates an array of registers at a fixed offset of the MMIO space.
+    (
+        $name:ident @ $offset:literal [ $size:expr ; $stride:expr ] $(, $comment:literal)? {
+            $($fields:tt)*
+        }
+    ) => {
+        static_assert!(::core::mem::size_of::<u32>() <= $stride);
+        register!(@core $name $(, $comment)? { $($fields)* } );
+        register!(@io_array $name @ $offset [ $size ; $stride ]);
+    };
+
+    // Shortcut for contiguous array of registers (stride == size of element).
+    (
+        $name:ident @ $offset:literal [ $size:expr ] $(, $comment:literal)? {
+            $($fields:tt)*
+        }
+    ) => {
+        register!($name @ $offset [ $size ; ::core::mem::size_of::<u32>() ] $(, $comment)? {
+            $($fields)*
+        } );
+    };
+
+    // Creates an alias of register `idx` of array of registers `alias` with its own fields.
+    ($name:ident => $alias:ident [ $idx:expr ] $(, $comment:literal)? { $($fields:tt)* }) => {
+        static_assert!($idx < $alias::SIZE);
+        register!(@core $name $(, $comment)? { $($fields)* } );
+        register!(@io_fixed $name @ $alias::OFFSET + $idx * $alias::STRIDE );
+    };
+
     // All rules below are helpers.
 
     // Defines the wrapper `$name` type, as well as its relevant implementations (`Debug`,
@@ -520,4 +600,119 @@ pub(crate) fn alter<const SIZE: usize, T, B, F>(
             }
         }
     };
+
+    // Generates the IO accessors for an array of registers.
+    (@io_array $name:ident @ $offset:literal [ $size:expr ; $stride:expr ]) => {
+        #[allow(dead_code)]
+        impl $name {
+            pub(crate) const OFFSET: usize = $offset;
+            pub(crate) const SIZE: usize = $size;
+            pub(crate) const STRIDE: usize = $stride;
+
+            /// Read the array register at index `idx` from its address in `io`.
+            #[inline(always)]
+            pub(crate) fn read<const SIZE: usize, T>(
+                io: &T,
+                idx: usize,
+            ) -> Self where
+                T: ::core::ops::Deref<Target = ::kernel::io::Io<SIZE>>,
+            {
+                build_assert!(idx < Self::SIZE);
+
+                let offset = Self::OFFSET + (idx * Self::STRIDE);
+                let value = io.read32(offset);
+
+                Self(value)
+            }
+
+            /// Write the value contained in `self` to the array register with index `idx` in `io`.
+            #[inline(always)]
+            pub(crate) fn write<const SIZE: usize, T>(
+                self,
+                io: &T,
+                idx: usize
+            ) where
+                T: ::core::ops::Deref<Target = ::kernel::io::Io<SIZE>>,
+            {
+                build_assert!(idx < Self::SIZE);
+
+                let offset = Self::OFFSET + (idx * Self::STRIDE);
+
+                io.write32(self.0, offset);
+            }
+
+            /// Read the array register at index `idx` in `io` and run `f` on its value to obtain a
+            /// new value to write back.
+            #[inline(always)]
+            pub(crate) fn alter<const SIZE: usize, T, F>(
+                io: &T,
+                idx: usize,
+                f: F,
+            ) where
+                T: ::core::ops::Deref<Target = ::kernel::io::Io<SIZE>>,
+                F: ::core::ops::FnOnce(Self) -> Self,
+            {
+                let reg = f(Self::read(io, idx));
+                reg.write(io, idx);
+            }
+
+            /// Read the array register at index `idx` from its address in `io`.
+            ///
+            /// The validity of `idx` is checked at run-time, and `EINVAL` is returned is the
+            /// access was out-of-bounds.
+            #[inline(always)]
+            pub(crate) fn try_read<const SIZE: usize, T>(
+                io: &T,
+                idx: usize,
+            ) -> ::kernel::error::Result<Self> where
+                T: ::core::ops::Deref<Target = ::kernel::io::Io<SIZE>>,
+            {
+                if idx < Self::SIZE {
+                    Ok(Self::read(io, idx))
+                } else {
+                    Err(EINVAL)
+                }
+            }
+
+            /// Write the value contained in `self` to the array register with index `idx` in `io`.
+            ///
+            /// The validity of `idx` is checked at run-time, and `EINVAL` is returned is the
+            /// access was out-of-bounds.
+            #[inline(always)]
+            pub(crate) fn try_write<const SIZE: usize, T>(
+                self,
+                io: &T,
+                idx: usize,
+            ) -> ::kernel::error::Result where
+                T: ::core::ops::Deref<Target = ::kernel::io::Io<SIZE>>,
+            {
+                if idx < Self::SIZE {
+                    Ok(self.write(io, idx))
+                } else {
+                    Err(EINVAL)
+                }
+            }
+
+            /// Read the array register at index `idx` in `io` and run `f` on its value to obtain a
+            /// new value to write back.
+            ///
+            /// The validity of `idx` is checked at run-time, and `EINVAL` is returned is the
+            /// access was out-of-bounds.
+            #[inline(always)]
+            pub(crate) fn try_alter<const SIZE: usize, T, F>(
+                io: &T,
+                idx: usize,
+                f: F,
+            ) -> ::kernel::error::Result where
+                T: ::core::ops::Deref<Target = ::kernel::io::Io<SIZE>>,
+                F: ::core::ops::FnOnce(Self) -> Self,
+            {
+                if idx < Self::SIZE {
+                    Ok(Self::alter(io, idx, f))
+                } else {
+                    Err(EINVAL)
+                }
+            }
+        }
+    };
 }

-- 
2.50.1

