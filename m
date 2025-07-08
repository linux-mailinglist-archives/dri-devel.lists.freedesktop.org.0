Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08E89AFC327
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jul 2025 08:50:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7424710E138;
	Tue,  8 Jul 2025 06:49:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="tfFQRUFU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2086.outbound.protection.outlook.com [40.107.236.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7F1910E138;
 Tue,  8 Jul 2025 06:49:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rxxsul6O/LqKoN7SPn81AUBFgckbj7MGycf/gDwP70mmcELqfSZ2kAPPD736SxyeNDxyatyWiBB+kDtKxsaYKznQ8/M7zVFesI//Rev+guvVOd/l7FIJ7TUQKHQEsAVJBRsyg/vamC+MfkfGmYrtUnxC0dwJTmOvTD6b+Dwzq+qP+VvldfZl2jhND4wFSE+PJY+cqnOBAvbfK/qkEVzxenS8fLVT7cASG9PGWcGDQ9sAlXmzEpM/Pz2+Igt4YtAiWxlitPvIna+tcRiFAll4IbZXAVeaF5dab5ynMdcjOYFnBeDFfzcNwsf+FYod/35n+n1ws92NOHPSiXrZC7SHng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P1+iDLCYVoH0YC9EtKj24zz/I4o+2eq8tT6mfPySBOg=;
 b=bSFg0V4ggV/b+hpETVocgEcQVTXvw89CQHkq6S72+H12SphpsivKhd+uiLIS/OtSag3099PxDybxXbt64Yh5D0Wq1MIegUZeuDh/K7d46eAMsgv8DrjAGZGb7xl/OR9p2wMwW6/x/cQTa1nMA5cVxVYY4vAyOwmsOJH+xNyUOq56AqhCEU1z+fcV4q1wsHta0VpyyPTyubTpCcX96OpGnlLqtXghI58QRg3CSlt4waunldQ/XRI4ASrnz3QkRIsmGUrMRJH/Fu/hdIgIP50A1jJRFXKsBq/QK5XgePF6HXNRsVK7JQzWrN5mikeHUjJsf4FWO82gQJ2Sts06UuvEHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P1+iDLCYVoH0YC9EtKj24zz/I4o+2eq8tT6mfPySBOg=;
 b=tfFQRUFUsripk2RLBGR579JrRfI0NvWVyTuXGwk80DXpZ9G0u0tf//Tlua5nb9Y3nmaOwdxRn1JgIeq1oqw5KsW9iDpLSYlxLzb0KHvrEyDjpLWZZlCXOMWy/DYws9NrFiLIFTdgz6jtGQYMOLU34ccsZpqo17uzXjo++WtZo7oprx+nycU5wU28AalOSPb8X8axrUU3JpKX73iUz1wESsgoHWkjouCAvn9Op478veDg/P3KIjPomDOtYwnsqLWiyevLKxWNQ+27lkndEDoqz7PmHOdmy0iqgbJdYdSZVV52CNrNCqyYfsUQ5mehzmyenZNjM2lV8mIarv+fRIXyfA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CY8PR12MB8412.namprd12.prod.outlook.com (2603:10b6:930:6f::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.23; Tue, 8 Jul
 2025 06:49:55 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8901.021; Tue, 8 Jul 2025
 06:49:55 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Tue, 08 Jul 2025 15:49:41 +0900
Subject: [PATCH v4 1/8] gpu: nova-core: Add code comments related to
 devinit
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250708-nova-docs-v4-1-9d188772c4c7@nvidia.com>
References: <20250708-nova-docs-v4-0-9d188772c4c7@nvidia.com>
In-Reply-To: <20250708-nova-docs-v4-0-9d188772c4c7@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, Joel Fernandes <joelagnelf@nvidia.com>, 
 Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TY2PR02CA0058.apcprd02.prod.outlook.com
 (2603:1096:404:e2::22) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CY8PR12MB8412:EE_
X-MS-Office365-Filtering-Correlation-Id: 239f36a8-f0ba-4cc3-68f1-08ddbdeba575
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|1800799024|366016|376014|7416014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bkxZcHdubnRnZHlhSlh2ZDhFdGF0WlN0RElTb3FiM05zY3pKMlJnUExLZTlQ?=
 =?utf-8?B?dnlBdG1Ta0Yrbjh4RjFCaEp2RVBld0tKeERyQzN2R2hJbHA1dWRORDZLMHFH?=
 =?utf-8?B?SzFqMXlZNlJOTGVVQXFoL3g1RkU0SGtKMnRSaXJqRkoxQU93RXdVckg2eWxZ?=
 =?utf-8?B?dUQ1RXdqQ3RPTVhWNGR0NHVrNG0rN2kxdHREajV2MlMzdlRLQ00xb0xLWmFP?=
 =?utf-8?B?UFY3VmIyY2c5RWdrTGhtbmtqazJQcjdiTzBqYkVmemViZXgwcUMvc3RhSVpD?=
 =?utf-8?B?QUJoRklmeWYwcTdRSTRMalpaOGFQYlVNZnZtV041QzY5M1F2eUpFdnpBOExv?=
 =?utf-8?B?cDJIbUFUWWpNcUcyQlhGS2w5UGtzYXRjK1BCSDJSajlvYlFtWm43Qm1iazdJ?=
 =?utf-8?B?ZmQzOXI1V0ZxcjhvQXA2THVzbG5LRzg3eTRwaDlmTnR5elczcFE1aHExOXJa?=
 =?utf-8?B?bXF1T0NnWVhQcGhUOEtDbDJpMlhRTjU0ZjlkWjR3OVRvNEsyakFJcHdPZFJM?=
 =?utf-8?B?ZVJsTXlZTVU0YVNJczhaRHQ5akptNmlab2hvTU94cXpLb28zNmxOUE1mb0xM?=
 =?utf-8?B?S0dKamdCSXlFbWk4ZFcwSnNySDV4RDdMTFB3NTE2OE5Gb2ladVlSTjJmcXpo?=
 =?utf-8?B?OGwxczlXb0p6dlFhMTVKa2JUK1BrdjEwbFBhZENudG5INHlUcDc2di9TNE52?=
 =?utf-8?B?RGRwdVY5eit2Q0F6MTlWRmtXTzQ2Z1BBcUJPQXlnWWUrZ1k3b1lhWHV5QWYw?=
 =?utf-8?B?VTRyT2l5cWpYRnJtVER0OEFQMW5RZUl3eHJMYkFKMGphRTY0WVZ6WmpFV0Vp?=
 =?utf-8?B?Q1pIcy9Nazl3UEFyM3VTbXJJQ09MWjd2Ty9JOXJqeDdFQ01MSkU3UDFtT2k5?=
 =?utf-8?B?WEVVVHUweDlCODRsWVFrdmI5dmc5Vzk0YjRMSkVyTTgwUkMrSllTZ1ZleWtX?=
 =?utf-8?B?VU9LRDJSaXBpL3FSamhkdHprNFVoQ2V6akVRc283eitzSERvZlJnZGwzTnBP?=
 =?utf-8?B?ZnBKUmZRZE94M2lKU1czTnJMYmVHK01mMXpGT0hDU2NCMEEvSVJUa2w2NWlw?=
 =?utf-8?B?Yk1oNTFTUXZ3ZUo1V2x4MnNEcGUyckFpaTVmK0dyM1oxejJ6MmxFSzlhRWh1?=
 =?utf-8?B?TXc1RDhpbUdacnBodzIvV1NVdjhlZlNVdWQ4YksvM1dzQTkwZ2ptdFhzYUpU?=
 =?utf-8?B?K3VoR2V4TWZETmMybFJXeTNIQXJWeW90WEpLQXZ2TUVNdUlqcU5FZmFiNnJL?=
 =?utf-8?B?c1ZUcmVGeVF0cnJ4U3BvTHZMRmE0WDlSOXVUZ3Rac29QNnpzeFk4YldwNXY2?=
 =?utf-8?B?Szl3VkhwVEhjaVdXaVpjcXdBc0liY0ZpOExvV0hpZk9GQ0hoZWl5Z2M2TUZX?=
 =?utf-8?B?bDRTZnBDUUtHYmozRzVudUdHRDdRRG5hdVN2dGdQUm1PZko4ZWNpdGRLY3lF?=
 =?utf-8?B?V0RlaWE3OXIzNkNFMEV5QjdqdUxyTzRFVVBaR3ZSQkoxVHhYOGJlWDA5NGtP?=
 =?utf-8?B?WDRsM1RmMG5PekgzeCtscjhTa0ZDK1B3dTJ0RVJtQ1k1eU5oSkxkVjAySEEz?=
 =?utf-8?B?THZWSXNtQlZ4d0IwZVB6dEE2akJibE8xaGc4c001Ni9Tb09kNXhVbEgvdndn?=
 =?utf-8?B?TEliekxuY0w5UTFnQXJxVDYwZGFMellqNFk3akVkTFN1eFhKem82aHVuN2Rw?=
 =?utf-8?B?aFNjOW4yMXpMTjk4cmhYajhvNHhIeEp1MUNOdFNsbjU5SWVwOTl2ZkkraFhm?=
 =?utf-8?B?U2tObUVaWEpueDlXaXhGZ0NDendqZkg2RXNBSndqZGJnKzJvZEZpUlk2akd2?=
 =?utf-8?B?aFZ4NVBRUlVNNDhURjY2c3hPbDBNSnVPV3ROYTd0NHhwRjA5VFpNTU5oelZN?=
 =?utf-8?B?ZnB0Z0RYT0VOZjVpWEVZbFMzTTl6NjEycU1zMDd0ZFQxM0k1WFBIMnNpVmMv?=
 =?utf-8?Q?ewxClMlN5Zg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(366016)(376014)(7416014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?czU3NUJtM2dRbGVDRmZFTnF3SGJGMXdQNTBVOEtsVmowVjdoYUJ3MkNqOThZ?=
 =?utf-8?B?bFBhdVI3cWo0dmMrYXdDRXF5Skk2OTVLd0lyeFJmaHRuT3B5OERpWnNiMjVH?=
 =?utf-8?B?ZUNRbytTb0IyRjVhdVVOODBVbVkwZE9QSWl1Yy9xdjdEdktmbWNWVDgzWDdI?=
 =?utf-8?B?VlFxMmxxcjJFdllTWU51dWU4YXdYZzVVdi8wS0lMMDFRUVNsR2tIV3J2U3R5?=
 =?utf-8?B?VVBjMUVhRGdFc2ZzMndvVVJKOG5NV0VCRGp6VndsUk1nSjBZc0Q5Y2Urek5v?=
 =?utf-8?B?TGl5d0xteGtqbFE1TGx6Vk5HWXBBVWNtaTVJcFNyRW9lNXlqclZjeG0zd3Zu?=
 =?utf-8?B?ejVidGVCNWRvZEEwOGtUd0hPR1Y4emRBSkJaZmZHcXFSSjFhN3FGdHYwWW52?=
 =?utf-8?B?bW53QnVIVUtzRnpyRFNyRkZ2T0VqVE5kSFBRWGpTMEw4NW9PY0FrQXQ5SDdp?=
 =?utf-8?B?VHIrMTRrcUxreE0wR2dkQ1M2MUhXd3dQTFZ5T1VtbmVXQ2srZ250N1BUbjk0?=
 =?utf-8?B?UlRFMnZCRmRDUURINVF0amFKVVVoZGM0UjlZTUcwelRBcXVDZGM4V0V2MFFY?=
 =?utf-8?B?VnBadTVJQUpUV1RsSklFVWs3T0dLeEJsWlNiVW16Nlc3anFhTFlYSUFqUGt6?=
 =?utf-8?B?QzZKUysrUU9QeS83NkY5VVp2NlU1QmtsL01veEVmeEhaZTdJWmZsUnN3dVBG?=
 =?utf-8?B?VTJtRXNneG0wZ0pZQVBSQVZxMVRubEJ3YisyOXBSVWJmSU1WdmVVTXFGbjZs?=
 =?utf-8?B?Y3ZTdGZpaUhuK2ZLMnM5bmhiQlVZZnYyUVBzaVJRQmFjbUYzcmtSUWF2dVJq?=
 =?utf-8?B?UGxmNzJ3c2ZZbTBIdXhVT0pkSmF1dHZYNTZqalpQbTQ2VHY2Q3hBam9kdmZh?=
 =?utf-8?B?WFQ2bHRYZlNDNmltdW1RTm1vYXhuTzhJayt3YUY5MnY2REt6di9aU2l1R0lP?=
 =?utf-8?B?QVl6ZzA3SUNDMVVCQ01STGxCaFRXOWpZUVFPZ2h3NUtENU5PWVFCR1Rjbnox?=
 =?utf-8?B?ZXgwS3lzaFlQKzdrRUhVN3ZoRUl4Y204MTAvZGdhUHR3REZUTUZHZFB6WHZ4?=
 =?utf-8?B?cUdFZ3BIdm9oMkthSEx3enc3S2FITWdLbTY3SjlEVml3cmZGS1duNXRqK0Iz?=
 =?utf-8?B?NmVKS3FuMDN6VkhOaEhseEd2WmNsdXhTMXVnT1BZcmMvODF6aHdrZ0tNaGRK?=
 =?utf-8?B?cFNRaEQ5eWxoS085MVBTNGwrUGRJNUVaTWpDdnFJTFp4alg5bGV6b2t6bm41?=
 =?utf-8?B?N2VIOXpXSE5aSStCdG4yNTlTaVhuVVFMb0I0YVdoenFFNERsK1o4UmJIRFhH?=
 =?utf-8?B?QnpqT0RxRFFJeXpGN05FOWVNMFpvcDZtOTZYQVlKeTFKR01rWXBTYjZVQjZo?=
 =?utf-8?B?S29KTVNKbjQ2SDZVT0oyOWVncm5UTlJQbHdXbFJFSk1WS2lpWTJnRXlBd0dm?=
 =?utf-8?B?Mmhpa2VjRXUySjdQWS9jTDloYzFNRDBGK0t6NWRha09ZSXRaRjVyMGJBYVA1?=
 =?utf-8?B?T21WS2hpS1RBa015UTQxOGVQblU1WUprcThPSklZMS83NXkvMmdPQVFSdXV6?=
 =?utf-8?B?UDNiWTUwRkp5U1k5YU5ieitTcHU3YytlMStla3ZiT1MxZnZJR2ltWC9zeVp5?=
 =?utf-8?B?bmRTTzY3RzhmYUlZemlGR2JQYmVoQkJEOWtIa05Zc0lCUjJianFhSFhnc0VD?=
 =?utf-8?B?L3M0Z1lpek1malc5aFEvQ3kzNFBacUVGQlBmQ3czSU9HYmNLRkQvWklKWXRu?=
 =?utf-8?B?Y0p0eGpsQTF3R2Y4eHlGUHBlRjNvSDZ2SjBrWUpPVnhSMlBZbkRvUktMTGpu?=
 =?utf-8?B?cU0xUGQxRzVlQXJIVlo4aUFYaEtFSWRIelNhdmxSUGpBUjVaU2VaMnZXWTgz?=
 =?utf-8?B?M2NHRllYOGppNEVFN3dtTlptbXlwczdUbkVXRDc1Z1FtV1JmbjI1b2xCakUy?=
 =?utf-8?B?bUw3bGF0SStPNkFaWHBOVy9zS0hKUE5xa1pPVE9jbFVIUFR1NG9ZWXdMRWw4?=
 =?utf-8?B?WHV1UkRqL3cyQldyMHJjVEdsRTRMbllQbWQ3czJ0bkhyWnJSOWZhZFZYbXdm?=
 =?utf-8?B?UURVYWFlYUpXRkp2UjNSalpid0QrY3M2eVVuOXhFVmV4TmltcVpXOWplVUVW?=
 =?utf-8?B?bTQ4ZHlFd3BBOVZFd3crRHF1UnRMcFFvWDZHaS9HNnlUWG9YMmlmaCtHWjRK?=
 =?utf-8?Q?UdBj9qUN7Rw8aoJcsBSuwAtaV1On5YqUdNIGy3WuxRUr?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 239f36a8-f0ba-4cc3-68f1-08ddbdeba575
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2025 06:49:54.9131 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iiKvSxQpqeH7ScN8Cx5daao2pxKWA2hPKjzsNfnwzdNgZcdgNKejjoxjkWcRr1H+ayAcZmr1sC0uX6hFHWpbFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8412
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

From: Joel Fernandes <joelagnelf@nvidia.com>

Add several code comments to reduce acronym soup and explain how devinit
magic and bootflow works before driver loads. These are essential for
debug and development of the nova driver.

[acourbot@nvidia.com: reformat and reword a couple of sentences]

Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/gfw.rs  | 39 +++++++++++++++++++++++++++++++++++----
 drivers/gpu/nova-core/regs.rs | 14 ++++++++++++--
 2 files changed, 47 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/nova-core/gfw.rs b/drivers/gpu/nova-core/gfw.rs
index d5b68e02d405750b18d634d772f15f413453e80d..8ac1ed18719926493369c2aae9a59b2b55fa2b12 100644
--- a/drivers/gpu/nova-core/gfw.rs
+++ b/drivers/gpu/nova-core/gfw.rs
@@ -1,10 +1,22 @@
 // SPDX-License-Identifier: GPL-2.0
 
-//! GPU Firmware (GFW) support.
+//! GPU Firmware (`GFW`) support, a.k.a `devinit`.
 //!
 //! Upon reset, the GPU runs some firmware code from the BIOS to setup its core parameters. Most of
 //! the GPU is considered unusable until this step is completed, so we must wait on it before
 //! performing driver initialization.
+//!
+//! A clarification about devinit terminology: devinit is a sequence of register read/writes after
+//! reset that performs tasks such as:
+//! 1. Programming VRAM memory controller timings.
+//! 2. Power sequencing.
+//! 3. Clock and PLL configuration.
+//! 4. Thermal management.
+//!
+//! devinit itself is a 'script' which is interpreted by an interpreter program typically running
+//! on the PMU microcontroller.
+//!
+//! Note that the devinit sequence also needs to run during suspend/resume.
 
 use kernel::bindings;
 use kernel::prelude::*;
@@ -14,13 +26,32 @@
 use crate::regs;
 use crate::util;
 
-/// Wait until `GFW` (GPU Firmware) completes, or a 4 seconds timeout elapses.
+/// Wait for the `GFW` (GPU firmware) boot completion signal (`GFW_BOOT`), or a 4 seconds timeout.
+///
+/// Upon GPU reset, several microcontrollers (such as PMU, SEC2, GSP etc) run some firmware code to
+/// setup its core parameters. Most of the GPU is considered unusable until this step is completed,
+/// so it must be waited on very early during driver initialization.
+///
+/// The `GFW` code includes several components that need to execute before the driver loads. These
+/// components are located in the VBIOS ROM and executed in a sequence on these different
+/// microcontrollers. The devinit sequence typically runs on the PMU, and the FWSEC runs on the
+/// GSP.
+///
+/// This function waits for a signal indicating that core initialization is complete. Before this
+/// signal is received, little can be done with the GPU. This signal is set by the FWSEC running on
+/// the GSP in Heavy-secured mode.
 pub(crate) fn wait_gfw_boot_completion(bar: &Bar0) -> Result {
+    // Before accessing the completion status in `NV_PGC6_AON_SECURE_SCRATCH_GROUP_05`, we must
+    // first check `NV_PGC6_AON_SECURE_SCRATCH_GROUP_05_PRIV_LEVEL_MASK`. This is because
+    // `NV_PGC6_AON_SECURE_SCRATCH_GROUP_05` becomes accessible only after the secure firmware
+    // (FWSEC) lowers the privilege level to allow CPU (LS/Light-secured) access. We can only
+    // safely read the status register from CPU (LS/Light-secured) once the mask indicates
+    // that the privilege level has been lowered.
+    //
     // TIMEOUT: arbitrarily large value. GFW starts running immediately after the GPU is put out of
     // reset, and should complete in less time than that.
     util::wait_on(Delta::from_secs(4), || {
-        // Check that FWSEC has lowered its protection level before reading the GFW_BOOT
-        // status.
+        // Check that FWSEC has lowered its protection level before reading the GFW_BOOT status.
         let gfw_booted = regs::NV_PGC6_AON_SECURE_SCRATCH_GROUP_05_PRIV_LEVEL_MASK::read(bar)
             .read_protection_level0()
             && regs::NV_PGC6_AON_SECURE_SCRATCH_GROUP_05_0_GFW_BOOT::read(bar).completed();
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index e8b8aabce3f36abe6a7fba3e11f677e36baa3897..3bb38197a890bb32d54b9aa4df4d9ebd740dccca 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -104,9 +104,19 @@ pub(crate) fn higher_bound(self) -> u64 {
     }
 }
 
-/* PGC6 */
+// PGC6 register space.
+//
+// `GC6` is a GPU low-power state where VRAM is in self-refresh and the GPU is powered down (except
+// for power rails needed to keep self-refresh working and important registers and hardware
+// blocks).
+//
+// These scratch registers remain powered on even in a low-power state and have a designated group
+// number.
 
-register!(NV_PGC6_AON_SECURE_SCRATCH_GROUP_05_PRIV_LEVEL_MASK @ 0x00118128 {
+// Privilege level mask register. It dictates whether the host CPU has privilege to access the
+// `PGC6_AON_SECURE_SCRATCH_GROUP_05` register (which it needs to read GFW_BOOT).
+register!(NV_PGC6_AON_SECURE_SCRATCH_GROUP_05_PRIV_LEVEL_MASK @ 0x00118128,
+          "Privilege level mask register" {
     0:0     read_protection_level0 as bool, "Set after FWSEC lowers its protection level";
 });
 

-- 
2.50.0

