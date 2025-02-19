Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF951A3C993
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2025 21:22:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A506810E88D;
	Wed, 19 Feb 2025 20:22:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="s4AB59/s";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2046.outbound.protection.outlook.com [40.107.102.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EC2510E88A;
 Wed, 19 Feb 2025 20:22:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JSqWqNljzZ6bdnfWuT12wX7nqVnb/dIxQnANdP87X1ZSNVqRspWYGSAG+nlyCA3+YC2VtKsFQgFt1cIjkzOBxYwYFT0rGI/2SCybQhDHKcwTOscfzW33xXPfoGr+SIZXoBFhn+J7SiXvnTcVI4mTrDVVOObof/oTOYUXqDiWrsUpRmPDeMQMCmul/4LFlYekwSSxMQyZscGseZsGStNhgxGqATDkTM6Loj6vf/Ifl1TXvp9/MzNEh/mN2Gw/Ggv1jlhUZod3gKPNqOsm6CtTsoEO4aIXSRQcirFO3gtNanDZ2Jm9B6mpNHho4Rs5/LiAycdh67qa5AU/UFIWu7RmoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F6MSJtJqvLoOXeotHnk+XpOJ1zDkE4kMnZxPKMs5tGo=;
 b=YsPIFqsUvHRYM29UqQMNXhd4c8FViCQsRJyhF4eAHRQvAlhPWra4Ml8pUFIsVnK17rZ1DcfrPbthWdaNQocwf8Zq0i6ITbjgj9v25qSeYnD9l6lW1go4I2Li628Uk8DJekZv+/aeOxT8XuucMGkkvrzmHbJDfyiiURNNXwEuAprn1FheoDwoHRh5xS648A6E0ciyvWMQv/3+252pK1IJP9FU+wak4HvAwVQqf5SphWoRfqUYt6wVMoNS9KU3v6WpSsTGtj4B/tgn10AF+gHfDQnNWgrmqBHtFEI+SMECKOdckUQZTNSsr4ihh0EQ38bwKA7vrjY01rxcQDNJK7I3hA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F6MSJtJqvLoOXeotHnk+XpOJ1zDkE4kMnZxPKMs5tGo=;
 b=s4AB59/sSBqKzHXaXggF+KjNVqOQaLsXoddBbwP+9oXbJfSamzCkTUJovrckkaVbY9anXVZdc7dYKPmKoA7LTRRi3TxmEuykpRr3JMxBm+tBtLCDyToSAthnwEzDRKJMS59T1SISmJjvW42PdQjKS4f3lWREfjjsEbus/RO4M1T5/P292TwIr787f913y5pcejQXTWw3v8gND9OZ0YBzFPAu9rXO+zEx89sl2H1ifaZ1fIRBhtTNysqK7dTp9Y/vPrj7oYqg/jX9qQo4mOEtgH5FgOSuwBiB7hn04ZEBa2yNq1OwjcqqrTC/m5FbgUY1Xhxdm53GXDW4BHScPm3Ocw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5968.namprd12.prod.outlook.com (2603:10b6:408:14f::7)
 by BL3PR12MB6473.namprd12.prod.outlook.com (2603:10b6:208:3b9::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.16; Wed, 19 Feb
 2025 20:22:25 +0000
Received: from LV2PR12MB5968.namprd12.prod.outlook.com
 ([fe80::e6dd:1206:6677:f9c4]) by LV2PR12MB5968.namprd12.prod.outlook.com
 ([fe80::e6dd:1206:6677:f9c4%5]) with mapi id 15.20.8466.013; Wed, 19 Feb 2025
 20:22:25 +0000
Message-ID: <fd920faf-a707-4c6d-8c0b-3d59c010da1d@nvidia.com>
Date: Wed, 19 Feb 2025 12:22:23 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 1/3] rust: add useful ops for u64
To: Alexandre Courbot <acourbot@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 "daniel.almeida@collabora.com" <daniel.almeida@collabora.com>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "dakr@kernel.org" <dakr@kernel.org>, "airlied@gmail.com"
 <airlied@gmail.com>, Ben Skeggs <bskeggs@nvidia.com>
References: <20250217-nova_timer-v1-0-78c5ace2d987@nvidia.com>
 <20250217-nova_timer-v1-1-78c5ace2d987@nvidia.com>
 <C1FF4314-C013-4AE1-A94E-444AFACDB4AC@collabora.com>
 <D7VLMD31YB0V.OKHDSVUPAZTE@nvidia.com>
 <1b8921d46f7d70c7467ea0940d60220f05cccc5d.camel@nvidia.com>
 <D7W119MHCCWH.IS600FTIOV8O@nvidia.com>
 <e6322f90-08bd-4e86-8dad-2ddbd7e5cece@nvidia.com>
 <D7WFP99SMV3H.26AJWK17S0UPX@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <D7WFP99SMV3H.26AJWK17S0UPX@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR05CA0076.namprd05.prod.outlook.com
 (2603:10b6:a03:e0::17) To LV2PR12MB5968.namprd12.prod.outlook.com
 (2603:10b6:408:14f::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5968:EE_|BL3PR12MB6473:EE_
X-MS-Office365-Filtering-Correlation-Id: 1349c1a9-8873-4581-dc01-08dd51231fdd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VDJCODA5VFQzN1ZYMGdUSmZLcGdKc1hKWXFsb0czM2FyYjNmQ1NSRWh1QWNr?=
 =?utf-8?B?KzZFVDBIdk5UUC9RdWd2Yms5WGRSOFQ4RjUwZDRXdXQ2WkVXVEVndS9iVXdR?=
 =?utf-8?B?MW9RN2FRVmlNb2M1Uisvd084NGVWamVLMlhjanA1Mm1iV0RnbksrQ0JPdHFL?=
 =?utf-8?B?TVZ6OTI5TlNRWHE5ZENpNEYrS1ovZ1lUcFZtZTNCaUVsQ2pCaitva3dBdzZL?=
 =?utf-8?B?Z1NHZGJmQWhWcUU0UTl3a1luc0J0bXJCRkxXOFdaNHdGQkdPNXl5dHNSR2Ew?=
 =?utf-8?B?TkFhMFlEY0huZkZTYWR5Y0hpVFVtUnFpL1lWb2c2bHFIUnNyUnE3S0ZFeTRN?=
 =?utf-8?B?NGNGcnNPeTgxU2JhNU0rZUMrZjJZM0pEOHNwbVk1ZmMzbjNDVXlYODZGTEM5?=
 =?utf-8?B?UUdnQVRUaE9hcUtZZWp0WmhHNjJwNnc2dFhsNG85VzRYODFlcEF4QSt4aWVW?=
 =?utf-8?B?dUJINFFvaVhDNElFYk1QMmlSbVNwMTdOdUFxNXltcUEyV2JlTkJMcjRiWlV3?=
 =?utf-8?B?REpVZXBrVlMrdEtQa0tUcnZFVnR1YXNsVUtSbURXQklqQ1lOSmlqbTZ0NUZl?=
 =?utf-8?B?R3lSeGx2VFlWZEEzTDlVN1lxU3lTVGl3NEdWampUTHBsN2dqMmVEY1Y5aU1p?=
 =?utf-8?B?MHpuR2dzVlB3eVlva2ZlcVl0UERyRENieDJrR1hHbEtKaDUwZDBuWUF0SlM3?=
 =?utf-8?B?VWQvWlA1SGZNVEIvR0FyYnphd1JTc2kxMFZQR2FiRE4yTnVyZWZYUlB2VmpL?=
 =?utf-8?B?SUFoOTJJcko1SExyLzgzWERwdjljc3ZlMTVmTmcyRXV2eW1KbWZGWW00RFVl?=
 =?utf-8?B?ZTEvUU9yMEZTbGgrdG1SNEVIUHBWanNwMEJ4Sk12V3I3VFlFTWRzT0cvVS9R?=
 =?utf-8?B?QVhFejFaNk51ZGlVNEpuNmQ4Z0ZsYWFYd2duaEVpcFV5eWRKaUZKNE9NZkQy?=
 =?utf-8?B?NXROM3RmaCtmRnByZEcxQVRSTUMwWVRVMFc1Ykl4WnJEU1FDMTdUcHorMDVS?=
 =?utf-8?B?UHM2b1J3NWZ3c0pKQzBjYWN3SWhpUEhkZzVybzdOclRZbk1ROGlnaHh1R0Vt?=
 =?utf-8?B?aEVzMnlqNEpsV1NEUXcwR3NwOTF2bmxNc1FvMnVlUWNjbEQyR2VyNVk3REpO?=
 =?utf-8?B?UjMxQWs3ZEFTRWx2SEdKTlZ1MFljSHhwQytlVHVrQmpFazhXbjVjMW1hbDRT?=
 =?utf-8?B?ZUpYWG5wVXFoSldlTVFodE1WMGpTc0E5eE9OV0xPcXgrQU1IeXNYcTh1cG1B?=
 =?utf-8?B?Q0tMRzNyTnRXRGEvNkVxN3NMU0xrRWtkeXVzVlJNWGI0eUtoVjI5UmVvaTJN?=
 =?utf-8?B?WU5ucXBsZUtFZzc5UGpjMktETjVBN2dlelhJWktwYzluVU9lQkV4bTVjSXpm?=
 =?utf-8?B?cUIxQUJHOU9Va3pYZm1Qb0lBcUNYeC9pQ0NwdDJBeFkzRkViNFN4cWNzQUVi?=
 =?utf-8?B?T3BZeVkwdVJId0lHVVVyRStDajBHTXB0dlR3UlZicUl0QjN4N2J5RUFVSkdn?=
 =?utf-8?B?TC9oZUFPWjA3S3hiMk4zcHpoOXAxc2hkbjQ2dno5ZVNybXJOTnRJRWtlcXFX?=
 =?utf-8?B?cXQ4c0paKzBzaWQ0V0hYTjRQTVo2SVBpZDgxaVljY0FRYk1iQmM3dDhXdmpr?=
 =?utf-8?B?VTlRekd6SWV1cnBmVWlHOUprdTJWVXliZ1lFdHNDTFBVVTFxL0ZaTVA0S3dM?=
 =?utf-8?B?RTNOOWRYdkF1TWZVOUptUUQ4bitLVGpaRjdWdXErbDE5NVI4SWl2QlVCWjEw?=
 =?utf-8?B?ZmZWRjVTTjJPUFBFVEZJWjIzcFNLcnZRYjNwU0VCNmw4N3JFVlRWWGREeFV3?=
 =?utf-8?B?WnBSU3oyWmVjTExRVENXSnJVNXJRcmVPenZRT3ArQ2Q2S1hkVVkvMVNjR0Qv?=
 =?utf-8?Q?8eHHRgGqCg6Op?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5968.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cjlBSTgwVXlCNjN4STRHUitaenVQQWIrSVYyczFzeFB5aWdMWWJmQWFlQ3g3?=
 =?utf-8?B?K3BmRCt5eUwyakFIVWhNMnluQjh3cEJoem9wWmI3RkZvZFVLL3JzV203ZEU5?=
 =?utf-8?B?S3NFWE51Y2lxVjFGcGhBWG5XdkRjWnpkTFJtMzRYYTJ0UlVwWHpWV1hJdm5N?=
 =?utf-8?B?ME9ZamZGNFlQZ3FLWkZWR1dQeDZjblBGcEJhaFlBRHhLVis5dU1SUmEvZG13?=
 =?utf-8?B?N1ZINEh2cTVuc1N3d0tpYzFMWW1pSERFQlVXSlBxYS9maEk1aG5VKzFMZXE4?=
 =?utf-8?B?cjZuS2U0ZXRoanNGVHZHZkp1NU9udU03MEpQWVVxNzNsdENWd0tHVENXUGdZ?=
 =?utf-8?B?S1VJZVRObDVPUmV0d3RBSWhVSUxiTWZQd3MweSs5Z3grUDNHelNXK1ZDdi9s?=
 =?utf-8?B?ZVJwTnpjd3Ixd2xROVRESnk5MEE5Y0NLdExPb3puTE5ldU9aaFdOS1V4Qkh4?=
 =?utf-8?B?RHNKVXJkTk5kaTVxVFgrdUVNU1NLaDF0MHNJUjVFVDZMRWpJeWFteVhiQ3Fw?=
 =?utf-8?B?eHV4Z0RlWTIvcytSc1hNUXBCc1haT2l2aExpOWF4QlpKWXFRb09naldzdlpW?=
 =?utf-8?B?SnhlaTBVeXVVWmtpamorNUR0Q3Q3NGZJSS9zVEhiS1BHYjNOam5meGlzQk91?=
 =?utf-8?B?OFJleHYrRUZXWm5Ud3BMYWo2RER6T21KQU5od2Rvb2JLbnU1SDdjcXNBU2s3?=
 =?utf-8?B?SXYzMnZZSEtsajFCT3dyVU5XL2JKNnpOOWo4RjdpNW1jOStENkIvL1dKVjNW?=
 =?utf-8?B?NHl1TTRPbEFJZ1RkTnZFYkpZczQ5TEd5aURxY0lOeTFWdVhXM3pxUHpHd0Zx?=
 =?utf-8?B?c0w5eFFOMC9hak1jWWFBN0ZYVFJPTGIxZTlsMi9HQXNIUG5MSXVoSlNVT2Q4?=
 =?utf-8?B?ZnN1MzZlcVQ5YnFVOUU4akkvUjdFR1FjNjZYbEhNWXQ4Y3Z0RFNpSGlVdWtG?=
 =?utf-8?B?c2IxREJXSHQwb3MrQ21tek44by9aenBrS3hJVU5MT2tlelZ0cWNSQlRkaVFO?=
 =?utf-8?B?ait0VTdzdXVkUGRXb0ZOTmZRQ2MvdkdFcGRwY2JpOGE5U3JoeWE4RmFSeFNq?=
 =?utf-8?B?RUJWVTd3YWZqa3RBYzVwVDBLZFRnalE1aHRWcjdnQ1V3ZnBLSW1QRW55YWRl?=
 =?utf-8?B?QTB4YndMaDdrbzRvUW95bkJobmt0MjJTaEw2enJKWW16YlhWZW1PNGhtWEV0?=
 =?utf-8?B?S1VZaUdHS2paSlg5blQ0Qmt0UjlTT1E0aG42VjI5bStQUEVnRk8yWG5ta2Z5?=
 =?utf-8?B?SjlTL0pQZmFxRStJZ2RRdjFuMHRJNkhFN2pKenJYM3VGaVpKYUp1WDdDTHU4?=
 =?utf-8?B?bFJVT3dCMXVQa0g5Q0R4UWdtaE5DWVVkZU1JV0kzbStsT0ZuMlRNcXc0bjIv?=
 =?utf-8?B?bk9qcFA5K01xcncrN2dtODd5SmpqbWFKa1pXMFRiZlFUMUVSQU83MzN3cDhs?=
 =?utf-8?B?ZmRIb2xRUFpmTTd6VmlsYXFmMlBXQWxFMHh5TE9CU2ppRzVqMXVqeEtBVjV0?=
 =?utf-8?B?d0NhcWZ2K2FPQVlFUGErdWdtRVErOVloRE5ReW5scm5CZjJEaVJmV09EamhH?=
 =?utf-8?B?ejBnTHJ4MjRnN1YrSlBNSU1ZWWlvK3phYXJGK0ZWbnBaWWE4S2x2RUFYU1pk?=
 =?utf-8?B?U1VPUXRuMVdmNzJQN3FsbVhMUmJRTjF0UGlhTjYrR0M3UkFMZnJmT0RnV0pX?=
 =?utf-8?B?ZzRaUXJKcWYrYkRqdnQ0UDJWUWo0MWVDNS9sRWJZTkZKMTNxcWhEQU5ybjFW?=
 =?utf-8?B?YXlpeG1kbFNTZjAycFpnKzFNRDlzV1FwWVNSVHRmU1BuamdTUVlLZmk3MlRo?=
 =?utf-8?B?T3FvcVUvYkJ5TDJGMmYyWkpYcjNKdkRNTDdBcVJXNTlrNG9PSEZGNTEzVVFP?=
 =?utf-8?B?RzVDYlo1STVHK3ZHa2o3YitsUEpXNE44V2NzdDFPcmNWd2thdkR3b1I1bWw5?=
 =?utf-8?B?VmxKK0FoN0FjQUt5MTdvTEdhRTVVZnY5SklmMXB0TDh6a0pKN1E5WjhYZ3lG?=
 =?utf-8?B?NjlHTWVNdVFDaVV4dmJoNkZtTVlUaUJIUHdzd003ZGRLc3dQL0o2LzhsSEIr?=
 =?utf-8?B?VnRFNzVvRXdNdDhIejh5RUw0eWJ3QzBYTWkzckNOV3hDTUhOWnlmaW9UMzBM?=
 =?utf-8?Q?p1fji2lEXMPzDLsHZq7UvFAim?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1349c1a9-8873-4581-dc01-08dd51231fdd
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5968.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2025 20:22:25.8360 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3bAA4ZOlnnO/ZQEh/WzgdrDHRdWUST3RN2DG7bCBH0TMmQeCq6SzSvfA5hIAjq1xsuDcuuke3zavBMM1FnC6AA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6473
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

On 2/19/25 4:51 AM, Alexandre Courbot wrote:
> Yes, that looks like the optimal way to do this actually. It also
> doesn't introduce any overhead as the destructuring was doing both
> high_half() and low_half() in sequence, so in some cases it might
> even be more efficient.
> 
> I'd just like to find a better naming. high() and low() might be enough?
> Or are there other suggestions?
> 

Maybe use "32" instead of "half":

     .high_32()  / .low_32()
     .upper_32() / .lower_32()


thanks,
-- 
John Hubbard

