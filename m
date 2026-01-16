Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D97A9D2EE1C
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jan 2026 10:40:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C3D810E042;
	Fri, 16 Jan 2026 09:40:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="4UoscEXZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012065.outbound.protection.outlook.com [52.101.48.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDFAC10E042
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jan 2026 09:40:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ekAYRBsH13k2PLbECEPeKP+L4ofS+i0owFPzwBjaXGCFCch3CHCCPaZh3mgUeBcJFS9IrOMKbN5VDQ4Mnpi2u1GT0NkzEiIfthBJgz1n7uBZMdpgl7T06m6b2RQZneJcUMwav8bLeQbm878GRow1gE3vm3yck7QU9WuAotvS4bKz8EbYh7m5PvxSa/klC2m09y/mhjJTxUi1pSQ2eyz2Tw20N99Zszx79X9vCJuH/b21LXevL0w9mMLGNEo/fGLbV93X747761KuGC5/7Lf7cy75Akdykudge78GYpS6MRzOuQ2Fqm83IYY8bCY/5tdH9aKUGMTImEfEk4sO4fhBwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nlo6wFvuUsoWCmUuTtLm6Z81rvtEBJKJ/x47D6+EtvA=;
 b=KIMI3YfTaaivFMd5byjvLwmqm8AHidHcZgbyA+i6nkWcZj81y4qe5ploqQjfCIC9FeIhWMxzh//Wj5+eVNaC5j1glRk9owYoktKy6DaRxrcQA52NTo/uM4bOLMFUxk2GQcmjjinOr5nrEwWN3D1AygVh1T1GnSJ7Z9EdjbVSdqzQAm7O1z8s8RYjbIlhP+8pBoubM22yTm0vs9ys5wGw1s2c6JxxdQ4WrKJqVN86X5ADKh0VtHqPLMyHGPlbc0TIHOTxmH+j5nPl37eRrKGQunEoHkkpoUMhhflFWPps86fQ5HDlJcfmk8zheNkxOaFZZOBhlxeLCmZgEEE0no700w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nlo6wFvuUsoWCmUuTtLm6Z81rvtEBJKJ/x47D6+EtvA=;
 b=4UoscEXZ18YrzS6fwCWz7NzKW6TDEoiGPpmNnW6PAOjolgFRB/p57wvnxUmD1ltLxPsMvx0pacSieq9rHdGl06rwhp3jxG1cGKpDBr4bYT6rp5kreh7B27OH+pO8hM13h2IYcYiSqXwBhG2ZhrBwD1/BthAwGgnAhl5svkFGApg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from IA1PR12MB6435.namprd12.prod.outlook.com (2603:10b6:208:3ad::10)
 by DS4PR12MB9585.namprd12.prod.outlook.com (2603:10b6:8:27e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.4; Fri, 16 Jan
 2026 09:40:06 +0000
Received: from IA1PR12MB6435.namprd12.prod.outlook.com
 ([fe80::8b77:7cdb:b17a:a8e2]) by IA1PR12MB6435.namprd12.prod.outlook.com
 ([fe80::8b77:7cdb:b17a:a8e2%5]) with mapi id 15.20.9520.005; Fri, 16 Jan 2026
 09:40:06 +0000
Message-ID: <4aff513b-eb38-494d-a4f8-78dbc18d0062@amd.com>
Date: Fri, 16 Jan 2026 17:39:56 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/5] virtio-gpu: Add userptr support for compute
 workloads
To: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
Cc: Gurchetan Singh <gurchetansingh@chromium.org>,
 Chia-I Wu <olvaffe@gmail.com>, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux.dev, linux-kernel@vger.kernel.org,
 Honglei Huang <honglei1.huang@amd.com>, David Airlie <airlied@redhat.com>,
 Ray.Huang@amd.com, Gerd Hoffmann <kraxel@redhat.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Simona Vetter <simona@ffwll.ch>
References: <20260115075851.173318-1-honglei1.huang@amd.com>
 <5b66df7d-374c-4e9c-88d5-bb514f9a7725@rsg.ci.i.u-tokyo.ac.jp>
 <2ae03f22-740d-4a48-b5f3-114eef92fb29@amd.com>
 <cc444faa-af80-4bab-ac3b-a013fef4a695@rsg.ci.i.u-tokyo.ac.jp>
Content-Language: en-US
From: Honglei Huang <honghuan@amd.com>
In-Reply-To: <cc444faa-af80-4bab-ac3b-a013fef4a695@rsg.ci.i.u-tokyo.ac.jp>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: KU2P306CA0057.MYSP306.PROD.OUTLOOK.COM
 (2603:1096:d10:3d::11) To IA1PR12MB6435.namprd12.prod.outlook.com
 (2603:10b6:208:3ad::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR12MB6435:EE_|DS4PR12MB9585:EE_
X-MS-Office365-Filtering-Correlation-Id: 73c07903-932e-412a-42c2-08de54e33b15
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NVVtTzNnUFVOZUFxMEpWSE03M0pqaVhjM1VVdlJEL3FNaTR1V0gxNy8zemFP?=
 =?utf-8?B?OVpTVFFac3lHalRmdi9kem0xenRwWTdML2EwbWRPM2J4S0VPcW9DUndMVlB1?=
 =?utf-8?B?bjRRc1B3RXZrK0djWlV3UnQrbnN1UWtRb2VyeEpNQnQvaGFuTE4rRFg2MWxX?=
 =?utf-8?B?N1pHRFBtemlkaG1nT0tNYWhXNk8vNGRTNnZMUnZ3ZFJPT1cxalFlT0R3N2xV?=
 =?utf-8?B?cXdQWkJ1cTduOUphTGRQRjZSTXozY243UFphQm9UNzhtYjlzdTU0YUxPVlpR?=
 =?utf-8?B?aC8xQ0NNTVl6WHJweGQzcDZ6MUJtNklMNUJXU3ViNjc3NVlTbzRFVkxHa3cr?=
 =?utf-8?B?dm5uTGF3eTVZb0FqSk11dnUwb1VkWW9pQ2toZm9IUjJxRHNQZFp1TGVsU2tt?=
 =?utf-8?B?bGxpMmF3cjBwSVdndXZmSHNWWmlCT2drdmdCdWxQQ2R1NFliclpyMzU2aDZn?=
 =?utf-8?B?VitLSHl0VytmOTFCaUlYK0pVZUlqMWsrY1dYN3BRbmxKbHM4cWE2QWJRYzI4?=
 =?utf-8?B?SXlwam9xQmQ0R0ZTdFY0aDlENldKT0VneDJFcFFFZk9YSGViLzYyWVp3MFJI?=
 =?utf-8?B?c3ZCRU5raGxPUis1a2luaEEvN0ZJZExWbkJqeTZMWW9ucU5PM0s0eXhJWm1N?=
 =?utf-8?B?c2M3NzNFdHBDODlaUzgxVy83NGdkR01nbHFtZmxqVXVMMjlMbnJYUW9lbUgy?=
 =?utf-8?B?R0ZNUlQ5S2MwR2REMlRuMnVlUmM2QUZFNFNhbU1NWGcwWUZBNHcwU3NINWJL?=
 =?utf-8?B?OU5HYWdsSWpFZXU2bmR3SkgzZFBmTkcxelJrVlJ6TWEvd3phMU9OWjdEdUtB?=
 =?utf-8?B?WkdOS0JML2h4WWpIdy9OUlJiOExIamtjVXZIaC9DdzhNSE1CcjV6bG5Fc3Jn?=
 =?utf-8?B?a3pqdHdsdzFLaHdVd0dEalU3Qlh3SmdsZ2poaFVHV2tUYVZQeWhwS2R2Rzk3?=
 =?utf-8?B?Q3hiTjBSd1pDL0gwSHl1OEJ1encxd29DUWlHZHB4WHlXZkhmWFdXT0F6S2t3?=
 =?utf-8?B?ZUtrMTlxREpCT2J2RkdmVG5rS1NrNEYxbi9OcHlPQlZLQ2ZTYWozaHBKWk52?=
 =?utf-8?B?VlQyNVZnY2lDemV5RWcvSVczVVdOZ0Y1ZjdiVnUxeEpoazlSc3B2YnFSRWto?=
 =?utf-8?B?Qm5RdUxHemttSXNrMGVsNTdqMHp5R3JJSFVtZWZWMG02WVZHUTFEOGprZ2tM?=
 =?utf-8?B?V0oxaEZWYWYvMUx5TE1RUkVXY1MzdXl3RXZ6eTZ2ODdETnoxY3dMMm0wY2RQ?=
 =?utf-8?B?amkyRHBvZnJDZEdwSmxaeldKQlgrUnpEQ09rMjVTckdKRG15ajNFeU5nSDYv?=
 =?utf-8?B?SkgzMUFWTXZjWHNyQ3N0VXh6MWlBZm9pbXJqNFpLVmxSS2gyOUNGL2NWd1gr?=
 =?utf-8?B?YmJxUlpLNlc4MFhwSHFrT1hLUll4cjFwRDRTMkI1K2plQjdCVGVINFJsczZF?=
 =?utf-8?B?NnRyM1RPbjNHOUxteldyQ0FpMSs4T1grR092MUNKang4ZEY5Yy9QbFNWcTQv?=
 =?utf-8?B?ZWJQbERTbVNQSDZCaU1IUWNvOTRncklFVVpnMmxIUjlrampPUUo5LzJHZzNr?=
 =?utf-8?B?eW9nNkFpclNSNWp5eW1jMk9rbjlkZExud2owSy95c0NPM0hIUDJjalpUT0FZ?=
 =?utf-8?B?Nlk4KytyS29lNHE0anlvK1hIZXpLK2Znbk1vUHJIaGtMK2wzVWxWNmY2b093?=
 =?utf-8?B?aDBMTjFDVVVZM0N6Z1NiOE1iaUUwYnNEVW54cllBemJJdW5NLzE3MmpMbk1o?=
 =?utf-8?B?ZmYvN1FaRThYeVZwdGl3ZDdMSVM1WklSTFd2OFAzNVU5NWwxZEZveTFJbDZx?=
 =?utf-8?B?M3JHKzBWdWlTd3dxai9DVnJnZkFuMVhZaHZFTGRTTTh4VHMyL241THpIbVB2?=
 =?utf-8?B?MUpMdGoyRUw2aHQwRm1XMlpMcGEzVEo3cFdyWE4yVkpFS0IzV3ZsSXRpZGlZ?=
 =?utf-8?B?QmM0ek1pdVZBSjJSdkptV294dkdQanlsZzdNY0VDVDlWS3pOZDUxZTlQSGpD?=
 =?utf-8?B?RFU0eHYxQzVJaEVmQVQyYTZ2SDdzZ2J4K1dZc2N6b0dTeTlGck9sdy9mY3Vo?=
 =?utf-8?B?MFpQeUp6RnMrUVdiTVNWUy9lS29OcnhpMTZuOGlVTk5GWU1nNUVVYTJUOUEy?=
 =?utf-8?Q?dII/QrnrHPQ13cN+5OVyLvY6a?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR12MB6435.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NXVXZWFtWUtKUnVrODZpSUJpQTNJRDl6RDlnWndrVXd2TGwwQkZmQlVRd3Vs?=
 =?utf-8?B?SExYUnZWWWhXd1A2Q2RVZHp2N1pmMk1kTHpzQ1V4R1g5NkZCY003QlZidzE1?=
 =?utf-8?B?djBUMEhBR0VERWY5aUZYSjJNU3hUZjBxeU1EVnVKYklHK2dnM2lEamV3USti?=
 =?utf-8?B?Q2R6cy9vZVIyVUNQV2pTNEwyQmtFdFU3MDhzejh0OTAzT2g2KzdENXl5cmEy?=
 =?utf-8?B?RFdHd2laMmh2MVdoZUFrMFgzUkUyZUxNMFF6L1ZpRk9TUFJ4UlcwMEN6R3Nj?=
 =?utf-8?B?d051YXJyNmd4TDd0WHA2MU54eUhyL0t4OHNGbTBPM043djU0blFDNWxCYVY5?=
 =?utf-8?B?ZElzV1pXOWhyUlBVZmprcDN5ZUt3VFBEM0Y1WHN4OGI2ZkZUSWw0YjZOREFO?=
 =?utf-8?B?NGxQS1g0YlJHenY4Q0dXYmFwaG1aUm5kUTA2WEdTazN6MEt0VHhOd3Y3RXBN?=
 =?utf-8?B?a21oc0ZqY3RxNktDVFMyb2o0QXFQYkdJdnUyZGdhNWpBVXhGUDlCT1VlOXRY?=
 =?utf-8?B?UXF6QmgrODFNU1F2MVh6TEEyanZ0bjV2WjUwakdQY1NUNFduY1dOcEdOVDhk?=
 =?utf-8?B?elo5aTlVNk0yK0NPbjNYSzE4dDdNT3BiQm14d1dFazRkNkwyRUJMcytpRTUz?=
 =?utf-8?B?QWI4VFhGamtjdjJiVm5vNTdoNmJOaVlobi9lYmludExlU2pPVkpaU053ZjA4?=
 =?utf-8?B?eUptMW9mWDYyL0pteVhZR2NOa3lVMUg3dDFoOGZjcXd0a0RaR1JldnY5dlRj?=
 =?utf-8?B?VVNLcDlzRmQxWldTVE01VlpmWlJPY1hHNDRTV01rTFVHU1hIOGhpcXdZVjhk?=
 =?utf-8?B?UjFJenMxL1YrN1Ezb0VFeGs0aTc5NjYwVkFUci9Yd2dyNlVkbXdUWnYvNnJq?=
 =?utf-8?B?NUVOWk5qeG1ZN3RXSE1rbXRyMDV1NXdvajBOazlPMEtzcmpTRHhtUjBzR1F4?=
 =?utf-8?B?dVVGMnVPeTgvL2Uyb3JENXN3K0xjdlAxSHZYLzAxb2hKNkR0dk5qU3pGS21Q?=
 =?utf-8?B?eXJLMGJURmFncVdEdndpN1dHOHd3VDN6emhrdkNmMFhMa0JOQ3JEV3pPRGNM?=
 =?utf-8?B?Z2hKRGovTzFQUlFQNmxDWU40d290ZTMvTWR4VzNRekp0REIzRmZlMlhvTXNn?=
 =?utf-8?B?bTFlT1pZTDd4OFE2S0l3NGtERDVyWHE5RU1LYzR4WlVnSzc3V1E0ZDZaRTU4?=
 =?utf-8?B?VUEwSjFOZ1JQUzFSL09ydWxXelhOS2cxRzR5NVRxdy8yd0tYN2U1VmpLOTZC?=
 =?utf-8?B?TDFkU2o4RTNQbVZhWTlLV1NzOGRIZzQzbjkxYUhwUHdGYjdjclYxdmJjc3NF?=
 =?utf-8?B?eUdEV3VOdlRpamphUFp2WlJuSGV4YVpoMG9YQUkvK1ZzYXJEdFY1NUdBamdh?=
 =?utf-8?B?Y3ZxVTdUalZ1U2I3SUI4WjZXUGs1VG50eTVoaVNSTEhpeU0zZU4xT2tsSHhY?=
 =?utf-8?B?RGRQTklMNnhId3VEY0prY2hQd091YnZJR0RhTXdtN29BYnE5cWNmSFFiNzlF?=
 =?utf-8?B?ZGIwdTFVdFlZVWRSWm5BQWNxaDZSb0tWUDhwR0d6T0RuSzhyenNMeTg3L0xW?=
 =?utf-8?B?QVUydUdTZVpYVmtOSHhXekNTMkN3K2ZFaVU4ODM4N3dSZ3A1UjZ6bGM3dHdj?=
 =?utf-8?B?aUpnZkFISERJdmtaQ3JqWm1VMUs1K3llT2FNMkVLQm9xT2J6QUVrWnZvalN0?=
 =?utf-8?B?bHpyMGprbjY0OFl5TzFXa2E1ZlF2YUlPcjZ5WkZhVWtVTlFYQlZmSW9xVEtU?=
 =?utf-8?B?NlJmeGV4dEYzRUJiWWkzRFl3MUMxWHpXUjIvTkgvSG1yN2w1K2M1dnhyS0VK?=
 =?utf-8?B?cXh4Y0xlYjdSTjRENG12Q1Z2UGdLWklZT1djUHNUSndMamxhZC90NGI3WmVH?=
 =?utf-8?B?OWhOUjJaYWpGekxkV0VpRmNRSnVUZWVPZm1KVnFjNW9LbXVwQUk4ZmdYQXR5?=
 =?utf-8?B?UXZESlh6RytHdkdSaFFGc25kREJqNU11RXU4UEdUSFVkMVBuN3lSME9KVmU1?=
 =?utf-8?B?K2QrVVpnTnZseVM3L3BNYnNvZTFpMVBLam1OT3JXOU00WlJjbzFHQUxIUWpq?=
 =?utf-8?B?d0gxTm0razNXazdUdVovci9EODQ3NFhYR1Q2Sk54QVQ1TFpDUytIc0FHaitM?=
 =?utf-8?B?VVhqYW8wb1NYVUdsN0dMN3lTU0VKTVduTUtibnp5bnlaRGZ0RE5EajVETlJk?=
 =?utf-8?B?OUEwRWNBZm54b1ZrWS9DL3VCYWxvUFErS1p4OXpJTFR0dU1aMmpad2lmVGYr?=
 =?utf-8?B?QmZUTjRSUjErLzlQTUMrd3VJc1BKMWNCNGVqNTMrYUdBSHJFa2V2QjlxYlhi?=
 =?utf-8?Q?BaPJX/6YoY4Gimenzx?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73c07903-932e-412a-42c2-08de54e33b15
X-MS-Exchange-CrossTenant-AuthSource: IA1PR12MB6435.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 09:40:06.4051 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5vgSmBdVof9flEStlUr6yGQNBVe6V1Rz2xPKTy4P0Q4fnn8h2JaICublXhlpq6SG4tAsQGOI7nUg8p/DQ6UVZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR12MB9585
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



On 2026/1/16 16:54, Akihiko Odaki wrote:
> On 2026/01/16 16:20, Honglei Huang wrote:
>>
>>
>> On 2026/1/15 17:20, Akihiko Odaki wrote:
>>> On 2026/01/15 16:58, Honglei Huang wrote:
>>>> From: Honglei Huang <honghuan@amd.com>
>>>>
>>>> Hello,
>>>>
>>>> This series adds virtio-gpu userptr support to enable ROCm native
>>>> context for compute workloads. The userptr feature allows the host to
>>>> directly access guest userspace memory without memcpy overhead, 
>>>> which is
>>>> essential for GPU compute performance.
>>>>
>>>> The userptr implementation provides buffer-based zero-copy memory 
>>>> access.
>>>> This approach pins guest userspace pages and exposes them to the host
>>>> via scatter-gather tables, enabling efficient compute operations.
>>>
>>> This description looks identical with what 
>>> VIRTIO_GPU_BLOB_MEM_HOST3D_GUEST does so there should be some 
>>> explanation how it makes difference.
>>>
>>> I have already pointed out this when reviewing the QEMU patches[1], 
>>> but I note that here too, since QEMU is just a middleman and this 
>>> matter is better discussed by Linux and virglrenderer developers.
>>>
>>> [1] https://lore.kernel.org/qemu-devel/35a8add7-da49-4833-9e69- 
>>> d213f52c771a@amd.com/
>>>
>>
>> Thanks for raising this important point about the distinction between
>> VIRTGPU_BLOB_FLAG_USE_USERPTR and VIRTIO_GPU_BLOB_MEM_HOST3D_GUEST.
>> I might not have explained it clearly previously.
>>
>> The key difference is memory ownership and lifecycle:
>>
>> BLOB_MEM_HOST3D_GUEST:
>>    - Kernel allocates memory (drm_gem_shmem_create)
>>    - Userspace accesses via mmap(GEM_BO)
>>    - Use case: Graphics resources (Vulkan/OpenGL)
>>
>> BLOB_FLAG_USE_USERPTR:
>>    - Userspace pre-allocates memory (malloc/mmap)
> 
> "Kernel allocates memory" and "userspace pre-allocates memory" is a bit 
> ambiguous phrasing. Either way, the userspace requests the kernel to map 
> memory with a system call, brk() or mmap().

They are different:
BLOB_MEM_HOST3D_GUEST (kernel-managed pages):
   - Allocated via drm_gem_shmem_create() as GFP_KERNEL pages
   - Kernel guarantees pages won't swap or migrate while GEM object exists
   - Physical addresses remain stable → safe for DMA

BLOB_FLAG_USE_USERPTR (userspace pages):
   - From regular malloc/mmap - subject to MM policies
   - Can be swapped, migrated, or compacted by kernel
   - Requires FOLL_LONGTERM pinning to make DMA-safe

The device must treat them differently. Kernel-managed pages have stable 
physical
addresses. Userspace pages need explicit pinning and the device must be 
prepared
for potential invalidation.

This is why all compute drivers (amdgpu, i915, nouveau) implement 
userptr - to
make arbitrary userspace allocations DMA-accessible while respecting 
their different
page mobility characteristics.
And the drm already has a better frame work for it: SVM, and this 
verions is a super simplified verion.
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/gpu/drm/drm_gpusvm.c#:~:text=*%20GPU%20Shared%20Virtual%20Memory%20(GPU%20SVM)%20layer%20for%20the%20Direct%20Rendering%20Manager%20(DRM)


> 
>>    - Kernel only get existing pages
>>    - Use case: Compute workloads (ROCm/CUDA) with large datasets, like
>> GPU needs load a big model file 10G+, UMD mmap the fd file, then give 
>> the mmap ptr into userspace then driver do not need a another copy.
>> But if the shmem is used, the userspace needs copy the file data into 
>> a shmem mmap ptr there is a copy overhead.
>>
>> Userptr:
>>
>> file -> open/mmap -> userspace ptr -> driver
>>
>> shmem:
>>
>> user alloc shmem ──→ mmap shmem ──→ shmem userspace ptr -> driver
>>                                                ↑
>>                                                │ copy
>>                                                │
>> file ──→ open/mmap ──→ file userptr ──────────┘
>>
>>
>> For compute workloads, this matters significantly:
>>    Without userptr: malloc(8GB) → alloc GEM BO → memcpy 8GB → compute 
>> → memcpy 8GB back
>>    With userptr:    malloc(8GB) → create userptr BO → compute (zero-copy)
> 
> Why don't you alloc GEM BO first and read the file into there?

Because that defeats the purpose of zero-copy.

With GEM-BO-first (what you suggest):

void *gembo = virtgpu_gem_create(10GB);     // Allocate GEM buffer
void *model = mmap(..., model_file_fd, 0);  // Map model file
memcpy(gembo, model, 10GB);                 // Copy 10GB - NOT zero-copy
munmap(model, 10GB);
gpu_compute(gembo);

Result: 10GB copy overhead + double memory usage during copy.

With userptr (zero-copy):

void *model = mmap(..., model_file_fd, 0);  // Map model file
hsa_memory_register(model, 10GB);           // Pin pages, create userptr BO
gpu_compute(model);                         // GPU reads directly from 
file pages


> 
>>
>> The explicit flag serves three purposes:
>>
>> 1. Although both send scatter-gather entries to host. The flag makes 
>> the intent unambiguous.
> 
> Why will the host care?

The flag tells host this is a userptr, host side need handle it specially.


> 
>>
>> 2. Ensures consistency between flag and userptr address field.
> 
> Addresses are represented with the nr_entries and following struct 
> virtio_gpu_mem_entry entries, whenever 
> VIRTIO_GPU_CMD_RESOURCE_CREATE_BLOB or 
> VIRTIO_GPU_CMD_RESOURCE_ATTACH_BACKING is used. Having a special flag 
> introduces inconsistency.

For this part I am talking about the virito gpu guest UMD side, in blob 
create io ctrl we need this flag to
check the userptr address and is it a read-only attribute:
	if (rc_blob->blob_flags & VIRTGPU_BLOB_FLAG_USE_USERPTR) {
		if (!rc_blob->userptr)
			return -EINVAL;
	} else {
		if (rc_blob->userptr)
			return -EINVAL;

		if (rc_blob->blob_flags & VIRTGPU_BLOB_FLAG_USERPTR_RDONLY)
			return -EINVAL;
	}

> 
>>
>> 3. Future HMM support: There is a plan to upgrade userptr 
>> implementation to use Heterogeneous Memory Management for better GPU 
>> coherency and dynamic page migration. The flag provides a clean path 
>> to future upgrade.
> 
> How will the upgrade path with the flag and the one without the flag 
> look like, and in what aspect the upgrade path with the flag is "cleaner"?

As I mentioned above the userptr handling is different with shmem/GEM BO.

> 
>>
>> I understand the concern about API complexity. I'll defer to the 
>> virtio- gpu maintainers for the final decision on whether this design 
>> is acceptable or if they prefer an alternative approach.
> 
> It is fine to have API complexity. The problem here is the lack of clear 
> motivation and documentation.
> 
> Another way to put this is: how will you explain the flag in the virtio 
> specification? It should say "the driver MAY/SHOULD/MUST do something" 
> and/or "the device MAY/SHOULD/MUST do something", and then Linux and 
> virglrenderer can implement the flag accordingly.

you're absolutely right that the specification should
be written in proper virtio spec language. The draft should be:

VIRTIO_GPU_BLOB_FLAG_USE_USERPTR:

Linux virtio driver requirements:
- MUST set userptr to valid guest userspace VA in 
drm_virtgpu_resource_create_blob
- SHOULD keep VA mapping valid until resource destruction
- MUST pin pages or use HMM at blob creation time

Virglrenderer requirements:
- must use correspoonding API for userptr resource


> 
> Regards,
> Akihiko Odaki

