Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 026E27B8E6A
	for <lists+dri-devel@lfdr.de>; Wed,  4 Oct 2023 23:01:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C351610E3B7;
	Wed,  4 Oct 2023 21:01:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2062.outbound.protection.outlook.com [40.107.220.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D87110E13B;
 Wed,  4 Oct 2023 21:01:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ma9w5buxZTPkJfQa68em9jJC76IxjAPfzx1hEPIJrzkGYVGqi/ohvy0KudNlTbSbnUb45ehuSuKqtNRf0zAB42gcAKapWmtfBAKBXDqooSfukhCxgj2PjyMzB5hA+x8CLmvkZ98xjix/EzJSsIJGjerGzY8mmZw3xI0F9MQ+hQUedOz5uZ7oQJAurIDy0wVrMjVlSAezpx1zGzxDo/zxQBdCkqz7KkjuiT7KMTIB9jqdLog/FUviyHQMHwRKb8TlvpANxcAT/AONPEUU9o9yEWxA487NoX6Ge9lam33nFI1H1hVZ2GnfalZv2I7t2m8gZdQPfpb8u+5xixB0uIHtsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KkGw/kXl/tH3n5Hp1DiQGTOhY0nXPdyWGw3Z9ToDdWo=;
 b=QSaHzHEs4Ea18m5U2uDVpS7ZEKkMxcQKBvdsmCF14wKktefm4xFvvpXJMcvF1ht9LKGu3IduppzUbxMwzgQsucVSR55JXL7EmWQcUBpmE3e5j2vlIPkZCGNVgbV2/GduABtj9siljf9VtLQWlvj8kg4P3lMGEt3PrJmoLzI0B4PepHhOZAiK2bsrK03g5MqATz8Byb07dwxyd8FP/44yPmZez5HrDFvsj6oX5NqfHjXKV4UfFDb3Tw5lVCbb6Hl8jNqLH0tyBAufHpdxGPxUW1A0GlfEbbxBZsXnVpFfjtssly8Fc3NmrWoHTtYIQLVKJAcgAmzla1vzWhcRpNUTWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KkGw/kXl/tH3n5Hp1DiQGTOhY0nXPdyWGw3Z9ToDdWo=;
 b=oCxPXFndZ718bngWiT5duOLE4oOqktxZ1wZw5n1EXKI4DQTgE6NWuZ1VjgN/LxsXAKHsnT16AtiQ9uiJUOR4QTM2ml4AyQfPnh5feAXnVB7oup44MakmG2aSUvvtzk/6930tiWmXLemcZcuih29DuxL4fcvJvskJAchjJwj4E7k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB2941.namprd12.prod.outlook.com (2603:10b6:208:a9::12)
 by SN7PR12MB6911.namprd12.prod.outlook.com (2603:10b6:806:261::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.23; Wed, 4 Oct
 2023 21:01:02 +0000
Received: from MN2PR12MB2941.namprd12.prod.outlook.com
 ([fe80::9620:780c:562e:33a1]) by MN2PR12MB2941.namprd12.prod.outlook.com
 ([fe80::9620:780c:562e:33a1%4]) with mapi id 15.20.6838.033; Wed, 4 Oct 2023
 21:01:02 +0000
Message-ID: <d13aa2b8-9af4-4035-b3b8-f3ae7d0d15d8@amd.com>
Date: Wed, 4 Oct 2023 15:00:57 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] drm/amd/display: Remove migrate-disable and move
 memory allocation.
Content-Language: en-US
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <20230921141516.520471-1-bigeasy@linutronix.de>
From: Rodrigo Siqueira Jordao <Rodrigo.Siqueira@amd.com>
In-Reply-To: <20230921141516.520471-1-bigeasy@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BN8PR07CA0028.namprd07.prod.outlook.com
 (2603:10b6:408:ac::41) To MN2PR12MB2941.namprd12.prod.outlook.com
 (2603:10b6:208:a9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB2941:EE_|SN7PR12MB6911:EE_
X-MS-Office365-Filtering-Correlation-Id: fab24ea0-9334-4dc1-4a24-08dbc51d048c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fDuge6MMks2Da/1szcHbLAKx09WOTiBeG/vybYQ6sN5tnwBXnsAL2977/5kPZL3+9T2Z8FaulikA04HcXTKJDqz9gZ33AHvbuf2XF6VdDE4ztFMAs6K3ccBOQlR8gb2sJ5GMlTyXNjAJasXVkwPu18ZtQX+wxGkAQNZN/FvVaO8C+oEo7fcOEBWGjP0o+lh1WR3P0QhbvkdfQeEVLSWlglUKOq1aNCs8bpwk2/KhO9E3/5uGQFZ55OHZ8zKvEPyTMHnIy37TEcRVW8F0gD0uWuXHNXSgNbxDXuYZtYyse4NEifGjV9jqhO1lPBQU6lLFhZEkYewm0TdIYG/lwtHgQuEM0d4a2IBi0NfC3sAl4W0sH9n9Twraqsyzx6zJQk8sBHJ15ao6InMchmI/2a0iHrZbLRs3jQJzwKr75B6QMcdVCtyltm5kpWa9ejHEwuYIjLhNlzSacyjem5YoD6UQmtzzd3s8Sgs69teoAYw5R3/y9i8+t7LENGjCf/EdS8IDRWC/lFZ2a7Acp9aUPm8oBNFADbNETQ2cpNYo3jwd3LhujHYc8eUS8AjghpIJNtDAAbM7V9Nm/38hMNU6jYotuvGvhpEiz9pPQcqp2FlX8jBgRyl0vrsdeQIFR8LE5O6F/zoqvkuKEyGHPfhr//pfiA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB2941.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(136003)(376002)(39860400002)(396003)(346002)(230922051799003)(64100799003)(1800799009)(451199024)(186009)(6666004)(6512007)(54906003)(53546011)(41300700001)(8676002)(8936002)(316002)(6506007)(31686004)(5660300002)(6486002)(4326008)(478600001)(4744005)(2616005)(66556008)(66476007)(26005)(66946007)(86362001)(36756003)(38100700002)(31696002)(2906002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UldxVlhvczJLN2hpRHpjQUFMdTNFZ1pNQ2p4c1hmbjdFVzg3RXc2bXVaTUJS?=
 =?utf-8?B?eHVlN3F0VXdpTmFGQzkwNHREZFg3eFRMclRDSW5xM2xuUXhocGlBSHhkT2xO?=
 =?utf-8?B?R0NlczZyT1NXS0Q1Q0hoYmR5VUs3TXZUemRSbmJUYSsvTHFLOXBrY2kxckk4?=
 =?utf-8?B?bFBSYUQ2dnBxanZkR0pFcUpLcXFLRG5PWWFQSWc1ZUxnS1RVaU5kL250ZEl0?=
 =?utf-8?B?QWpRWlRTbEszTWNNdVJQV0E1NjAzamhYZjRPVFRCVElZZ2FNalBDUUxGL2F2?=
 =?utf-8?B?c21ib1JiRzJhN2JtNSttckVjeWk1cDZPVVVlNjBiWmxTM0ZBQUNVL3V3M3o2?=
 =?utf-8?B?ZzUrdlBydEFRdG9DdFh2RTN2QjR5R25rZEU0ZDc2M3VPNWJ3QlFkdVQ4bitm?=
 =?utf-8?B?TTA3Y29zazByZmpCSDE5WWVJd2dLSmlYT28yWUplU20yZGNEbnY1MVNqSHdh?=
 =?utf-8?B?Z1BzeDQ4aWVNeWpYdk1vMUJyYm5GNUJSeFZZbkdVc21sRyswZGU4VStQNlU4?=
 =?utf-8?B?YlI5NkRKVFhOVGNKbU12ZDRMa3ZyNDlCTW43ZSs1NWxYZlc4UVBOVjBRREJr?=
 =?utf-8?B?UHRJZVBiL3VCWHhwYlhYYnhQM3UzRDNsSm9ERnpBK1ZKeGNvallXMXgwV0tW?=
 =?utf-8?B?bEcwb0FuVmY1VFBPajB5NStTZ3lvazJBUUNJbzA3TE1LL3JrTzl0WDNSNXl2?=
 =?utf-8?B?OVRFQ3l3cXpsZXcyRUpxTHpxY3o3dFVjeGprVEowdytqWExZZzZzZmxMdEdR?=
 =?utf-8?B?bGFUTlRMM2g5anc3L1lVbW1xTlE5eVFINGtSdlVkaHlCRDdSVGMxYy9SQmhS?=
 =?utf-8?B?b2M4eVR2aWtia2FuUkRhckx5ZjV6a3JSb2FGTWlDbjMxeW54bkFuMk5VMVZD?=
 =?utf-8?B?YXUwa3pQaU9Vbzk1bTh2UWRrYWlqUHJ3L2lEWlBJUzc5RlVFTWlKdkJteWJY?=
 =?utf-8?B?REVBd2JSYVUyemRrS0xWUHpiZ0dWd3pFZmxORW9xTW1OOUxUcUlJcytOZ1FY?=
 =?utf-8?B?VWRKd2lMUEdHdEMrQzhUd2JnRE8xUkx6V3NhWFM5UTBDRFMwcVNLcTdqQWY4?=
 =?utf-8?B?c29mK1RzMjJCaHFpc0pRMjRpdEZsdnUvTktGTFRvNkZJcVFiREViQUZkWnQv?=
 =?utf-8?B?S0QvWVFUUnQ2MzRBbWhLMS90eG5pTUs3dGM5UlRWSi9qSjNXK2J1cG5XYmNw?=
 =?utf-8?B?Q0ZiUjNWOXZLQlhPMWFseGthemxpWnphMFFMczE2c09lRVRhYkhqV0tUc2NW?=
 =?utf-8?B?THVad3FzMitUUlBUL1JTa2cweExBSHl3SllZbEE3YUtGbmlxQkxCcUcxTW43?=
 =?utf-8?B?ck1aVWZab293SUcyTE96Vjh0SmlxTWZMUURHM1Z6NWZvbHFRcXhEdWhzQUxU?=
 =?utf-8?B?blpEYjZDNEwvdVVwWDVwRjJWVThoWE0rMFJKU0lrVXh6dDBhUDlhWm90OWt6?=
 =?utf-8?B?clk5NFY5eEhDaW1lUzBGZVhmVEhUckxsdUpYVGZ0bVo1WDRKUXZrcCtONzls?=
 =?utf-8?B?RHhlZ3h2Q3JyOUU1cGliUEJleGYvU2xEWTJRU29mb0JlQlZnUWtQWWtHTXJp?=
 =?utf-8?B?L1h1SXl2dGlsODhsTVNFaDBmUmVud3pzWXhHOE5jMmwrTzVZb3BpYXFZOURL?=
 =?utf-8?B?am41WnkvaWZKVlJOTHpOcWtiZmxSTnUyei92Q1lhM0xRUmNCS0Ewa2c1VWFG?=
 =?utf-8?B?SEFoSVRlZkN3KzZtOE1SZU85NmVZNmRyT0VBUGkxZGtLU0prNXovWTlGZWdi?=
 =?utf-8?B?Z1ZTbWdRWjdZVlNvbFduclBBc25GS3A3eVRKVkMxc29NZlJaRS9aemY5bnFP?=
 =?utf-8?B?UXBUSEtSM3BrRnlhQUsxUE5laFg0Z2JqclAxSThmaE5vNDgrZHQ4VTUra0pB?=
 =?utf-8?B?RDVWaU5PTjUwKzhnbG9QTWxNVzhrNGdXQWg2SU91aXVhRjJaTDNkTWRhVHhQ?=
 =?utf-8?B?SXdWRDBET251NzNFL0hrY2RFZDdnWW4wTzlhaFNIMGRFaEk3Q2YvZVA2NzhJ?=
 =?utf-8?B?ekV2VDJKYTVRRjBSaFZtajRMWGVmdXlsQ3FmbTQzdDNTT0IxQlhDTWxMZzkv?=
 =?utf-8?B?OTZFVFd3ZXBkY2RBMFBtT2xoNVAzall6L3dDVnVib2FtVGhuTGFWRkFUdzBX?=
 =?utf-8?Q?1wvWeZrTYI5s8Oe3zGujtzIbH?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fab24ea0-9334-4dc1-4a24-08dbc51d048c
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB2941.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2023 21:01:02.7733 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OGpnN/8GlmGylS6oABnYKMlslEPMRZvOFcLG8sEr2U4H7TrbDPkMp5aflRthGKLW0WNCQ2QUDtAQjVpMuuv77g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6911
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
Cc: Leo Li <sunpeng.li@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Alex Deucher <alexander.deucher@amd.com>, Thomas Gleixner <tglx@linutronix.de>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 9/21/23 08:15, Sebastian Andrzej Siewior wrote:
> Hi,
> 
> I stumbled uppon the amdgpu driver via a bugzilla report. The actual fix
> is #4 + #5 and the rest was made while looking at the code.
> 
> Sebastian
> 
> 

Hi Sebastian,

Thanks a lot for this patchset. We tested it on multiple devices, and 
everything looks good. I also reviewed it and lgtm.

Reviewed-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>

Thanks
Siqueira
