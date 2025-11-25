Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58C60C876A3
	for <lists+dri-devel@lfdr.de>; Wed, 26 Nov 2025 00:04:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0302710E4B2;
	Tue, 25 Nov 2025 23:04:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="IRUAtEX3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11012046.outbound.protection.outlook.com [40.107.209.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A352710E4AE;
 Tue, 25 Nov 2025 23:04:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ncAWxVlI1uq42XlTHEuutkZ2CyPmCz6mMFRCpLOT1NU+wTSbqhP96WaO8yEJ6e2hHPi/EV/DuN+VCNalHdXTr7/sUJiobjfymSUYcZaauocg8UpBEEfO33a+FTACmRmGizUYk67Aa+hDqn6z3O+lHHqD3St0ui1RInfzsOj/cALPjm8QDn9uphcy25j1muW21g3mWgziJpA+XSxtfqXrrTIyh3d/KdV0oxqfH6jQjctt44g768usRdMOH+ei5TFSe1GkmIg3Jg5/n0ehXBN2J+hmHsB2pek5tblxFjrDiohdZpxRFeq7A17NapPqT6yeZgX6Wm/2ywrvtdbm0j9IRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sl76G8RzRR6+BVmj2HbLUBqIwZDsXQbK4HeU2vAWvS0=;
 b=u8Vs9iF3kNxY+B9noOwI37VAPPt8JjxhxmBA8c93UZshfZk/pU0TARi03wrOpF9/7JswflV+Rlvg2tkowk31CuQm9L46iq6ku5g5B2uQ26+n+aSSnI3hZRt+OI3yins0d5YV8ZBXbct9iykn2WYSipwXoNbB5IeFVwlYd/mMIVeG9t1cYc1jIPz/KJtCianNbNVGZNt/FGwYD2r8tt5EEBWZoIXv9r/Wsyk/60I++w0mAxjWedxLy2v/dydGNzuS3OO1wg9D3eo6PEKo+3q5uWvbuiD+4gAVFCSL6edByenMYScwxEUfeSF9lS9lh+jwwq5gR/WiXuurMJLvxrG0dQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sl76G8RzRR6+BVmj2HbLUBqIwZDsXQbK4HeU2vAWvS0=;
 b=IRUAtEX31au1uTBsW1WoPeCo7yRaBMq8PDnmaDdclrCU/vSy5VU81FwtxvIW600BBeYmT2k0VvyQn0OB4kaN7q2L3p++dMzfOceSUa3JDsJZc3lykS41vdYCKPMLjRj6pkLkgdpZ9GkIQMj1Gk+41fRgKGosk5zQ+prPsMXVAZWJK9JXbqgnadUko2Czk+c5hi81lNcUz+vy6JjnjBHGztZko4KOdr+oVsSEHElOlEd+rz3fLOl6XXklG2+Pc4J17ENklC3TWidKBlulzhC5GPdDIz5Z+bViIzMyzFL0ZyO+XHs8/8ARWii/Rqff4dILpBa4MWjWudidweL9N0pbkQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by PH8PR12MB6675.namprd12.prod.outlook.com (2603:10b6:510:1c2::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.11; Tue, 25 Nov
 2025 23:04:02 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9343.016; Tue, 25 Nov 2025
 23:04:02 +0000
Message-ID: <fc3553f1-ac3d-4af0-9b2e-dd440ad6d3eb@nvidia.com>
Date: Tue, 25 Nov 2025 18:03:58 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] rust: clist: Add basic list infrastructure and
 head iterator
To: Alexandre Courbot <acourbot@nvidia.com>, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
 dakr@kernel.org, airlied@gmail.com
Cc: apopple@nvidia.com, ojeda@kernel.org, alex.gaynor@gmail.com,
 boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com,
 lossin@kernel.org, a.hindborg@kernel.org, aliceryhl@google.com,
 tmgross@umich.edu, simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, jhubbard@nvidia.com,
 ttabi@nvidia.com, joel@joelfernandes.org, elle@weathered-steel.dev,
 daniel.almeida@collabora.com, arighi@nvidia.com, phasta@kernel.org,
 nouveau@lists.freedesktop.org,
 Nouveau <nouveau-bounces@lists.freedesktop.org>
References: <20251111171315.2196103-1-joelagnelf@nvidia.com>
 <20251111171315.2196103-2-joelagnelf@nvidia.com>
 <DEGM8P88O2MV.3D4XL17AMWHJ4@nvidia.com>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <DEGM8P88O2MV.3D4XL17AMWHJ4@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MN2PR15CA0009.namprd15.prod.outlook.com
 (2603:10b6:208:1b4::22) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|PH8PR12MB6675:EE_
X-MS-Office365-Filtering-Correlation-Id: d1f2226e-7a45-438a-20fa-08de2c76ecfa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YUFWa2prVCt6YVlwdWY0WGd2Y2FGdGV4Yit0UGh6MFhwWXN2ZitBcU1sbW82?=
 =?utf-8?B?L2VGMS9FWFNnWHpOditMa2ZqN2loSnpIYmtCaDNoWHZ5MTJKa2tnUk5POEVo?=
 =?utf-8?B?ZVpYNUV5cUQ2N0J4OVB6RFBkOWI1NDlKdUVYeWhlNGliVFArcFZNZGEwQ0Uz?=
 =?utf-8?B?emh2VmVCT2JXNlRjSUNvWXNzdjU0em82T0dodm1WMlpSblgzY0xJSzNNaDBF?=
 =?utf-8?B?Mm1XQWtiZ0I5VUhVMHZuQ21wQXozSFVJRDg0S25pKzM1Zmc5TTBBdzhuU1JP?=
 =?utf-8?B?d0NwSTUvY3oxRVpORjRCMjBDL0h5ZE1yL3VqcGV6TGNwdzV1cHU2K1d2K1pw?=
 =?utf-8?B?Ry9yTlNidkdEdmVFRndNY3d6bGlrazZjOXJ1Y3N0VGo0MlJVSExDZW4xZXNi?=
 =?utf-8?B?OWo0Q3FsbUQ1cjhsb25xQ0pKZ3VjZzFmS0FhV3JiN0k1MGFwcHg3eU56OE8w?=
 =?utf-8?B?MjRrM0FoZFM1NUpYZUphUjhHYjlaMEUwdlRlL0JxZkpKZThWa1l3VDFzcFBv?=
 =?utf-8?B?bmVLK25SRWZBUm0wYS9XUmJLb1VkRkh3WmhXZVFzeE8rSFFHVnpRWkIwb2hY?=
 =?utf-8?B?YXNtSjRNUXEwamNkZGdEbVhPazQxSjNQaG43ZC9xenVldFdGQ2lCZU1BK3BO?=
 =?utf-8?B?bzZkMVA3MDNlOTZsUTBnNDJpcURPMHdXY0pUUlRMNENEMVFyR1h1UGtKU2F5?=
 =?utf-8?B?a2V3UTd1Z0ZtdWVpelc4ZzVueXBkZ0dhdERjUk5NalJPM3V1SHlocURCWWFs?=
 =?utf-8?B?V29DemFhNUtrY2wvZEFZOEFuK0lmYUhTRzJRY0hreDlJY1JJbmpHU3NyeGl0?=
 =?utf-8?B?UlY0V2o1MkhYMXJEUjlQcWx2RU1jQVBxSjI4RmJmWnJLT1VZbk9BREdWWVpv?=
 =?utf-8?B?eGxqTWhDeE5pQk5aeVprT3lOQllFTTM0NGRyaWxQdkVKWFlGdEpLenFZdm0y?=
 =?utf-8?B?bHJCdkE0VElqakVwbkxDcjRnUW1kaDNiVERTM3lUd2hIQ3pDUEducVZOQ0ZN?=
 =?utf-8?B?dmtDSmJKUHZ3UEhHUklBRVY2MjQ0USsydUt2aThveTVLNHQrcjJMMjdOMGdN?=
 =?utf-8?B?SVk5NWxlY0pUa3ZKZEt3aFhTOFdXOUVxMEFBQkczb0VQKzBYeWN0NzJTWWdr?=
 =?utf-8?B?THhzRjJEaDFIdUdSelRjOGxldVZ1UTVvZHpGeTVKcTBzSXlxeW9NNE9MS05Y?=
 =?utf-8?B?N09wT3NDQWIxYkU0MktVQ1dVWmhjNGtQclNVV2ZLQ0JKN3FRdkd0TEd3cnJo?=
 =?utf-8?B?d2VWM1UvMGprbU9YRDFKTGFRMk1MR3FLb2kxellkdXRMWCtyd2ZWOUYrRHJY?=
 =?utf-8?B?SnkxRjc1cS8xKy8rMUxNMkJKUkRwcTZzWTdaZXYyOWVHaEgrZzVFaEo1UExI?=
 =?utf-8?B?cU1IOGlodnhQNW1IRW9heUVEVGdER3YyeFpYUUNVQk54TFFaWHN4cWU2eDA0?=
 =?utf-8?B?YXcrc2pLZDhJckkxbWVYWTZRTzhpRXJWTjJ1T0lYTS91eHFWRmFhbVdaUmpC?=
 =?utf-8?B?VzJweEZIa0ZreThJUmE3eXhLcGJVamhkN2c3eXllTHphVTdTRVN4d2N5aDQ1?=
 =?utf-8?B?dVc5aHRXSGVCaFVEV2ZPSmRtVnJ3dllxTERFNDBFRkswMXBZS0tNZTk5ZUlw?=
 =?utf-8?B?MzM5a3dTdFpTWUk5eFk0azJVYVo4UkxDMlIrK0JmMWNpTVlLaHE5eFBsZ2Nr?=
 =?utf-8?B?K0pKV2pWdTZlWUdyVmJzQnVIajNNMmI2aWx4KzdBcFcvalpDTFF4N1pOV0RM?=
 =?utf-8?B?VEwwYVlQVmpleXhnLzNSZWZ2ZnZjcEY5NElzcUkxcnZzUHN0K3RYcWtWUUNR?=
 =?utf-8?B?YnJMRWJOK1RFVmR5eXQrWkgwZXpMSmcvRGtwY0NLaTZDcVNZY0hsOVpwVGJj?=
 =?utf-8?B?bkdpQU1JWlJLWThoRWpPSHMybU83WnhYdXB0N2hldTRRRjJWVlBDNlFQclFP?=
 =?utf-8?Q?kr4i2xBDfebHAwMJkPXeDN+Tm8Nl38vr?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SkJ6SElaM2lUTnpWSDRSaFlrVTlWRHk4S01CRzBEbHRVb01MN1lLWWZyQXZC?=
 =?utf-8?B?VjFTcWxsaDJWcUtlR3pvOWh6V0t0T1NFU0xBeHVYSlg0c1JEZ2d1bmJhV1Rp?=
 =?utf-8?B?RHREVzVidXFkTmtyMVFwM3JteVZoSVU2UWRjZnY0UFNSMmhWL1M1M1BIUUZM?=
 =?utf-8?B?L2ltakJoUGV5Mjd0ZVcxTW5PRTJkZWJSWHpLYkFTcUZhbUJnWmh4UXJHWExq?=
 =?utf-8?B?cEUrb1dNdlF4K0RQaWZqeFZESVdwZ3ZsUFlmdWFKWFdhM2x2OW83Tk5ybTJs?=
 =?utf-8?B?cjlSOUNqMmVGbmdQc3AwSHZDRmQ1QVRWRC8vV1JwTmpOT0w2SXdMYVdtRVRH?=
 =?utf-8?B?cmFzODBhNDJJQlNaUFZQMG5tVDdtVS8wMk9YK0toZnUvRERhQzZKTjJERUNX?=
 =?utf-8?B?YzBGMy9kQU5Pa2dkV2V3NUx3Y3VBc29yU0RzM3lwRTNOY1RSc1dvRjY3dlhv?=
 =?utf-8?B?NlE2SUlzR1NNWGxnMFZuaDNjMjVheFB4TGdvVlo5dE5QNEY3OUN6bmYvYyt0?=
 =?utf-8?B?UXdkcEhOMi8rSkZkRWRlRElxYlp2RlY1M3ljWEJMek1DeWNGT0dzQ3RJMmsz?=
 =?utf-8?B?WFZyMEpGU3dhZVFVUUg1NG1uRVJWUklCVlFQSXlMaDRnMmpSRXVqTWw3bnlv?=
 =?utf-8?B?QnJ1RWZEb01nblVOTUd0c1hKdjZvcHR0dGFMTUpkYlMxMEU3dTlKd1NwUis1?=
 =?utf-8?B?RWRXdnk0STFXRXdKcmZVK2VIelkvWHBNdHJ0QXFuMFJjelg5NHVNOGc1TXBU?=
 =?utf-8?B?bFlpVFFCWU5VMURRSmtIZHBFMHFjYTRTNTZsNDl1U3hGSWN2aU5HUk16N0ZK?=
 =?utf-8?B?YWNBM1dVdTNDVXd4c2NERWdqRXVIZDMxR2xpem5lSEFZVy8vbUhIM1hNMzhq?=
 =?utf-8?B?ZFRsMFhHVkx4eHNyNzNwU0MxMTRSOVZ4Rk9UZkkxQ3lkbnlVTmtyaFJTZHdB?=
 =?utf-8?B?SlpncHpQdXpaVFp0djMzRG9Eb09vS0dHdUN3ZTZrRDRFSStxS2FNMGt4Z20v?=
 =?utf-8?B?bUx4dEVJRWRGVVVyOEczSk1JeEU3OGVyVVFLV2dCTHNPYTVGZWZWbVVPc2M0?=
 =?utf-8?B?TzFEaWRxVUoyY3d5QWFaUGc0aExKelQ3UVkzOGFQbXF5c1Q2eUdyVzRFc0Fn?=
 =?utf-8?B?RzJva09rMVZQai9ia2RVTTMrVG9Zd2FUa3BRUFlqYUZDYnZmVnowWGNGcnlP?=
 =?utf-8?B?eldKYXoyejIwdXR2UTdLVElEWnlvZlJzdS84ZWtrbDR1MXNlZFdiMXdGUjhY?=
 =?utf-8?B?Q0wrTGhnSWtXdXNwOEtsd2NYMk9sWkozVGhwSTZxUlRuQlVuZjY0NzdlZk9u?=
 =?utf-8?B?aVdCcWxCSE1aRUFFcHJxK21pTUR4ZW1pU2laUWkrMnd4UDR5ajFXTmFGL1Zu?=
 =?utf-8?B?dVpFQU5Ua280MDcwWXkxMUNlT1J5NW1JQ1l5ZHd6OUZqVGduZGgyTVUyUEtI?=
 =?utf-8?B?eko1bVI1ckR2TGVVVDA3RUdEVlROYUE3ZnpPYkIycCs2ckVLU0xsTkt2VkV1?=
 =?utf-8?B?S1BQc1FnOGp2Q0piOVV0VDN6QnRPYWZZd1p0b3V1Zk1jSEs5Y2xmUllaL3kw?=
 =?utf-8?B?RmZHaVBLWi9GazNPWnJ5QWlxeitNVWpVSmlVaDgyRko5d281YU9NSzVBL1c2?=
 =?utf-8?B?MlpmSlN6Q0p3d3Z1YTNJdHhCd3duamN1cFl0dHhPTEY4ZWhzVkduZ1d5dENR?=
 =?utf-8?B?VnphSmlsaldlUkxoQnhUbDNjd2dtTG9lVUlUK05zRzZWY2tKcmswVURIQTVu?=
 =?utf-8?B?OTJtQnQ1VmdsMWVVdlRXYUU1OTFuMVRxRFFzczZQbUdDZmsyMlJSeGR1UXVz?=
 =?utf-8?B?MmdJYWJQdFVUMnU5RTYyVUtSV1MybVJaYWY4UlNveXc4bWYwRmFSanZBajJM?=
 =?utf-8?B?MlR3UXowRFY1di8zTjFCWFlJV0UzeWNvdktNejlRd2ZGMHVvNW1nTFVGazl6?=
 =?utf-8?B?QXpGZnd2dHNHMkVsbUVLRCs2enZTOHEzUFFJUlJBK1lKUGRnZmw3aW1IY3dq?=
 =?utf-8?B?b2VYTXBtMW5tMVJZQVVsMjdpOS9BaGxKRjkrakN6SlNwMW1GblVHUlVyaVpa?=
 =?utf-8?B?eWZLZDNFTk1DUTluREFLSmhyNHU2dFNWenozZ2QvL1BRUEFUY25ZajhoVG1W?=
 =?utf-8?Q?Ehl4liNcbTRV7XcsxgaekzPKW?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1f2226e-7a45-438a-20fa-08de2c76ecfa
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2025 23:04:02.8305 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WFYwaYmuC0UUG9figCDRAx5qn/AzflFBObWVgzdePKDK0dD+e/r+M3fWvD5yONDLTivWp45hUPleHqOCcr3N/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6675
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

Hi Alex,

(I agree with all the suggestions, I will reply to the ones where I have
comments in a few emails if that's Ok.).

Replied to one below:

On 11/23/2025 10:47 PM, Alexandre Courbot wrote:
>> +    }
>> +
>> +    /// Check if this node is linked in a list (not isolated).
>> +    #[inline]
>> +    pub fn is_in_list(&self) -> bool {
>> +        // SAFETY: self.as_raw() is valid per type invariants.
>> +        unsafe {
>> +            let raw = self.as_raw();
>> +            (*raw).next != raw && (*raw).prev != raw
>> +        }
>> +    }
>> +
>> +    /// Check if the list is empty.
>> +    #[inline]
>> +    pub fn is_empty(&self) -> bool {
>> +        // SAFETY: self.as_raw() is valid per type invariants.
>> +        unsafe {
>> +            let raw = self.as_raw();
>> +            (*raw).next == raw
>> +        }
>> +    }
>
> Does this method also apply to non-sentinel nodes? If not, should we
> move it to `Clist`?

Yes it does, will move it.

> 
> I am also wondering what the difference is with `is_in_list`. If
> `raw.next == raw`, then on a valid list `raw.prev == raw` as well, so
> it seems to be that `is_in_list()` is equivalent to `!is_empty()`.

Yes, this is a good thing for me to refactor. We can keep is_in_list() in
ClistHead and move ClistHead::Empty() to Clist. Though I would probably directly
compare the pointers instead of calling is_in_list() because it seems weird to
check with a sentinel list_head about whether it is in the list :) After all, it
IS the list :-D. I will rearrange it, thanks for the suggestion!

 - Joel

