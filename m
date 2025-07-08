Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05664AFCB3E
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jul 2025 15:02:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E860310E631;
	Tue,  8 Jul 2025 13:02:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="h8I5HqMC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2076.outbound.protection.outlook.com [40.107.223.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75D0D10E18E;
 Tue,  8 Jul 2025 13:02:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LO0fHmTRN1QoeW9MJVzmkeYqdA1LI4gwrs4u/wvfmAvYePAacWzViglQqRsFGIovSTi+TGlvh4hxO9m8Cg+B0lbu+KQ2/NTdsXqAHE9+RqGdo1WPwC7MDw/9gbleeM42niyWeKRmW42zF0rsFwADL/x4HDV5HyQ2203CcSoBgjVH/d2lZOjm+BlnkjN1CkMxS/PNw+ycBxUwt2l3DhR0Fznt7mpJPbLADdQbT2pUSKySC+tKkKcUm4ehKDU5+5PDlahxb2R6dxPDJdtUW3EI2xiQUYY5ah8bESlDUj1+g8wgfv2PjbL8Vo99kgtLNnNNZ2xrcar6Q0/7DXxXGWGeBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s+WbBnC7hxIhuJja288ezwiMyvobybwBx96YIV7X8bk=;
 b=Uw8X7buPgMjCL/e9ERj3k/yLPSt/iIXG0SHjDz6AivXECszeA+fgHYJMKvmIK1kwAjozGHp/DB5SyA1mMmYz8NMspikZKeDqTy6k4RkghKwAelzEDI4uQ1NuX5rHKnJxvKDA6DkmeCI9mCH2t0A8NFac2ped8SAWLb0UusyQ6evw7UsSut+ynU7mUXy1oIgixcoZHe61I7Ns28cVzNxyRKJq+MWmNcHK5MKbW66jD4sT1A13HWNGRti6M5LTaJAmIBfXBiOyUa7cnWyQmAsllZcJ3DmOMGDeCPM05IQzxeIwJ/hT6gt5bUFHJ4ZNinBvP/R0CII9Z2THLiyqDQR7jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s+WbBnC7hxIhuJja288ezwiMyvobybwBx96YIV7X8bk=;
 b=h8I5HqMCAcz/LFZxS+uInn9mt84Pwdf6qIAmG33BHFYinqE7qecPm9BSSsC8DoWp6JeFrLTtzK/2LXDOrTGjeTNU4SKf3fu9dJoSNe6kYZXe6H70Er5YzI7m8lPTnGmwgJcH9ktpuIiC7sUcH90eDsk1gkSUTUkK3QJaBPoFnyw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by PH8PR12MB6723.namprd12.prod.outlook.com (2603:10b6:510:1ce::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.25; Tue, 8 Jul
 2025 13:02:06 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8901.024; Tue, 8 Jul 2025
 13:02:06 +0000
Message-ID: <93c27eec-3c4b-4897-ae85-a2eed266a6b7@amd.com>
Date: Tue, 8 Jul 2025 15:02:02 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 14/15] drm/sched: Queue all free credits in one worker
 invocation
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, dri-devel@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 kernel-dev@igalia.com, Danilo Krummrich <dakr@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>, Philipp Stanner <phasta@kernel.org>
References: <20250708095147.73366-1-tvrtko.ursulin@igalia.com>
 <20250708095147.73366-15-tvrtko.ursulin@igalia.com>
 <cb140d4e-01cd-4cd7-bd7c-5c10b44cf98f@amd.com>
 <95da8a36-8231-4578-ae74-35c8ba7f6972@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <95da8a36-8231-4578-ae74-35c8ba7f6972@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0177.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b7::14) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|PH8PR12MB6723:EE_
X-MS-Office365-Filtering-Correlation-Id: 383d3e19-2b32-44a9-105f-08ddbe1fa3d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?d29uWTdZSVIxS2RMQ0ZIMDR2K2NBMDkxcWc3NGhobHIxSGw3WHE4UzNiRVJD?=
 =?utf-8?B?cG9sSUk3V0lRbit6RzRQMkhMNTZ3SjlwaU1yMUZUUTMzTnVFU2VoN3dqRDBl?=
 =?utf-8?B?ZVplOUJwN1JlVjJJWUpCRzk0L1lSbU9qOTFSR3BHaGlzWmx1QWVCMmpBVFVp?=
 =?utf-8?B?K2dpNENFZjhSZDc0Ymt6T2NZR24vL05OVW55MGNhWFNBMmtqdFFYL1lTVytG?=
 =?utf-8?B?R25LMGd0bmM3Q1hSdndqcWxQelBrYkxJTjVYWUJ4bHhpZXVZZS9FZGo0NmNY?=
 =?utf-8?B?ZGNTSHJ1MUhsVnl1ZWNub0lVQU5kWTk3bUZFSk04QVhtTHNWTTQzdGhDaU9k?=
 =?utf-8?B?TENUcEtvN091em13MGdEb1ZnQmd2S2xUNUpiZWZuZWkxRXJXekRYUGxuYXFO?=
 =?utf-8?B?VlZsYjdzMitTR3JPMEczV3RuaVFTanJYQ2ZJZCsyeFRUaWRuQXUycko4RFE3?=
 =?utf-8?B?eHJVQ09RYmx0QlZtNWhWR3BOOUJ2YjNjdFRyVHRaVnk1UWI1T3ZVNUpMdFk2?=
 =?utf-8?B?eHZyclcxOFlYamRKN0xJd2pzWEFBTnlUdGxLM1c5MDdaVkc3YjZTZG1Nb0NW?=
 =?utf-8?B?S1pSWUFMbzA0UFBYRk1FR0k4dEVmbVlMWlArZ2ZCQU1sSkd0dHFJSWxtTXdi?=
 =?utf-8?B?WXBad0RMN21IeEoxQXRybmlJOEU2Rm9xQmt6cUN6Q3pNQUFka2tCc3JQRWdq?=
 =?utf-8?B?SnM1Q2FLYUV5KzV4WGlaanFrOCtOUE9CNjFJTGJkbitXckhBNVpueWJadHVB?=
 =?utf-8?B?TUZLcGpXTi9iZ3JNU2hZWmtZdWlJTldES1pjNW85VHl6dWNPdnNmMmZmbTZS?=
 =?utf-8?B?aFBSeExrdjRGSkJ2T0ZQY1llQS9oam1jMEMwNnk3YmpEQ2cyektjZjlYZzla?=
 =?utf-8?B?S0txRnVFTUFrWDZUSkg0bEY4Rk1lTkFZUnAvR0trTnRJcDVnVHJueW03S2pO?=
 =?utf-8?B?WEhuWjFBV3YveG16dXNSd2lPbHRtR29qTDlWREJYemZHWXRKL2k2dzIwWmo2?=
 =?utf-8?B?T0JMZkRJQzJ5NW5uVEJ5TVZUbHRRaUZJSWc0MU1heWVxbXJic2lhMzJVUjg2?=
 =?utf-8?B?dEhsMGM2eFBPeEt4VkwwSHVGd3MyVWtpa1BycWVkc242SDVpWGloRERodmsv?=
 =?utf-8?B?NlY1aWJHYmhNdnhxZGJjYmN1SStOMUM1YjU2ZGQyZ0JYbjIrTnJPajZTREti?=
 =?utf-8?B?VFFMZFNxVERZMkUxYm9LQmZhNWk0OVpUclM5RlJ2RTRHdy9obGJZcngrRkRo?=
 =?utf-8?B?VmtXVWFrOGp0Zjc3ZlMvWlNFWmU1N0xrL25USVRZa1FRWlFpUnJka3YwVGNi?=
 =?utf-8?B?Qzd1NDNHRDFQcEZVRUtLeWZCRHg5d3ZTVHJnOG1kdE5LZmk0eHl3NTJ4UFBO?=
 =?utf-8?B?Q3ZlempwV3NTU1loWWhQTWsyS2tqa20wQkwvYlg1STBSY21xbVRLaHRGMnNB?=
 =?utf-8?B?YzFaclRCWkcwN0lDa21JbGRST281MU9RWEx0U3B4TVpLVGFwZ3hndmdybzg2?=
 =?utf-8?B?UXZsK2xFYUZjdnY1NmhlYTU0Q24zWUlHS3hDM3Rwbm5Ed0p4R2c3VGpVc2NN?=
 =?utf-8?B?WU9TNEJyR3VNT0ZKQW9Zbm8zdDFORjE1RWJzS3hmM1pOUXNQYW8ycUFFMUNY?=
 =?utf-8?B?blN5VktBK0UyVzJ3N0daeXMzM1RlcmhiNjVaUW5KRVg5RlJFcDM0SUZRbyty?=
 =?utf-8?B?b3ZzQlpnVDlTODI0bFJDcW53eFpGeXJmT0hYV0dja0ZOb2FQck9kUGlpUTEw?=
 =?utf-8?B?eFhSbkFIYzM1aGNBcmxRUTlVREJ5QUZwQWtYNjVla0FXK2cwNk9Tbk44emdp?=
 =?utf-8?B?OUNwZE1YVkNzWHhmUEVTT1lRRWp0WXRvZlBSM1REMGNlRmwwZE9lRjYwS2o5?=
 =?utf-8?B?dVE0dGcrMnRsSVVYeCs3ajdBZmRUQzFNRDFLeFJITzVKUkE1dG9Ka2owWlJi?=
 =?utf-8?Q?BETvjsm038o=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z1R4TWQ5blJWZnN3YW9HZXlKUFlHVU0ybEZoci9ITm9VMkwrRDg0b24vUmI2?=
 =?utf-8?B?NklEV1IxTTZlNytyQkI1TmgyRkhXK3hFbm9iS3RIcEs4cGRsdkpLdzd5M090?=
 =?utf-8?B?MDMxendlK00rb1IxaVVXZFJJaXZjY3pXcVQ5R3p3ZjJwZGFSOUNCQTc5eFEw?=
 =?utf-8?B?U0V1aUdHZlhZdkhUbDdJVUkwanRxT2hMWFg3bDVvUzBiTzYzLzhHWllUbHRU?=
 =?utf-8?B?anRWU2dEZVY3UFpraXJTbnRFK0ZSMFdLejN5L3F1YkZZVVM5STQ2QUMzREp5?=
 =?utf-8?B?cE9pNlVyNGhHajQ0N09MdS9leHpaZE94bkZLQ3ZreUVENlFaZEFLYytNM3Vk?=
 =?utf-8?B?MmhnWUZDTFVOczJRd09BSVVuK0d2ZXBjRkgxSnJSN0RUN3VqcHZ3WnNhYndi?=
 =?utf-8?B?d05uVDBhSXdhcFVoRFlTSTF4VmNJZjJJZUg1a25JS012U0FZTThibVNwdnN3?=
 =?utf-8?B?VnRXQWVwVklYQW1mbGxBYzNTRmdIcFNscEtENHFQWU9QVFRHODFNREI3eFcw?=
 =?utf-8?B?VndicXZHa1RNajRwSUJRMmZUcTBNWXVhU2NpeVFDNjl5SG92VDd2aHJJVzNI?=
 =?utf-8?B?SDl3VHFvWk0vbEZoZEkvazBnVHpzQ3p4SmZyTFZMVStYbnorSXloZXNrSWEv?=
 =?utf-8?B?L3AzSFR3Mit6VjM4S2NUb3JRenNyY3l6anI0czIwdnBHSm16MFEyS0pLaTdW?=
 =?utf-8?B?TzhkR2ZvclEzQXg2elY2Tk5EN3lzZFNPcFFEQzRBK3QyYlVSU3pmY0lEbkY5?=
 =?utf-8?B?MFBod0RLUzdXYXhXMnF4OVJsWm9udlVaVnJRYzlVRkY0U1krZDhpUEdYeVBI?=
 =?utf-8?B?RHJZN1ZiZGE5V2tVTU9HMUlmOXQ2MXpodlVobWlPMjYwR0xSa1VPVTlISzR0?=
 =?utf-8?B?Q2hJai9HQk12SG1oUXc2UWRaZ0NMdEpwUTJkMGk2NWwrOHcvek8xNjZYbmNS?=
 =?utf-8?B?bFZKTlFLdmZUNS9DNFp5enFGamhoS2M0ZWhaTVU2WTNRREtidVJoSmhIclR6?=
 =?utf-8?B?MEhRUWJ4ZytCMlYzcEN3eDBrcW15d1VBUHdGTTFEeklNSGcvUmN6QXAvdWo2?=
 =?utf-8?B?YVQvNy9vMW96TXBZaThkck9PN0VSMVBicmpjUHZ1NWFwdkdBQUdHUGhObXA5?=
 =?utf-8?B?RmFrMEVMQnJpUGd0U2l4eHpsOC9EWThhY0JBRmlmNjNrb2dad3lTQVY0aGQv?=
 =?utf-8?B?cWVuNkY4aUsxZ09BN01JcVRFT0I5VXVEc3BRdTNjMGxXK3NiMDBWWnI4REYw?=
 =?utf-8?B?NHZCQ2t1UncvVmd0TDNJZytsVzJHYkhUYVVGODFnZ3FCZW9hUWJSTVB0ejlz?=
 =?utf-8?B?MTdsdi80TGVQUGdIU1h6WndYZENwOE5TblNkb1FmdThjM1JyWDJPTkkyY1Iv?=
 =?utf-8?B?b3QwMWs0bXZ3bitucGhpYjF4RDEwYmVHOTc4Z3NPMjNiQjRnU3F2WWYxZDZ6?=
 =?utf-8?B?QW1qNXRIN0ZYZGIrL3NDZjYzM0thMm5CQWk2a0cvMkxOMkwzYUlPanhvMkpO?=
 =?utf-8?B?Njl4MU9BR1J0YTV6NGZwRFZnalgyS1BkZFRKc1hnT29IRGRiYm14d1gvYndr?=
 =?utf-8?B?aXhPdFFNd2x4WVExS1grT0NHd2ZqQlJRYndGRDcxM1FpNlpacWlFSGdMaTlO?=
 =?utf-8?B?d0hnVmNwOG1GYzBZMlNudXRRUzlOL25sZnpTRHdBa0QwcWJIT09KMCtla2wv?=
 =?utf-8?B?Z1NqY0hnM2JKYXFOUVg5S01sQ3dGbnFiMG9weU5ZZWtlcmxRSzd1Wm95MTN3?=
 =?utf-8?B?UkQ1b3crSG5PdDNLUFpoOEtzdHBmdWtHR09VUTRLSG1KUHd0bVNBYTFBMlQ2?=
 =?utf-8?B?TXhnODJNQXhYZ1BzVzZIcjhQQnppVWdDRXB1QUJzeDFpR2wwL3JOa0xtREEx?=
 =?utf-8?B?ejJDYzB3QVA3Y2dqSFVrZlJlcm5wRG1qU05DUHlySTRNWGN3S2MzVWNuS1Q3?=
 =?utf-8?B?NEZjeEZGRy9HRGtpRWpWdXhHczYxMUFTQ1JJdENCKzFSTWlXN2lXWHliUlVy?=
 =?utf-8?B?aWZCQWp2bGUrT01MNFFpM3BCRDZOQkN3Yml4ak1XbjFJRll0anNUQUlNcEhx?=
 =?utf-8?B?V0xaeGJDRVdBOEdSbFAyNGN0VlJIc0xVMmZTZjRyN1ovNTJVY1h6NUtpaEQ0?=
 =?utf-8?Q?Kd/6dvoNql0+GahlqdRaB8fFN?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 383d3e19-2b32-44a9-105f-08ddbe1fa3d8
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2025 13:02:06.1547 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k1UqHuc0XkISYhkTPfmOuxUF4+6DgRO5spShXMU50Vix55kjnHjdV9N7rpQnH+vT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6723
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

On 08.07.25 14:54, Tvrtko Ursulin wrote:
> 
> On 08/07/2025 13:37, Christian König wrote:
>> On 08.07.25 11:51, Tvrtko Ursulin wrote:
>>> There is no reason to queue just a single job if scheduler can take more
>>> and re-queue the worker to queue more.
>>
>> That's not correct. This was intentionally avoided.
>>
>> If more than just the scheduler is using the single threaded workqeueu other workers, especially the timeout worker, can jump in and execute first.
>>
>> We explicitely removed submitting more than one job in each worker run.
> 
> I wanted to ask why, but then I had a look to see if anyone actually does this. And I did not find any driver sharing a single threaded workqueue between submit and timeout.
> 
> The only driver which even passes in the same workqueue for both is PVR, but it is not a single threaded one.
> 
> Or perhaps I misunderstood what you said. Could you please clarify either way?

You correctly understood that.

The argument was that submitting more than one job in a worker is simply not beneficial and other work items can jump in and execute.

I have no idea if that is actually used or not. You would need to dig up the discussion when we switched from a kernel thread to work items for the full background.

But in general to do as less work as possible in each worker and then re-submit it is usually a good idea.

Regards,
Christian.

> 
> Regards,
> 
> Tvrtko
> 
>>> We can simply feed the hardware
>>> with as much as it can take in one go and hopefully win some latency.
>>>
>>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>>> Cc: Christian König <christian.koenig@amd.com>
>>> Cc: Danilo Krummrich <dakr@kernel.org>
>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>> Cc: Philipp Stanner <phasta@kernel.org>
>>> ---
>>>   drivers/gpu/drm/scheduler/sched_internal.h |   2 -
>>>   drivers/gpu/drm/scheduler/sched_main.c     | 132 ++++++++++-----------
>>>   drivers/gpu/drm/scheduler/sched_rq.c       |  12 +-
>>>   3 files changed, 64 insertions(+), 82 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/scheduler/sched_internal.h b/drivers/gpu/drm/scheduler/sched_internal.h
>>> index 15d78abc48df..1a5c2f255223 100644
>>> --- a/drivers/gpu/drm/scheduler/sched_internal.h
>>> +++ b/drivers/gpu/drm/scheduler/sched_internal.h
>>> @@ -22,8 +22,6 @@ struct drm_sched_entity_stats {
>>>       u64        vruntime;
>>>   };
>>>   -bool drm_sched_can_queue(struct drm_gpu_scheduler *sched,
>>> -             struct drm_sched_entity *entity);
>>>   void drm_sched_wakeup(struct drm_gpu_scheduler *sched);
>>>     void drm_sched_rq_init(struct drm_gpu_scheduler *sched,
>>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
>>> index 35025edea669..1fb3f1da4821 100644
>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>>> @@ -95,35 +95,6 @@ static u32 drm_sched_available_credits(struct drm_gpu_scheduler *sched)
>>>       return credits;
>>>   }
>>>   -/**
>>> - * drm_sched_can_queue -- Can we queue more to the hardware?
>>> - * @sched: scheduler instance
>>> - * @entity: the scheduler entity
>>> - *
>>> - * Return true if we can push at least one more job from @entity, false
>>> - * otherwise.
>>> - */
>>> -bool drm_sched_can_queue(struct drm_gpu_scheduler *sched,
>>> -             struct drm_sched_entity *entity)
>>> -{
>>> -    struct drm_sched_job *s_job;
>>> -
>>> -    s_job = drm_sched_entity_queue_peek(entity);
>>> -    if (!s_job)
>>> -        return false;
>>> -
>>> -    /* If a job exceeds the credit limit, truncate it to the credit limit
>>> -     * itself to guarantee forward progress.
>>> -     */
>>> -    if (s_job->credits > sched->credit_limit) {
>>> -        dev_WARN(sched->dev,
>>> -             "Jobs may not exceed the credit limit, truncate.\n");
>>> -        s_job->credits = sched->credit_limit;
>>> -    }
>>> -
>>> -    return drm_sched_available_credits(sched) >= s_job->credits;
>>> -}
>>> -
>>>   /**
>>>    * drm_sched_run_job_queue - enqueue run-job work
>>>    * @sched: scheduler instance
>>> @@ -940,54 +911,77 @@ static void drm_sched_run_job_work(struct work_struct *w)
>>>   {
>>>       struct drm_gpu_scheduler *sched =
>>>           container_of(w, struct drm_gpu_scheduler, work_run_job);
>>> +    u32 job_credits, submitted_credits = 0;
>>>       struct drm_sched_entity *entity;
>>> -    struct dma_fence *fence;
>>>       struct drm_sched_fence *s_fence;
>>>       struct drm_sched_job *sched_job;
>>> -    int r;
>>> +    struct dma_fence *fence;
>>>   -    /* Find entity with a ready job */
>>> -    entity = drm_sched_rq_select_entity(sched, sched->rq);
>>> -    if (IS_ERR_OR_NULL(entity))
>>> -        return;    /* No more work */
>>> +    while (!READ_ONCE(sched->pause_submit)) {
>>> +        /* Find entity with a ready job */
>>> +        entity = drm_sched_rq_select_entity(sched, sched->rq);
>>> +        if (!entity)
>>> +            break;    /* No more work */
>>> +
>>> +        sched_job = drm_sched_entity_queue_peek(entity);
>>> +        if (!sched_job) {
>>> +            complete_all(&entity->entity_idle);
>>> +            continue;
>>> +        }
>>> +
>>> +        job_credits = sched_job->credits;
>>> +        /*
>>> +         * If a job exceeds the credit limit truncate it to guarantee
>>> +         * forward progress.
>>> +         */
>>> +        if (dev_WARN_ONCE(sched->dev, job_credits > sched->credit_limit,
>>> +                  "Jobs may not exceed the credit limit, truncating.\n"))
>>> +            job_credits = sched_job->credits = sched->credit_limit;
>>> +
>>> +        if (job_credits > drm_sched_available_credits(sched)) {
>>> +            complete_all(&entity->entity_idle);
>>> +            break;
>>> +        }
>>> +
>>> +        sched_job = drm_sched_entity_pop_job(entity);
>>> +        if (!sched_job) {
>>> +            /* Top entity is not yet runnable after all */
>>> +            complete_all(&entity->entity_idle);
>>> +            continue;
>>> +        }
>>> +
>>> +        s_fence = sched_job->s_fence;
>>> +        drm_sched_job_begin(sched_job);
>>> +        trace_drm_sched_job_run(sched_job, entity);
>>> +        submitted_credits += job_credits;
>>> +        atomic_add(job_credits, &sched->credit_count);
>>> +
>>> +        fence = sched->ops->run_job(sched_job);
>>> +        drm_sched_fence_scheduled(s_fence, fence);
>>> +
>>> +        if (!IS_ERR_OR_NULL(fence)) {
>>> +            int r;
>>> +
>>> +            /* Drop for original kref_init of the fence */
>>> +            dma_fence_put(fence);
>>> +
>>> +            r = dma_fence_add_callback(fence, &sched_job->cb,
>>> +                           drm_sched_job_done_cb);
>>> +            if (r == -ENOENT)
>>> +                drm_sched_job_done(sched_job, fence->error);
>>> +            else if (r)
>>> +                DRM_DEV_ERROR(sched->dev,
>>> +                          "fence add callback failed (%d)\n", r);
>>> +        } else {
>>> +            drm_sched_job_done(sched_job, IS_ERR(fence) ?
>>> +                              PTR_ERR(fence) : 0);
>>> +        }
>>>   -    sched_job = drm_sched_entity_pop_job(entity);
>>> -    if (!sched_job) {
>>>           complete_all(&entity->entity_idle);
>>> -        drm_sched_run_job_queue(sched);
>>> -        return;
>>>       }
>>>   -    s_fence = sched_job->s_fence;
>>> -
>>> -    atomic_add(sched_job->credits, &sched->credit_count);
>>> -    drm_sched_job_begin(sched_job);
>>> -
>>> -    trace_drm_sched_job_run(sched_job, entity);
>>> -    /*
>>> -     * The run_job() callback must by definition return a fence whose
>>> -     * refcount has been incremented for the scheduler already.
>>> -     */
>>> -    fence = sched->ops->run_job(sched_job);
>>> -    complete_all(&entity->entity_idle);
>>> -    drm_sched_fence_scheduled(s_fence, fence);
>>> -
>>> -    if (!IS_ERR_OR_NULL(fence)) {
>>> -        r = dma_fence_add_callback(fence, &sched_job->cb,
>>> -                       drm_sched_job_done_cb);
>>> -        if (r == -ENOENT)
>>> -            drm_sched_job_done(sched_job, fence->error);
>>> -        else if (r)
>>> -            DRM_DEV_ERROR(sched->dev, "fence add callback failed (%d)\n", r);
>>> -
>>> -        dma_fence_put(fence);
>>> -    } else {
>>> -        drm_sched_job_done(sched_job, IS_ERR(fence) ?
>>> -                   PTR_ERR(fence) : 0);
>>> -    }
>>> -
>>> -    wake_up(&sched->job_scheduled);
>>> -    drm_sched_run_job_queue(sched);
>>> +    if (submitted_credits)
>>> +        wake_up(&sched->job_scheduled);
>>>   }
>>>     static struct workqueue_struct *drm_sched_alloc_wq(const char *name)
>>> diff --git a/drivers/gpu/drm/scheduler/sched_rq.c b/drivers/gpu/drm/scheduler/sched_rq.c
>>> index e22f9ff88822..f0afdc0bd417 100644
>>> --- a/drivers/gpu/drm/scheduler/sched_rq.c
>>> +++ b/drivers/gpu/drm/scheduler/sched_rq.c
>>> @@ -197,9 +197,7 @@ void drm_sched_rq_pop_entity(struct drm_sched_entity *entity)
>>>    *
>>>    * Find oldest waiting ready entity.
>>>    *
>>> - * Return an entity if one is found; return an error-pointer (!NULL) if an
>>> - * entity was ready, but the scheduler had insufficient credits to accommodate
>>> - * its job; return NULL, if no ready entity was found.
>>> + * Return an entity if one is found or NULL if no ready entity was found.
>>>    */
>>>   struct drm_sched_entity *
>>>   drm_sched_rq_select_entity(struct drm_gpu_scheduler *sched,
>>> @@ -213,14 +211,6 @@ drm_sched_rq_select_entity(struct drm_gpu_scheduler *sched,
>>>             entity = rb_entry(rb, struct drm_sched_entity, rb_tree_node);
>>>           if (drm_sched_entity_is_ready(entity)) {
>>> -            /* If we can't queue yet, preserve the current entity in
>>> -             * terms of fairness.
>>> -             */
>>> -            if (!drm_sched_can_queue(sched, entity)) {
>>> -                spin_unlock(&rq->lock);
>>> -                return ERR_PTR(-ENOSPC);
>>> -            }
>>> -
>>>               reinit_completion(&entity->entity_idle);
>>>               break;
>>>           }
>>
> 

