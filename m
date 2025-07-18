Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4813EB09C6E
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jul 2025 09:27:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8724B10E8FB;
	Fri, 18 Jul 2025 07:26:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="mB2jc1Wo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2047.outbound.protection.outlook.com [40.107.100.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0428310E8F8;
 Fri, 18 Jul 2025 07:26:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vi0TpeLwuWcCGqOjxcO8iWxO3olgIBPAbzFPUvGiwqwaZjGOt3MRN0phodQRTdN1dW2yPqVHFTJHJWxpLIOFoh0fqlUPLaTyc6LoCc741v86Am8CvxT88HYY6ai4T8wVU6dum1AbOxVkIdhmamUZK7h3WoBC8tOQgJ+PUBz5GFZT9FYOWBnaw+CYkz5l1djUCZRzqe0AWtc21yHtOPIT8oCsFLncLihm6yCgqkWcayIRmITJIrZD/0k0VG2b7k8JlIwbafNm1+3rKj9fJfCowJXOzyjoIJVss9yau+sq7RuaeVDcI8VKoCaK2fR3N434Mc+ht0eJEUaNYIg1VQm4Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yZ73wf8K9LQTppJFqKtqFgYkfhqDa4fGQYsylgjnf28=;
 b=lTqHYYdHZZfhWAK9QQuSFt5jwl/CkAZRtXRV5Uto6xaoae46I/lB3Cnljwg4L0LKCG0/gFKT9VqpIGt0jub+Ts/TNXgZXuX6OqvELlnVk2B2V8QqPvdpeAxYENsYtmP/9aEZ1/s+WuenhRTjvT1Uh1Nc0TlkKiQhc1VFmbH/DeJOL2YcuM1IrnieNCVlcsrXKfoLgrICy5AHfCgDUFfCNy0OvgmafG9k3PN4sVrCaLFgscFScBpHdB5cWzH8JzXcRSj+N4lv47boqLztVwjY6Lu4+pNY2PuUsP4hm8IQJ5Sff05UyeFOgFcSCLoBb6ggse2sT+bvyZu8XDuvNGtoSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yZ73wf8K9LQTppJFqKtqFgYkfhqDa4fGQYsylgjnf28=;
 b=mB2jc1WoLAP0iYfa3RQPaCrjWFNorcaWBoOCrxhYtsQxMhnVTvllRnbZ0/8IuwuHJln4wb7FIIaV9iUbSAza9qt/fBx5j1+fh+/7G7tIr9pFcEVMVOtRG6CWTKpSztv2FvwnTQ0afHPSIy7E3qUXLqpgJpm3ObuZf7uZl0rf71HoxTRWGu0qFq3eif2YX+dSLaSBfV2lfFtKGxY88ggqraOwOhBQl32C5U9uhVc543goEv8NGNOnoBIRsYJKtTXHdIAwrB+VrPx8kOKI0h05wYqbeloFiDaz2az2xCguwEDiH+sk7JeXRR8bOmbgA1DQ8IYkD8Upl3DnLqZ/41c71A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DM6PR12MB4091.namprd12.prod.outlook.com (2603:10b6:5:222::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.25; Fri, 18 Jul
 2025 07:26:54 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8922.037; Fri, 18 Jul 2025
 07:26:54 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Fri, 18 Jul 2025 16:26:15 +0900
Subject: [PATCH v2 10/19] gpu: nova-core: register: add fields dispatcher
 internal rule
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250718-nova-regs-v2-10-7b6a762aa1cd@nvidia.com>
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
X-ClientProxiedBy: TYCP286CA0023.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:263::10) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DM6PR12MB4091:EE_
X-MS-Office365-Filtering-Correlation-Id: 3edc8cf9-4566-4bb1-0289-08ddc5cc7868
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|10070799003|7416014|376014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TDlvb085aloxUlNVVGhGWlUwbW16OFA4VWhub09KTCtDSVpLcGdickRvdjVO?=
 =?utf-8?B?b3dGNXhMN0hRbndJdXZpQ2pnS2c4UFpXa2NZNFhucmd3dlU2VmlOcjFyMmVK?=
 =?utf-8?B?YUx6dnBxMWZIWHgveGUxQzR1MjhsdlMrdmJDd2owMjV3VzFxczhyVkN5algz?=
 =?utf-8?B?RWtxM1pGNlJGY3lpbzJwcTVhbDBYcE9maVpKTzNJY0E3Y0VhdlA3VHhGamlk?=
 =?utf-8?B?emJjUnI3SjFqWk1RbGhOWVRlaDlSQzQvdys1Z2tVaE5JUnV0amEvdWd0d1ZR?=
 =?utf-8?B?c3JZK3RsakxyaE45aTE4bzJPam9icTdtUWRJdnJMbS8ySWZBY3FseVRmTURW?=
 =?utf-8?B?dWk2UjBQLzAxcU9oU21UMk9oWXNjRHBiUlQ1Z20vc25nZ1dXT1NMakJGaDBU?=
 =?utf-8?B?THZDRmJTT1o1cU9FTFJGM2IxcURyNDNxVlFsTUhZWHRmNjI0Vks1clBPZ1NI?=
 =?utf-8?B?K3J3YkdsVGw1Y2ZCdnJ6SDViYkx3VmVBVTBlamdVNzJqbFprTWVUUHZGczhr?=
 =?utf-8?B?V1FJSFR4RXNSb3FPdmg2bnhVWFJIQ2dUUjdETGFud0hZU2NrMWVlYml6Tnl2?=
 =?utf-8?B?OU80Y2MyYTAvS29sRlJmbmk1cThYVEJxT2VCN2xkcjFjWkdibG8xbHFsSGI0?=
 =?utf-8?B?MVNUQm4vRUIzenVxeXFBVEgvMDRuVnluSURTQkFjMkxBT1VGNmRwVTZPd0tQ?=
 =?utf-8?B?aG1KcW0vTDFpOFdSVnFGMzgvbkR4WXF6ZGU2dEMxNkZPYURzdDU0bjlHTjNw?=
 =?utf-8?B?YzRmZnJZNVJhOVRudG1JTnBsaHpuMUtXZnpPTUxHa0owNFV0Rk53TEUwMm5z?=
 =?utf-8?B?aUFiZjFXemRsSHk2amk5N3FEd3gyVmZUK1lQejVUeWFPYlA1ejNzTnVac2V0?=
 =?utf-8?B?anNOU2VqbmRyazg2UDFBWHZUTFR0dUtyekVkRk1NT3EyQm41cWlQMGhqeXhZ?=
 =?utf-8?B?VlVPUzViMjZSbWV6OGFPNUN0VXlHWnlhcDhJUG8vUmlKdnBFOFVuN3BRd3gv?=
 =?utf-8?B?clFRaEhtbEY2b2k0UGQrOFNYcEJkZGs5bnlQcFUzY3RIbUJ0VFpOQWJLRTdT?=
 =?utf-8?B?SGJjT0RyakR4WC9XbTZYd1h1YlJ1cU5IT25pY1doMHo0MEQ4T2Z3VlRIM001?=
 =?utf-8?B?eEkrVm4yUW80UXlTTnZOUzNIWU5MYlZxelVNcC9mMHpsdDBNcE9NZnFHQmpL?=
 =?utf-8?B?NUp0WEdCSFZqNy9ab2kxbmlranRrM3VodnV1ZkhNOURUQ0VnUFlqeFMyaVlz?=
 =?utf-8?B?M2s2UTdBbkw2NldXUHlpOWUrR3VEaWdmZEJxdmZlalptcldWdXdma2JLYTk3?=
 =?utf-8?B?dVhWQXRCWm5RODAyb2UxNEtzOVRBOEdGNGkxUXgrMkFaSGNidm9ZOFhkNVkr?=
 =?utf-8?B?ZThVbWNPNm5zbkZVSnMyd3kvanpKWHdQL09aZ1hRM2xVdDh2QWxwdkJDMXNL?=
 =?utf-8?B?QVRsWU1QS0JkczZFMG8xZ0xtVlRBYTB0VWQ5d09rZWRMYXFRbkoxZjBvbHJV?=
 =?utf-8?B?Y0VBdVVlQTlRNUJEb1RHZUlLRS9hME5Na296L3JZZWpib05QMGU0WU5wU25x?=
 =?utf-8?B?S3RQR0txaFk1aGFNUldHc202dVhzcmY1c3pEV3RPK24xbFNqazdJQUlVWXBw?=
 =?utf-8?B?eU8wSlp4d3d3ZjNkZmV2WXd6OGlHajVQeDd5NjR2eVNiZCtQMldhWGxIYVJm?=
 =?utf-8?B?YVJYNUwrT3V1cFlPMy9BTVg1RUR2NTUwcndBdFVTNWZJYjVvZ05QVlQxK25t?=
 =?utf-8?B?cVIxcmpaUU5MK3I3cHVzTy92dWozNFdONGVXbWM0LzlHaVYvbnBzekN4TzdG?=
 =?utf-8?B?bXo4cHdENENJMTVUWlpwSms1T2ZaMTQwbVM4VXhxMEpHdG02WVlYWGpNZUk3?=
 =?utf-8?B?RnBiM3gzZEZlYWVsNUxjTmMrVm1MSkJLamI1elJlVjJ4QVE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(10070799003)(7416014)(376014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WWt5UU02QWFIYlZxM2Q2dy9JTGh0RzFleVpjMWR6QTluQk1naFVRKzlsejAy?=
 =?utf-8?B?SmsveHYwTXkxTG15NTNuZnlGMzJFbjkxdnBPSWYxQldPTUI0eWZvNWNXWDB3?=
 =?utf-8?B?UDJjTXZzY2Q5N3N2TVgzaUF6cDM3ZW05R1QwcE9sM1BUVlE2K01FT1lQUzQz?=
 =?utf-8?B?d0NYcEtNNFcwTGpnaDhKZnlOZXh6MG9LN2tIeUNvcFZUV1lsUWlpTENPajZR?=
 =?utf-8?B?T05Ea2kvWXhKaEZpcWZtcjlHblowK1A4MTQ1MkpDbEpweWpWQzlBMWpKQXJV?=
 =?utf-8?B?ZExJdStsTUVNbm1CUlZuN3duT2dwaFVjRHpqUU5PL25VTWhuUTV4aDVpYWVX?=
 =?utf-8?B?ZWphcWpUcWtFWWNMQW9uQ1RMZkIrdTdGRFhBUHA2WWl0T0VLTE9yMXo3bUNY?=
 =?utf-8?B?MEZPZHBQeFkzbnBvOFpBRHU1UEYyM01pSk5XTmN0Q3FPL1BjYXgrbFpPODVR?=
 =?utf-8?B?cWRKQXVFUXRLdGNiUEduelRmT2ZuQVNmcW9WQkN2bTg3eDNTOVhvekh6UGNt?=
 =?utf-8?B?eGs4T0VzbHNSU0VZZEdsQUpPY1ZIUlE1Z2VmZTNtMlMzaEh2WXY3eUYxL3VB?=
 =?utf-8?B?NkZoZkZNV0tDaXllL0l6TUZ5UVoyZmFrclU0aHA0bGhpaEJZSEhxcWNIM1dO?=
 =?utf-8?B?RXpUbGRMc0U4UWFWa0JzOGJDTHpPOWh3UnhtMTYyb0s5aXVFWmpZWk5DQlM4?=
 =?utf-8?B?MkF4YUFVZmU5MHh3anQ1ZGFNdzdJRmRta09rTzF1NHpDekpZWjFFU09qT3dC?=
 =?utf-8?B?MW05d210OWN3SnpXcS82dTMvcVhWRFNhcHBYUlJkUmVTLzFpcXZiZkI4Qlly?=
 =?utf-8?B?K0V3c05IZngyMlVFclNqOE9oK0tnUndvU243T3MvUW5BZGRMU2MyZGhiZFhT?=
 =?utf-8?B?VFBXNFBnUk05RDk0OVVuYTB5NU5Qd2RWWEsxOGJFaWgzK1VCU0Z0NHl0ZlNK?=
 =?utf-8?B?eFh4dzA2Qm5QY3VKc1hGNnA5cHRjTGo5UEtIYVA0Ykh3UHdSSnluak1Ickdu?=
 =?utf-8?B?WmttTC9HU3JWcktKazlnSUVDcWkxdUNiaU5JZTc2ZkpoWG9uNm5ITVpOaGhu?=
 =?utf-8?B?RVAxa1ROUGJJOGxlQ2MwZmFUTGZqNDRhRDFwL3RjTWwrcUJJVU41N2xhNy80?=
 =?utf-8?B?WlRiN2tGWmwyanRPTzlrSEdLcUlBblhXQy9hbEpvVFlCTXBPRHNkOTVTS3dT?=
 =?utf-8?B?OXhWbWxPaTVkZmhmQm5KNlJWRlk4eFZsbURVOVAxSjgzc2M2VWZpYVBYN3Fv?=
 =?utf-8?B?bFdnNlAxZ3VrVVNNYnZHTUd6RE1STEY1b2QwV1VNQ3V4V0ZxWmp2UC8rb2U2?=
 =?utf-8?B?bFhLdnBSQ2FUVXh0NVZwcVdibmtzNjYxdWUxb1FKNDIwKzg3cnBEVnpEbW5J?=
 =?utf-8?B?WFRabTUzSHVpaHhjU3NndHc5WVJQZGVvSXpXNktGVUdDb3U2aW1RdktiSVB2?=
 =?utf-8?B?M0E5YVFaeCttV09ERUlwNVdQdWNIV0p1S3Z2TUpjV2xZcjN1ZHJFY0F3by9t?=
 =?utf-8?B?ZXRzUklTNnkxNms2eC9QTjZCQjlrWDlZbEtZd3UrZHpZaHVpM0cydjNqMmJa?=
 =?utf-8?B?U3ZuTVhGY0xJTW1aMkRuUXo2MGhKR1E0c1d0dUhuUWRaWktqUW9uZDRvclhp?=
 =?utf-8?B?NzRhNnloVGU0c3cxK2grQ2I4dG9DN3JBdUhLRCtmOFhxUVVyTERLbUYzQXhE?=
 =?utf-8?B?OHNQMkhJRXBHNmJsU3FYYlI2bEd1MjFUUlNPamZsMFU3OEhaLzJUV3dORWI1?=
 =?utf-8?B?RDF0NUtzZ21VWmtBZjUrOWFIeE9ja05MUFcxb0ovTjZ5TDdYd0VoRTJMTGhW?=
 =?utf-8?B?UDd2bWZiS2MxTDkzOTVsdlc3Q0E0VDhHU2V6MTFGdmgvU0s1czZ3TWZyU3gy?=
 =?utf-8?B?dWUyM2krSk1OdkhzbkJTMGxnbGhFUFdsZmRoajBwY3Erd0JSOWZqbXhMTmdN?=
 =?utf-8?B?cjV4TmhPYjNtK0JQNXNrM21xTWlkSGViWFNoQ0piaXdPUUpRNlMyOTBCSGNl?=
 =?utf-8?B?QTVoYm81L0wvQytiZzU3REtGNGd3WklqenhVUDhvOGFQQ09aWlJ4WVlZU2Zu?=
 =?utf-8?B?RHRBaTU3dEFKOEZhcW1lNXd6T1oya3ovbkRYNWZ2NVZ0RXA4M1htTE4zcVZK?=
 =?utf-8?B?ZDE4bjFtcy9HQllWU3ZzdTBaWERIb2FEREN5OFIvdFNnbTA4TkEyd3Q3ZFhG?=
 =?utf-8?Q?13XJnKvZ3Hu0HFD8ZWfolk5ct7Z4KYaeyrOZdxQ4yDXp?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3edc8cf9-4566-4bb1-0289-08ddc5cc7868
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2025 07:26:54.1539 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W/2Uaec+y8eY9VrwnqjQMcuP/ZNmu+3OZTz/eUU4cXXoWdllaB4blhSGdhqGICty/Pt2fjDQyCZ5l7Ql2k3ctA==
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

Fields are complex and cumbersome to match in a rule, and were only
captured in order to generate the field accessors. However, there are
other places (like the `Debug` and `Default` implementations) where we
would benefit from having access to at least some of the field
information, but refrained from doing so because it would have meant
matching the whole fields in a rule more complex than we need.

Introduce a new `@fields_dispatcher` internal rule that captures all the
field information and passes it to `@field_accessors`. It does not
provide any functional change in itself, but allows us to reuse the
captured field information partially to provide better `Debug` and
`Default` implementations in following patches.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/regs/macros.rs | 42 +++++++++++++++++++++++++++---------
 1 file changed, 32 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/nova-core/regs/macros.rs b/drivers/gpu/nova-core/regs/macros.rs
index 0a18a0d76b2265d3138f93ffc7c561b94bca3187..8b081242595de620cbf94b405838a2dac67b8e83 100644
--- a/drivers/gpu/nova-core/regs/macros.rs
+++ b/drivers/gpu/nova-core/regs/macros.rs
@@ -88,37 +88,33 @@
 macro_rules! register {
     // Creates a register at a fixed offset of the MMIO space.
     ($name:ident @ $offset:literal $(, $comment:literal)? { $($fields:tt)* } ) => {
-        register!(@common $name $(, $comment)?);
-        register!(@field_accessors $name { $($fields)* });
+        register!(@core $name $(, $comment)? { $($fields)* } );
         register!(@io $name @ $offset);
     };
 
     // Creates an alias register of fixed offset register `alias` with its own fields.
     ($name:ident => $alias:ident $(, $comment:literal)? { $($fields:tt)* } ) => {
-        register!(@common $name $(, $comment)?);
-        register!(@field_accessors $name { $($fields)* });
+        register!(@core $name $(, $comment)? { $($fields)* } );
         register!(@io $name @ $alias::OFFSET);
     };
 
     // Creates a register at a relative offset from a base address.
     ($name:ident @ + $offset:literal $(, $comment:literal)? { $($fields:tt)* } ) => {
-        register!(@common $name $(, $comment)?);
-        register!(@field_accessors $name { $($fields)* });
+        register!(@core $name $(, $comment)? { $($fields)* } );
         register!(@io $name @ + $offset);
     };
 
     // Creates an alias register of relative offset register `alias` with its own fields.
     ($name:ident => + $alias:ident $(, $comment:literal)? { $($fields:tt)* } ) => {
-        register!(@common $name $(, $comment)?);
-        register!(@field_accessors $name { $($fields)* });
+        register!(@core $name $(, $comment)? { $($fields)* } );
         register!(@io $name @ + $alias::OFFSET);
     };
 
     // All rules below are helpers.
 
     // Defines the wrapper `$name` type, as well as its relevant implementations (`Debug`, `BitOr`,
-    // and conversion to regular `u32`).
-    (@common $name:ident $(, $comment:literal)?) => {
+    // and conversion to the value type) and field accessor methods.
+    (@core $name:ident $(, $comment:literal)? { $($fields:tt)* }) => {
         $(
         #[doc=$comment]
         )?
@@ -149,6 +145,32 @@ fn from(reg: $name) -> u32 {
                 reg.0
             }
         }
+
+        register!(@fields_dispatcher $name { $($fields)* });
+    };
+
+    // Captures the fields and passes them to all the implementers that require field information.
+    //
+    // Used to simplify the matching rules for implementers, so they don't need to match the entire
+    // complex fields rule even though they only make use of part of it.
+    (@fields_dispatcher $name:ident {
+        $($hi:tt:$lo:tt $field:ident as $type:tt
+            $(?=> $try_into_type:ty)?
+            $(=> $into_type:ty)?
+            $(, $comment:literal)?
+        ;
+        )*
+    }
+    ) => {
+        register!(@field_accessors $name {
+            $(
+                $hi:$lo $field as $type
+                $(?=> $try_into_type)?
+                $(=> $into_type)?
+                $(, $comment)?
+            ;
+            )*
+        });
     };
 
     // Defines all the field getter/methods methods for `$name`.

-- 
2.50.1

