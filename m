Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EAFAC591637
	for <lists+dri-devel@lfdr.de>; Fri, 12 Aug 2022 22:27:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BFAA93EF4;
	Fri, 12 Aug 2022 20:27:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2069.outbound.protection.outlook.com [40.107.92.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EAAFB3798;
 Fri, 12 Aug 2022 20:26:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E2bhvjrG8cz2hYEs7XTCvKUFcGvytbifmrMiLOnwsLQM44YT4ENeXMBOHSPCNwQQa2+le+T+i4wclOVzTIPnjBQ1RIoVqF0GqqTVzGELUkxFA2ltXQYr8EQNc9flsRIjGlNuSoBRgfc/ElPyC3DuWNaguqCg5KHh0KmUL91lWtVHRHsv1pUIwaC/8jTEfyPyVkGftxp+WJ/8prGAXyi5FazBjnNLA6JhW7yZDpXr10+Q7e0SunqVTqobYx68Ii/vz3FRfkBXYgHIkHAIqPsW4xNHRpzMNDAIA0Hz8mQuwcyfiUgwbCCxo77nBKaMCxJzghZzJyrj390hkFEl8hPn0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c7a+7IJCSCFUPHtB3/MC60OqR2m+JcLGRX91/AxADAw=;
 b=WqmKMVkNjl4ZhnrHJ1CXJhPp1xFwGdxpFq8fv45q3B31PhqjJQawE4H3vj43734CLRITxEJ2AOFVimpLUgWmRn4unXFj+BTNl8Jo9LQntBPnFWtcGJskvTJgbxvUmxzUqGSIwJigQCjAcL7amPun0v18aY/v1PvFKaj8fGZQgyo2xwv0dr2ncLkBepqxqvkCqAbQJPoTCzSll4JutBT/uM608/UUoR2liz/aEuVFKLFu7YZF51zYr8oaC4ul+2fT386nyfx6Mqr0/11yKE5hzAAqBNgs9wuTwd7NZn0UZoRS69Y6zPPTv+D2SucdLhqCGJ6w7ATywS86znUYcc55IQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c7a+7IJCSCFUPHtB3/MC60OqR2m+JcLGRX91/AxADAw=;
 b=hPLlvp/tV9T2j+fSudQo2wupV/NjPD8zJ9wGaEwX9dCXPal2irKlVxYTu0s3nLMsSAspCKUXraEhAl7kHfJW03J6GxiBquKF3OefN72B4L/7VbaUWWjgHPZo3Nx5ZIYNTpwMfl8gtszM1aVHHs3g1NnAsd/+qOW3G8PwoKDenpk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by MN2PR12MB3277.namprd12.prod.outlook.com (2603:10b6:208:103::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.17; Fri, 12 Aug
 2022 20:26:49 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::406d:afb5:d2d7:8115]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::406d:afb5:d2d7:8115%5]) with mapi id 15.20.5504.025; Fri, 12 Aug 2022
 20:26:49 +0000
Message-ID: <82233e68-106f-39e9-b20d-7794eb7a8933@amd.com>
Date: Fri, 12 Aug 2022 16:26:47 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
From: Felix Kuehling <felix.kuehling@amd.com>
Subject: Selecting CPUs for queuing work on
Organization: AMD Inc.
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CH2PR07CA0034.namprd07.prod.outlook.com
 (2603:10b6:610:20::47) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4654ff8d-42bb-44ee-548b-08da7ca0fbd5
X-MS-TrafficTypeDiagnostic: MN2PR12MB3277:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NWpvROhs6QDpY8UKEA6MDRqMkcIv7AvKUBFS9s/2BT6nMcA6GQiJWP9yHDZMcno67zGvfs1IvcXXBreQfU4dVQtCtK1unDpP2r0FgC/5N15LKnAMfq7BTTlF8HL7zsKHtj+OcuCVuG3OvjH2CCh8KtUfv9NCPWmDxjztjwccd/Yfpjb9dNjml9Fz1+CcQ2DK+XTaDL1dEUyBHTAEYEutzgIRGWNTVMa7+1z1NK4mYMURZJLWNVENNHWk2JAXPOlx3Ws6RGAWC9XKUYv4Ix63xK0OGPrRom1ga7vhsFIxlz22t3zHjuTIXKBEFymAPy6fgidhBaBdhrJx/ZLywOEpHllrAmmMa4VUGSeEblcGsOstDz79D2YIjI25+ntccykQ+KKK8GUbPdl1Sa26YoI2+cm4gMHF4u5y4R38n6dLxYFNqcPrA6Abw1ExdP8yspBG6YcMT/dmvKpb0Gi0hvW+79Fj4eFsb6CwUQa5PaQV6z5goXm4//1Yge69g1rh2wYWDeihK+RnBShypbedxQPtkear2qapmBedE/EVDlUGm3XYAK/F9el7BjwKUOKTr/DMzLjR/EtXdpgIamzxOigcph+vjaMb5PoB79jIKu1IFjOk0LfcMXHL4dWpH/bhdW9CsV1udrwMSjBclkAmCPS9AuQNJwsCQ32a5EZnNO9VnsejbmaJIujQwb37lu/l/R3XPni9EH56CO76RUSrfMScXVe5UmNoC07C9KAo8T87WxQwrwjUsUvNNwtAxM4n6vBrq5XTDbWa/v6LqW0O+E3u3IeM2vFOl9JMiNEn9Ikv3Yno1GJuFp75ZpdDsc0rzJ021cNuTIa3gfgF1pjQSxYOhWIDgi9C8ryR4OuNcC07vWe0ToQXd8C1YwStdBrdpjI/
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(376002)(136003)(346002)(396003)(39860400002)(366004)(41300700001)(316002)(31696002)(6512007)(26005)(36756003)(6506007)(36916002)(478600001)(40140700001)(6486002)(31686004)(2616005)(84970400001)(186003)(86362001)(966005)(8676002)(66476007)(66556008)(110136005)(54906003)(66946007)(4326008)(38100700002)(5660300002)(2906002)(44832011)(8936002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?czE1Z3RJSlNrcWhoRmg3YzBuSVBMT2t2REUvSFlFbjFjTlZzNUdhaHhCZ3oz?=
 =?utf-8?B?NVFUTjJ2cUtCNExDaVlVUk91THk4T3d2eFJwR2FiMkYvQmFMNmFBSzZZWG1w?=
 =?utf-8?B?QXVrTS9tRXh5dmU2WUZTa29UL3psTWVhQ3k5TVVRQmx3S2ZEODdNTXVtWjFh?=
 =?utf-8?B?bVRFamprTXVndXRueU9Cb1VUak5TKzVueWJlQW1XelVaNUFCS3hPV3dSNjVG?=
 =?utf-8?B?Y1pxL2Z3VEVzbW55Sk9RMG1YY05aWFZ5c0tVQlpSQ2pTTC9BbzU5QXJaalIz?=
 =?utf-8?B?ejAzaS9zUjk0S0ZYellkZFEzd2JLOVhBazNlR3lqNzBHUWlxbktQMHNXK3FY?=
 =?utf-8?B?UTVrTGhEQlBvcE12aUo3Q0x3YlNIcmIxOVJ6cXNTdC8rOGs4VW0yYWdKZTBp?=
 =?utf-8?B?RGdVOXdPcDJwb2xmUDZkSVZzOEhzK2ZDUGUvaXVOWTlrdWZ4WDZVaTRZOWN0?=
 =?utf-8?B?d1F5Ti9Xa1ZNZU1GMDQ1S1c5cFhsQWJrc2NIUEdxR2c2WEc1cmhFTGFXRElI?=
 =?utf-8?B?S2RNWkZBZyt6VVhZRXJReDY5Z2YvWmJZUDZHZnVKVVYyOU04eVJkV2ZFVWtp?=
 =?utf-8?B?ZncyVlU2TUJtVFF1a0l1R0J6RW40Q2NEcWd4QXNXYyt6U2Y0bEhGS2dhbmR5?=
 =?utf-8?B?cGw1Y2g4TVRieFh0UGk4bnpaVVM3eGc4N3NkNDFGSE5FL0xwMmhRZjFMWWl0?=
 =?utf-8?B?dDZ3OHFFTVJIRGpLSHpGd1F2bFVLVmJ2c0VhdURtQTFLdGxaZThodVA4Vmg5?=
 =?utf-8?B?ODRsVlIzVU16YW9PQ1ZhMHBnOHRxa2NhcGljSmNRY2lBc3BRdllZM3pSZnU4?=
 =?utf-8?B?YVpXWTJ1TGlzQ1RIV1dBbXRCcldwTUZIUmVNYndpNGc1TS9RRnEwVWJ3elBk?=
 =?utf-8?B?bVY1a05jQmorMTVwOXZoMkhvOWNweGdqdFZxOGRudEJ0WDAySGdtSlF2TjJ1?=
 =?utf-8?B?ZnA2aUM3a2syTWRRNllwZzlMZ2d1cFd2aHE4WTlFenZTTEtvbUlrVEhmaTA2?=
 =?utf-8?B?VGdpb2lIZlpYUlFTWktjTWJUVy9GMnJuTnlqVDRJYlRyeTJOTXc1SlNLY2VY?=
 =?utf-8?B?eko0bFBVc1ErSlhyMDIySFRUZFlMTWZVS1FHdjM4T3d1QWRtcXY4ZmNuaU1r?=
 =?utf-8?B?c2hDeU4vUUxTRjlHRSt5Z1g3YktjazBHalZRYmJlRjcrNDJldWlhcFpFYWwr?=
 =?utf-8?B?Yk9nYUZSZS9BcjFaaGV5NDhQdTVDeisva2ZBTU5zSmFvbXNmR0FwUWo5eG02?=
 =?utf-8?B?cFpVN3M3UE0zZ3JIMFdXb1BxUnJoUTJ4anJpSkoyZWFhbnRJWFJGRlArQjlV?=
 =?utf-8?B?bS9XT2tkNmdCOHNKUjlONlZneEZ3ckI5ZkU2R1E4REF2aDFxNGZKQmUwL2Iw?=
 =?utf-8?B?N29oYTZVb0hPY3B1WU04ZWttNWw1R0hvclhEWVBSaVBMbjZReERTR2lzalN2?=
 =?utf-8?B?SVRPMkllbjBWMTNFYjNQNGxvMGc2REc5UitDYjdMckZlTEV1Vkl3c05SMTRY?=
 =?utf-8?B?YWJjVlF1NkhyYVp4WHBNa0pGQUlpT3VpY1ZIWjFRSVVCOVhOK0NZQVB6SEd0?=
 =?utf-8?B?UDRhZVpwcmV5M3ZzWS8zbGNiT2JKM2hjQ1dHVFloUCtFbXQ2Nk9xZzF2bXhi?=
 =?utf-8?B?Z2tzVExMVEZjRVB6NFZZeVh3dFFMQm1pSU1hMy9WZWlWdUt3U3RiZUhzNWRX?=
 =?utf-8?B?SVFoVUtRQzBEMkZTT3JlNVpKUlQzNXIxakM0RW50dkVJZkIzSnBINjFpNEln?=
 =?utf-8?B?MlR5Zm5qS08xMmQrUFg3bndOcGFFb09ORzh4UmpQUWxoZGVDOWFiY2MwZm5J?=
 =?utf-8?B?T0RJdjNpTnZtSHlvNXpkcVZFTlBScWJ3R2RCTlBzcUVUSmdCc0FialphS0p3?=
 =?utf-8?B?Z2dRM3BxU1BrWEVNM2VmN2NsNXpUOXBxYXFxcWhNSStrZ1AwdFNFUU53T1py?=
 =?utf-8?B?bENOSmNETmFGMFlqbUVLVHQ2R255OTdNd2twbFo0dnEzWndCSU1HUUZSS3d0?=
 =?utf-8?B?RGNZVnJMSmU1ZDZsZmh0Y0hZajVIUktxc3BmUXZNbWhRRk5pWGsxREJIdWM4?=
 =?utf-8?B?SllUc0xERGNpeVJBY1Q4eVg5S2ZINisxcG5aUVBUa1ZsbTJLK2ZZR1Z3dDIr?=
 =?utf-8?Q?Am3Eit8nl3E5kPGm1cfNlZeGg?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4654ff8d-42bb-44ee-548b-08da7ca0fbd5
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2022 20:26:48.8958 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QknAz3+smBCzniEfc2pdu8PZBG3+9MtqhtxC0teGEias8H3BVeh1JfsmrZ8+R44ZERRNZsRmFDslGDU0bGNing==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3277
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
Cc: Philip Yang <Philip.Yang@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi workqueue maintainers,

In the KFD (amdgpu) driver we found a need to schedule bottom half 
interrupt handlers on CPU cores different from the one where the 
top-half interrupt handler runs to avoid the interrupt handler stalling 
the bottom half in extreme scenarios. See my latest patch that tries to 
use a different hyperthread on the same CPU core, or falls back to a 
different core in the same NUMA node if that fails: 
https://lore.kernel.org/all/20220811190433.1213179-1-Felix.Kuehling@amd.com/

Dave pointed out that the driver may not be the best place to implement 
such logic and suggested that we should have an abstraction, maybe in 
the workqueue code. Do you feel this is something that could or should 
be provided by the core workqueue code? Or maybe some other place?

Thank you,
   Felix


-- 
F e l i x   K u e h l i n g
PMTS Software Development Engineer | Linux Compute Kernel
1 Commerce Valley Dr. East, Markham, ON L3T 7X6 Canada
(O) +1(289)695-1597
     _     _   _   _____   _____
    / \   | \ / | |  _  \  \ _  |
   / A \  | \M/ | | |D) )  /|_| |
  /_/ \_\ |_| |_| |_____/ |__/ \|   facebook.com/AMD | amd.com

