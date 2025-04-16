Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47678A90769
	for <lists+dri-devel@lfdr.de>; Wed, 16 Apr 2025 17:12:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57FC510E96C;
	Wed, 16 Apr 2025 15:12:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="s13wtH4/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2057.outbound.protection.outlook.com [40.107.94.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 545D610E96C
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Apr 2025 15:12:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GaN0CrTPWSi2d4C2ZGQKUjHMnh6VjKXTEq7Jfgs/TbifFScUwcxnFUwFBPiM5ML8CcqGEbMZqctKEY4LMrZz2lmbAOYcOBbpDdp+rPpSb+VpnZ3VuSKF+uAqAnqLLDkdLGmphp0WHrWFnK9uF4P3hMwXUiYUKNM5zpCYZmW1nDxxJzXOb3qP8h+TJ9P9J4fDTMxA6Gw0c/7qAIJgTH+4UELgk3h+c62JBzOPOV+6Y9ATXpwriUFdY4PPlS18KJ+4/slGH7FWb15LJDrG00Y0LiPTjc8usJKzr+tIxLHG7hxW8kknwRFJ3KuWUfijhHfVr4FebDAYD/C+VNKIxQWMvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=99K4pJelFCdWNnht9cJFR+tbi3R38NsH3m38VJ+mAYs=;
 b=JcxWvn+JAV6ZjC6RX0ifflwCEZqKpx0vgKKLxUiuR7CNfTmjBld9ENPs1fg5vhDu/VjjroBK7BWtCUm8CzG2zLDvVRjRI9ZHpeXHaHeQwDEmMBfsdqBuaGjtE7dwZJ8bhVlx129G8lo7Q7iZ6UrIq63qogh+8LbV9QEdjxzWQ07LG5rtlNpjIqyAxwnkZgZzFBCGxli804GPpNcoJ7QEJgfcpqc+fD9PBVjm3Poz4bEGbGNmbY81m6R4yldaoU+pgYBHxzsanWm1J1Dv/zMZ7FFZ5fGK0XG4YoaUDXdLdoPkk4Yr14LLCm4rQqSp4N5sKqZNpw7pwBvjZGMiujEbMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=99K4pJelFCdWNnht9cJFR+tbi3R38NsH3m38VJ+mAYs=;
 b=s13wtH4/1cmHHUPI2Wg5XMjjHt7pZK2YTzbuxb2SiO0hdeHEJqMvKmvqnfFeIq2gjZ81aqZIFbniUzgEBAtJPXbVnpNhm0QbJBWVavvIrLbhhvW/WndPyV7v4JIAsdf7YRt7G+tTHNH+vUqyvDCWz2IM2A8NJANwuI2QVukGS40=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH3PR12MB9193.namprd12.prod.outlook.com (2603:10b6:610:195::14)
 by SJ2PR12MB8650.namprd12.prod.outlook.com (2603:10b6:a03:544::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.36; Wed, 16 Apr
 2025 15:12:05 +0000
Received: from CH3PR12MB9193.namprd12.prod.outlook.com
 ([fe80::7818:d337:2640:e6c7]) by CH3PR12MB9193.namprd12.prod.outlook.com
 ([fe80::7818:d337:2640:e6c7%5]) with mapi id 15.20.8632.025; Wed, 16 Apr 2025
 15:12:05 +0000
Message-ID: <deaefc59-f6e4-2d4d-b91d-0ba7db9dfbf4@amd.com>
Date: Wed, 16 Apr 2025 20:41:50 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 2/3] accel/amdpk: add driver for AMD PKI accelerator
Content-Language: en-US
To: Lukas Wunner <lukas@wunner.de>, herbert@gondor.apana.org.au
Cc: Krzysztof Kozlowski <krzk@kernel.org>, davem@davemloft.net,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, krzk+dt@kernel.org,
 gregkh@linuxfoundation.org, robh@kernel.org, conor+dt@kernel.org,
 ogabbay@kernel.org, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 derek.kiernan@amd.com, dragan.cvetic@amd.com, arnd@arndb.de,
 praveen.jain@amd.com, harpreet.anand@amd.com, nikhil.agarwal@amd.com,
 srivatsa@csail.mit.edu, code@tyhicks.com, ptsm@linux.microsoft.com,
 linux-crypto@vger.kernel.org, Ignat Korchagin <ignat@cloudflare.com>,
 David Howells <dhowells@redhat.com>
References: <20250409173033.2261755-1-nipun.gupta@amd.com>
 <20250409173033.2261755-2-nipun.gupta@amd.com>
 <20250410-sly-inventive-squirrel-ddecbc@shite>
 <bf851be7-74a5-8f9d-375b-b617691b6765@amd.com> <Z_wH_uCx558T0__c@wunner.de>
From: "Gupta, Nipun" <nipun.gupta@amd.com>
In-Reply-To: <Z_wH_uCx558T0__c@wunner.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN4P287CA0111.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:2ad::8) To CH3PR12MB9193.namprd12.prod.outlook.com
 (2603:10b6:610:195::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB9193:EE_|SJ2PR12MB8650:EE_
X-MS-Office365-Filtering-Correlation-Id: b5711897-09a7-4694-ad67-08dd7cf90bd0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RTRkTDZLNzRIT0NqN3hlazZ0d2x4KzRPQTBqL2R6L3JrVjYzVk8zSUN4ZnJp?=
 =?utf-8?B?L0J4VzJ0S1YzSUh3ZzZ3QWZVbnVabG1Yc0tZWE04VUd6L0pNRHpBNEExOG52?=
 =?utf-8?B?emVTTjM3clNVZVRyMnlCTkJDaE5mRmFlWlBEbVIxWnh6TU9SZHQ1QTg2M0tP?=
 =?utf-8?B?WGFoTTV3MTl5dlQ4Y0RmK2tSaVA1L0NnSm9zWHhxbW5vaHpZL2c1djNKcll2?=
 =?utf-8?B?aUNnVlVLQXhNb2thRWhlZXpJMkdqbUc5VW9xU0w2YVMvWUw4cGI5RVBnb3lx?=
 =?utf-8?B?RjdTcGlINW1TMVJPeEZOa0hKOFkySEcrQ0k3Q09pbk9CWjBiaWkzWHNLdUpt?=
 =?utf-8?B?VE1MUElZVXBKaVJJb3pMaHNibm9YWXJEazZzVkNyZ3F3VmVPRlh5ZmkrcjB2?=
 =?utf-8?B?MldISE4wcUZieEJOOVNMdWxVOXVDcHNyQUU0SG5EZmQ2MldnZzZKcldua2l1?=
 =?utf-8?B?N2l6eU1hc2FuUXBOZi9QaVlncGVYbVEvUytVelN4ZmlGcE9RMklFNlV3Yjg3?=
 =?utf-8?B?N0liRm5nMHowK1VwcWZuUm5vdmQyemxNc0pzbHk2ODA1TEVualJtUElkNERQ?=
 =?utf-8?B?MkpRbC9tekVVcTU5bTdxZkFIVG5kaG95UEZYS0VkVFdES1orbHYvdTdPaWVu?=
 =?utf-8?B?Mzk4d1ZNc0NwNmt5WEJFRWdlTTNKck52WWdnZ2R0aHFYMFZQZmI3NUpGdjBo?=
 =?utf-8?B?djc1K3g1aGI3UmpybDJHOGY5VFpPZXh4OS9aeWs0VUlnbkIxZkgzU3ZQMVZm?=
 =?utf-8?B?TjgvcDBqUG5veHpyb2lra0tRS1N3WkEyNmpPY0ZqOE40T2d1N0h2MW9UTHNX?=
 =?utf-8?B?WHVoWlR5UDVaS3lML05LY29TcnRhbkk0Uk5zRDQ5NUcxcFFDckQ5azlMbStn?=
 =?utf-8?B?dmpxQ0R0eENtRTFvc2FCUUozczc1V1d0aTlLQW5FNTBWNVNDOTZEVmZYK3ZU?=
 =?utf-8?B?SFlrYWVDSjJKWkZod1NwODhrNFlkcmZ3bG16RWx3L1NDNkYvbEt1YmVNSjJR?=
 =?utf-8?B?eDFMVnlLL3FyVW1VU05tNUNnUTBPdEdBcWh1VFNTYmxQdVJEQVRudjNhQjVz?=
 =?utf-8?B?RGlRbTJhSnpiNHliUXpheWVOZEFJS2RrSW5nU05GdnJkdVlHSmxGaVRUTFZE?=
 =?utf-8?B?Mm12RWhOWWRhSTg0WVdqeDlHZmcvZWRjcWtnTEl2dVBWdEtDbEVLYlM3N0ov?=
 =?utf-8?B?Yk9tZ2dyWkQ2U213eWNGYzBIbGNmdGl0T1g2TVU3UEhEOTdmQ2hRK21MdUdV?=
 =?utf-8?B?Y29sVWxMU01aRzJPNWlnaFVmSUdEVG90eUJ0ak8rVU9EZEZHQjhYenVzd2do?=
 =?utf-8?B?dXByTDI4QXdqdW9HVE0rUFRQcG1Qd1BwNmcrTi9rcDNhU21uS0RFTjJ2ZWc3?=
 =?utf-8?B?YzhBUnhOTGhOUVMxMWhQdmo4ZlhLcElFdURqdVJRM1loVEJhQW5td1c2Rk42?=
 =?utf-8?B?UHp3Yk5lNWZFVlA5NXNwNGZvS1BlTitQNTZSTGl3QTBpOCsySG02K3kwaXQ1?=
 =?utf-8?B?MnhaY0w4K01wRkdwbjJYZXQ5N0VQSVJQOEtUQTNRZ0pHS2NwOFZzQ1lvM2VU?=
 =?utf-8?B?cTNyaVJrbUo5VUxseXdZOGhZNThBNnVyM1pDcDFweHRtODhWOERqaE1MSDlS?=
 =?utf-8?B?TWFOUFFUS0cvYW5la0czdUkvSVdhVkJ3MVh4SUFMeTFEWXF1VDkrS2RkZzIr?=
 =?utf-8?B?ZlFENXdESVJ1WWlRVW5RRFNCa2g5VTNCcmZqQXcxNERJbmhkSlJEUktMQVR1?=
 =?utf-8?B?cnRudDV0M1BVbFFlbC9qM0x0eng2aHp4VDlPQkUxSCttVnpadUJzOXNtVUFu?=
 =?utf-8?B?MEFJbFVlb1pxR1Vac3ZHdWpqdURjMU1ZRDRUeG41NlM3clZsdlJDNXlpVHZ4?=
 =?utf-8?B?cXVNcU1EWmJiVU9udk1WNDFMMFpMeEhiMnoxTDhsQm1GUDZnM1RYVDhQQTRB?=
 =?utf-8?Q?onMzXLpajlM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR12MB9193.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z0F6SGNmZXNGUEFXK0lCd0pNYWg0U2lhOFNwMTlNNHlYbFcvRUR1NHArYnJZ?=
 =?utf-8?B?R0ljeXgzK1RWNVBVT2lTMG9FYm1xTkloME8vOGtmb3Q2Vlo3SkJ3WkxBMVdW?=
 =?utf-8?B?eTRpZVpsUzNCTlY4UnhBdEhKODVTRnFDTHB4Y1UycW5sanZ2ZCtBeGc1SG5H?=
 =?utf-8?B?T3FnRXlTRHFWWGh6Q3lpY3RKRG16UmlRdFV3RXR4bVpvcEFpbGJUME1jdjls?=
 =?utf-8?B?UDBQb2lROUlqVmJiREZqT2phVEhGR0tacEdFMG5QVHMwYWEybzRCSUFIbWEv?=
 =?utf-8?B?VGJYZkg5TEFZUUJzQ2FXSkY0aUkzWisxQVpxUURzS3NVYlNNZE8xMGRNc2pz?=
 =?utf-8?B?U1Q5N0RwMnVMRzdOclVCeHZnTFVnQ0liZzZUVzdhdTVya3NZaENBZklGVUll?=
 =?utf-8?B?LzlpTFlXdHdDd2F1dWFoWFIxdlp5TnM3SzUxb2VMemJlQ1lIdUo4N1I0ajFE?=
 =?utf-8?B?RDcyazhlNG1KUjFDdUlsNVZNZEowUVlFSnNSaHR6ZHBFR0pnU0dYaTNWbkRp?=
 =?utf-8?B?VUlxWXB4ZXRldVdGTVRSRi9TaC9NMkhaYklzNHpyTmRpM2Y2WktDZExyTWJm?=
 =?utf-8?B?YWVTZm5kSjhNdTJ5elVNWDVpNDRBTW1KOGtpY3VDWDhpSjNZSUx0bjIzcXB3?=
 =?utf-8?B?NTh1TEN2UHFJZ01qMnFibGs3eWMyQ212M2xXcDRRTkt4RzgwaEEwN3FoTjBO?=
 =?utf-8?B?ZnpmQWJ6U0V4QytCaGpGQUhhT0V2WEowK3BoVjZhbm8zTXFDakJITzRQUEhI?=
 =?utf-8?B?OEhvb1hJa3p5MXBBaHRJTzRLaTR4TDh2YlJERzl3UU50eFdhb1Rha2pFVnI0?=
 =?utf-8?B?RmJUUnB6WTJmV3FJYlhpQStRMVhDOHpyK1hUeUhFY2RIcU9DL0xTUFd5S0dv?=
 =?utf-8?B?N2V6SkU3YTh0WDJkbHdRQ3gzclJ6a2srVE9wVW1Na0ZSMlN6TGVTaDZvUTFG?=
 =?utf-8?B?SDlydGNNNkJRa3pIemVqQkNsbzNXZ2txRzZJd0hmemhwa2trekxTWHR4Unda?=
 =?utf-8?B?TnNndzltKzNOWWo2b1hsRnpNMStITkFYMkNHQWxocUI1ZzFlSW9wcVpuWW1U?=
 =?utf-8?B?MTRlK0V6dk5PR2MvWi9lK1duWkdwMmNRUEp1REVmOVpncVIvN1J2WlJIT1VW?=
 =?utf-8?B?NmxjN0VlQjJlVGpPWWl0RUtSc2NqZW5mUms3SG9IeHFmZHdqS2VwNlU2YUlh?=
 =?utf-8?B?Z2RqalZRdmpSSG85aEpEV3V5VTBqUTd6ZkFteUNVZmtWeVdwWTlGVHNqV1ha?=
 =?utf-8?B?MEtzQjg0L0VoYXl2MzBnNHo5V0UxVXdhRnRCMkdnTlZycEI3eDAzTWFMVWFx?=
 =?utf-8?B?RytNVWRVVGszek1qOE9DckpmeXJiVnFPVnNKR0JtQ00yVWw0N0J5RlN5ZW5B?=
 =?utf-8?B?Zm5pQlJ4Uk15QWVBSHZUSUdXMjB5K0dybG5pcUFMWmtxb2JwTGZqMkdGbEly?=
 =?utf-8?B?VzcvRTVMRFRLRG9IZzlFZHZ2R0xkcVdpK0h5d2FBWHhGa1hHbGIvczh4NFRu?=
 =?utf-8?B?NTcyc0l5ajk2YmI4WnVtZmlZUWEvMDBjemdzSW5PUWxuMUxrQnlzbEZ1VGlV?=
 =?utf-8?B?MDd0WWxCMWd1dkhhQnNDeUdHd1c1MG4xWkplVDJpM212TXdDYWUyMXRhdEpq?=
 =?utf-8?B?K1RzQ0doUytFVWxJN2ppVWMxODZOb2thOEpNUHhqQTRQdG9kRVRXbXdSNU1V?=
 =?utf-8?B?NExqQ3dRcVlCSUwza1E0eWhHd0h6VmU3NnB1cVRBa09HTW1nbVgwY2ZzZ0xx?=
 =?utf-8?B?VUtBNUhsd042Yk5Tb25lT0ZYM3dLWUZ0ZDFZa2duUUJiNndLYXF5NzFLblJm?=
 =?utf-8?B?ek9vQ1A3SnVyc3hDeUJPa012aVpqQzM5LzBjSUgyYzFqSFp5aUVaY25aelN3?=
 =?utf-8?B?Zml6eWkwL3pIL2FabFV0b240cTM5ME8vdWZhNW1CRFBubENlblU4VmRTdHBD?=
 =?utf-8?B?V3lQOWJ1VHZqYndwZnhDUk81RnVEdE4rQWlPWkdSRmw5dVhMRHZCeW92ai9U?=
 =?utf-8?B?U2RYL2t5SnZKZzlMY1NsRE42Q0RFMFppclFUUFlFUERNTTZKZEdKOEFsSjVW?=
 =?utf-8?B?YUFzU21pSkVQNElGYmV6NTdsbDFyMHdKSHFSQW4za3hHU1JrL2FhVEQzemcz?=
 =?utf-8?Q?FteR2awOiWm4ZwqWCkc6A5aAa?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5711897-09a7-4694-ad67-08dd7cf90bd0
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB9193.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2025 15:12:04.8491 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eW063GKidzpYiGp56KCER6JxpyB9uaq10P/GRtj/2dhYT3SRVj7KHxogVx9l6JBW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8650
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



On 14-04-2025 00:22, Lukas Wunner wrote:
> On Fri, Apr 11, 2025 at 10:21:03AM +0530, Gupta, Nipun wrote:
>> On 10-04-2025 13:06, Krzysztof Kozlowski wrote:
>>> On Wed, Apr 09, 2025 at 11:00:32PM GMT, Nipun Gupta wrote:
>>>> The AMD PKI accelerator driver provides a accel interface to interact
>>>> with the device for offloading and accelerating asymmetric crypto
>>>> operations.
>>>>
>>>
>>> For me this is clearly a crypto driver and you are supposed to:
>>> 1. Cc crypto maintaners,
>>> 2. Put it actually into crypto and use crypto API.
>>
>> added crypto maintainers for comments.
>> IMO, as accel framework is designed to support any type of compute
>> accelerators, the PKI crypto accelerator in accel framework is not
>> completely out of place here, as also suggested at:
>> https://lore.kernel.org/all/2025031352-gyration-deceit-5563@gregkh/
> 
> To be fair, Greg did suggest drivers/crypto/ as an alternative... :)
> 
>    "Great, then why isn't this in drivers/accel/ or drivers/crypto/ ?"
>    https://lore.kernel.org/r/2025031236-siamese-graffiti-5b98@gregkh/
> 
> There are already six drivers for crypto accelerators in drivers/crypto/,
> so that would seem to be a natural fit for your driver:
> 
>    aspeed/aspeed-acry.c
>    caam/caampkc.c
>    ccp/ccp-crypto-rsa.c                 <-- from AMD no less!
>    hisilicon/hpre/hpre_crypto.c
>    intel/qat/qat_common/qat_asym_algs.c
>    starfive/jh7110-rsa.c
> 
> You can find these in the tree with:
> 
>    git grep 'cra_name = "rsa"'
> 
> So far there are only drivers to accelerate RSA encryption/decryption.
> The kernel supports a single padding scheme, PKCS1, which is implemented
> by crypto/rsa-pkcs1pad.c.  There is no support yet for OAEP.
> 
> So the padding of the hash (which is cheap) happens in software and then
> crypto/rsa-pkcs1pad.c performs an RSA encrypt/decrypt operation which is
> either performed in software by crypto/rsa.c, or in hardware if a crypto
> accelerator is present.  Drivers for crypto accelerators register the
> "rsa" algorithm with a higher cra_priority than the software
> implementation, hence are generally preferred.
> 
> One benefit that you get from implementing a proper akcipher_alg in your
> driver is that virtual machines may take advantage of the hardware
> accelerator through the virtio support implemented by:
> drivers/crypto/virtio/virtio_crypto_akcipher_algs.c
> 
> Note that the crypto subsystem currently does not support hardware
> acceleration of signature generation/verification (crypto_sig),
> but only encryption/decryption (crypto_akcipher).  One reason is
> that signature generation/verification is generally a synchronous
> operation and doesn't benefit as much from hardware acceleration
> due to the overhead of interacting with the hardware.

Thank you for the feedback.

When establishing TLS connections, OpenSSL requires signature 
generation/verification. In scenarios where multiple connections occur 
simultaneously, asynchronous operations are beneficial as they lead to 
much improved CPU utilization. OpenSSL ASYNC support can very well 
utilizes the asynchronous operations while establishing multiple TLS 
connections.

> 
> So there's no support e.g. for generating or verifying ECDSA signatures
> in hardware.  I think that would only really make sense if private keys
> are kept in hardware and cannot be retrieved.  So the use case wouldn't
> be acceleration, but security of private keys.

While ECDSA signature generation and verification enhance the security 
of private keys when stored in hardware, they also play important role 
in the establishment of TLS connections. Offloading these operations to 
hardware frees up CPU, enhancing performance during TLS handshakes.

> 
> That said, for RSA specifically, signature generation/verification does
> involve an encrypt/decrypt operation internally.  The padding is once
> again done in software (by crypto/rsassa-pkcs1.c -- no PSS support yet).
> But the actual encrypt/decrypt operation will be performed in
> hardware if a crypto accelerator is present.
> 
> The user space interface Herbert referred to is a set of system calls
> which are usable e.g. via the keyutils library and command line utility:
> https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/keyutils.git/

These system calls can support only synchronous operations, which 
precludes their use for asynchronous operations. This limitation 
prevents the use of keyutils here.

Thanks,
Nipun
