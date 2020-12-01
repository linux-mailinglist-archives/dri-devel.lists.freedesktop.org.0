Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8B5C2CA83E
	for <lists+dri-devel@lfdr.de>; Tue,  1 Dec 2020 17:27:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 043E16E5A4;
	Tue,  1 Dec 2020 16:27:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2065.outbound.protection.outlook.com [40.107.244.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A49906E5A4
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Dec 2020 16:27:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c2uO0NiBl9qvKAbwUWm2OgToThN9Whh6+Qq5zpksvG+hUSElebQmccNnXzHIfpWG7NYPrGimFhxlJFdltqPwcIDCnTpfpZapu3cLIuNI1qcjfYsM/FJNSiLxkpG4pTFoYtQkLlJgcW/Kq6PWBxFcdIu33nl7l89rbPwmKhT+Tq6P9cWzVHPbd5GpqVBRqdRJmnllsYRjdMzIAkMiUOLO72daHVpBTu4GePTbZUwVnjwkYXfD4zSVxiFwFzUZKQXAknJk1zUSUUUjn7qEhkA1aoAyezXC9DRi2x/YPwF+JOw53ge7ZLe9DprmTmAX2Pbf4xEo5RDA5u8djY7Ie2qxRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yV71pQQFxoERARxYOtz7NgTfREKuICRKba8TQ5LsuHU=;
 b=nEBtHMLLJHONFaLsvERL1cgE3w4XwFL2V9YDYNunKmdTMZo8wnK2/42vOaADXzacZS35FXOw62d3wYwkPBEizy7oW/k/WpyKmZVZxvwgl3a8MgmYtCKlq7E35TYheWgl+Gs5vKKIyamjVqfhWFiU/gyczR7TnEnYcWKUcDzT0YpDrSqgogTPLLCAAYSOZTgOK7R7dmwspqRwUDgvBlk5YrCBA3BATsTKr2WqWyYdCsrZ5hU6hNIH+1q7hkRdmZ8oU143eNd292mC7jhM/eaELkMsvPZWyWxHbfdHOYb6MxYyjVBmGWtHq2Y2/KexlV/lLn6fYu1qcnXOOR9otlZkIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yV71pQQFxoERARxYOtz7NgTfREKuICRKba8TQ5LsuHU=;
 b=4KmxOjQv6Ib2q1SNG+JJJnWBucHJpjSnhYAVXTC4iA9lh8ubGreaA15QiDf1NZ4MN8vxn/P0bwHDDu7l2z6SUQtbm+3MVglDfAl5hL3Cespud9GPpTQeQtfeEpNcTVR0kSWIOcgRXScfWhvyXO9z8fG824jTo+PfVxbdBCLMFeA=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4520.namprd12.prod.outlook.com (2603:10b6:208:26f::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.31; Tue, 1 Dec
 2020 16:27:49 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::1ccc:8a9a:45d3:dd31]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::1ccc:8a9a:45d3:dd31%7]) with mapi id 15.20.3611.025; Tue, 1 Dec 2020
 16:27:49 +0000
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Subject: Do we have something like a kmsdump tool?
Message-ID: <0454017c-50e6-5276-0f3a-6bdde4245ccb@amd.com>
Date: Tue, 1 Dec 2020 17:27:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM0PR03CA0062.eurprd03.prod.outlook.com (2603:10a6:208::39)
 To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0PR03CA0062.eurprd03.prod.outlook.com (2603:10a6:208::39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3632.17 via Frontend Transport; Tue, 1 Dec 2020 16:27:46 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 7c96a4e9-c346-4075-e1f8-08d896160a57
X-MS-TrafficTypeDiagnostic: MN2PR12MB4520:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB4520E11587A15A2ACAEC207D83F40@MN2PR12MB4520.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: A0oecOSF1VmYI5xa6l7xCI3yBBpdhimXA155MofrELlK/Kn+JYQyxKW3GW4xjwbIZmN2wXPjeBRv1rb0amE0XAeYb4xMpWoIRRMzSSdaaVZpe8f1Dr9vlHczo7c7AbDcTZCuf6lcvDsjo+EwaA4NSYgsbBK0xbLPwHiMxbRt27G0ltCwbs3l9iTCWdgSXF46HPEULG2w3bJrfmqVeDupiC7MAULEI9ZKGPmO+CC1JxjgeYCvil4QSbbyRQrvL+IwBoGLIyYrZ2KABE9tbSiyACb6k0LGRhgZ1cRmy2PFYr8gKuk9PQxtgLc2l7pckrEc7FJ/9zE0eIgctbI/9W2RCgiCs5Z2lXedxwM31RFUEWw/0zABFssjdPULogcaO0mK
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(346002)(366004)(39860400002)(376002)(396003)(6666004)(52116002)(2616005)(86362001)(316002)(66946007)(66476007)(66556008)(31686004)(8676002)(54906003)(6486002)(8936002)(4744005)(186003)(36756003)(4326008)(31696002)(2906002)(16526019)(6916009)(5660300002)(478600001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?NnRFTXVVTnh4TWkxN2QrUXpjZDhNOGRrQUNBQmpXd3ExdFNaSE1UOUwvamM4?=
 =?utf-8?B?dDBTcmgvTzVWbnRENGQzMThlU1JEWFRwKzl6WjNjL3phV3BUMU9LWVVRZmpp?=
 =?utf-8?B?SjhZOW5VOElCVU84b0xnMFZtZ05YTWxQckRsbVowNXIyN1UxOCtwVlZaR2RL?=
 =?utf-8?B?VnFYTXYrQkZoU255UDF5dHAvRXU2YjVaeG0vRHd6NnVKNGNTZEFjOXpISEJD?=
 =?utf-8?B?ZE16YnhlVytlaXBsSGh2aU1mcm9BZXpKWUxITGsyQVZuZjFObE5UTXpLcURX?=
 =?utf-8?B?TFpCbnU0b3lUK2kwejNuWXB2eGowSU9rc3JJV0YwTmpjWlRkVW5LcFRnemQ2?=
 =?utf-8?B?b3RaS3VOazdianVrWlZTQkRocFVRSW9yekxDb3l0Z1A0UGVBYlhPL0lkZmZn?=
 =?utf-8?B?Q3M4ak1zUkFFQTFVbURYS1llNkZONXFDa0poVUJXUGYwVU11djBRUmFTS1hY?=
 =?utf-8?B?RmRlREV1RlRqZ2puSGxEN1c2V1Y4NDNNOWZvTStFZzNWQjRkWW0xSzEwMitG?=
 =?utf-8?B?NEh3amU4MDZQVkxEZ3pqdkdUMUd2Zk9kYS9TWnEzV1NjbFVlLzlJSDVjM1o2?=
 =?utf-8?B?cUVZNXZSb28yOG5UeGMrbHpuaGdocVZlMGF0VTg3SnVOWTNta0pQVldvclFK?=
 =?utf-8?B?MExIYjRnb0xOZ1QzUDZzZkNsSkZ0U2xjR0svaE1ONGZRdFV0SnZUOWJGa0xt?=
 =?utf-8?B?VmsrVlI2V21XSEhEOGVwTFlMUUJ0andFa1RaMXhzQ01udkMzVnRITWN4ajBT?=
 =?utf-8?B?dlNjeU02WXNYK1VzN2ZxdUltcFZKZ1c0TmkyeTdqSlY2MjNINkl3THJLMjlS?=
 =?utf-8?B?RFZ5ZzBUWURlWHROV2s0RmdhSi9CRXlya3hYVmVOWXpqS0JJeXhhem00RGlw?=
 =?utf-8?B?ZHZ5ODIzYy9BZzdZbWV3ckJsQ2FiRWtKOUlkNjZVektyYVdHU1VCK2RyaGY1?=
 =?utf-8?B?YmwwdExyYXk5YjFZaUhBcklKQUxLQzA4azlpNWNSQjJoNjlZMmdhZ3ppWlJO?=
 =?utf-8?B?ZCtVN0lHSFpJVENKNGhsb1dLYm5SekRha1IyNmdaWGNBUHJmRHYyQW9zbDdh?=
 =?utf-8?B?RUk1OVJ1YXp0UXVTSG01WG11SGE5YUx4YUd0OUQ4clhNU0JZZm95UE1uTW5t?=
 =?utf-8?B?U0pyYUJKZHY3c3hKcFB3bXgzYzN5d2FFbFZMSUhPYjVyRnl2M3R1c1JsdzBm?=
 =?utf-8?B?SnV2SUdISkNIVnRJNWtRN25CcWR5aFhDWW5aRDNoNkNaQzJJMEd2TGR0a1g4?=
 =?utf-8?B?eUF6bUtaR1hVL0UyaTNEZ0w0T0RKcVBoY21NZHhHQndWdDBtZGYrditWemk3?=
 =?utf-8?B?dEIrYlhNWGdpZWFMVnYxZ0ZMUWJCbU4wd1dwSWNwa1JRbmo3aSt1YmVIT1hK?=
 =?utf-8?B?cGNsb0p6ZUN3NStCelhGbUpTN285dEtKVW8xSGkrOGp1VWtGbGVWQnlmeGJn?=
 =?utf-8?Q?Pz8Oc+ls?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c96a4e9-c346-4075-e1f8-08d896160a57
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2020 16:27:48.8918 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ViCCXbHk0kV6lbkkGf99ZqSpm8CsVQ4UYV3TMtE/AZxX/jEg8NdHm0roK8OgapMX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4520
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
Cc: Alex Deucher <alexander.deucher@amd.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi guys,

we are currently debugging a problem with some on screen artifacts and 
I'm wondering if we have some sort of kmsdump tool already?

E.g. similar like kmsgrab which gets a reference to the DMA-buf file 
descriptor which is currently displayed and then mmaping that or 
importing it into VAAPI or stuff like that. But instead writing the 
content to a file for debugging.

Thanks,
Christian.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
