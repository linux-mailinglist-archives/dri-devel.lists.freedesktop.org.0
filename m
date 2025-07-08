Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D221AFC332
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jul 2025 08:50:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B87F10E5A3;
	Tue,  8 Jul 2025 06:50:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="L0rN6bRz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2071.outbound.protection.outlook.com [40.107.220.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C89410E59E;
 Tue,  8 Jul 2025 06:50:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wSvKn6sXku/ngUFo2ZaqIfZiyyKQyrO8PKsEuhTnD7jw8j+LYAGv1sOaR1B3jkbw5A9vvry6G0jgkzKDZ9mJViq5Hf6SYkZuJUDGgAnRHQ207RfIT2biJHVKqhBbU66TuY47HlSDVfn+pHGHaymygRApG6o293E+TLSJwkW6DXxtVhHoiD7qLaODGGhjaNmPAZ0MTdwmXodzKrL89S21+BP6OiaRkbYPpwVzv0WTTHS3AA3gusJG1G5emFtvtKe6KEENzL37pko24GFXdt5712uYKgS4xblcNqljbS7ZMtbGp0R43rOFC3U6lfVOr0RevMtcwEHFF9VlJvoh58PmJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sPCMPPPhW8LN4/mXiKcuiqnEUbEegoAMu8hbl3ceLGA=;
 b=fdoffKr0FNHpexgsqK7PZUjKwjxy2kt4ra7FTZswqg3f1ZH0TzaHeI/sIEmd+I1tnNW4SM0l7HcMJMibQ4Y4fMfhUhXvWHZd/Vam+JT1lk6vj4nXVRSlp8EZAqa2rVvguXr3J7NBMTal4UPRp769Bz3eKS5Ai/0ekCgI2Djab9/BPKQt1LTpxIhZb0yOMyEQwJ3OPpt9eoXVQ6l8Hm179DDEWjDL4BVrJTMVR9a2REu9q33V6rFaayw+MGiCK/RnmVZCzSAl7pIVxWkFW3k+phdEqMB6+3Vv5nK7xxWCNXg/r33aDN55dk4dyVUDUUKkb7oTX3tlGfyLzato5C6PgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sPCMPPPhW8LN4/mXiKcuiqnEUbEegoAMu8hbl3ceLGA=;
 b=L0rN6bRzHUSAeyu0h95umRrKKMls21rsKSpnKpj1r1x5iuavELfxDPUhscdjJYNBHFfPupogD/rXVEE8Ea+jSe7VQiGuq242o/Dkal4um7rmt7+c38fe/htvfX+VRJ3cHcW/KOu74r+2aDt0d/DUq253RV6Ie+yhgL3dcvmsJGDwqCusfa8Ab+cCMw7mhir9wJO5bW0piyb7rkZX6lDKev3I8JKtXV7w31rc1uP1rGNNsBnKiihn6eaqqCeqZng6CZGJ/zcK544gjl5wtHVPgRf9raZk4rrLG0I2ObPYl2j7WEow1ooo1i3PbnJIA7SjW25V5be92MC3f9erLqcdhA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CY8PR12MB8412.namprd12.prod.outlook.com (2603:10b6:930:6f::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.23; Tue, 8 Jul
 2025 06:50:11 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8901.021; Tue, 8 Jul 2025
 06:50:11 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Tue, 08 Jul 2025 15:49:46 +0900
Subject: [PATCH v4 6/8] Documentation: gpu: nova-core: Document devinit process
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250708-nova-docs-v4-6-9d188772c4c7@nvidia.com>
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
 Alexandre Courbot <acourbot@nvidia.com>, 
 Bagas Sanjaya <bagasdotme@gmail.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TYCP286CA0028.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:263::15) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CY8PR12MB8412:EE_
X-MS-Office365-Filtering-Correlation-Id: 5dff5679-8016-4ae5-1271-08ddbdebaf54
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|1800799024|366016|376014|7416014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QXJ2dzlvS3lpWTNHUmNIUWYraTNhbEkvWnlqaTl1Z0ZBTE9SMGNZOGJKSE50?=
 =?utf-8?B?S1RBanN6dnp6L0hIMjIybWVCMjNRNGVjNDZIV2JWY3RtU2JCN3RSaks2UWdG?=
 =?utf-8?B?d0hpSGxMVEpiSUVpd28xQ2EzdlZFNzJBL0Q5c3lGK1R3NnUrb1h4ZHdEWGxh?=
 =?utf-8?B?MEt6NW9sOEZSb3JPNEVkVkhraytGUmNjbW40WFpnc0I0UEFuRU9qb0ZwZ0cy?=
 =?utf-8?B?Q0dCM2RyWU5neTlDM0ZMTmJ6N2tpci8wVTIrMjdMcGtiRzFSL1ZRVjJTcmhQ?=
 =?utf-8?B?a1lYQkFoeGhuTGs3SWJUTXhkaHhaZzBwSmlsSXNLWCswemNJdjVDMElWRHU3?=
 =?utf-8?B?bHBXTXlTRkdKdWNVK29McEkwRFNaQ2hDU1NYVUhpVWVLN3UzSmg1SEVSY21N?=
 =?utf-8?B?SDl3NHh5clBIYUVvOWtEdWx5N3liNkRpYkZSN0VZY25IK1Zrd0oxY2loMlpa?=
 =?utf-8?B?enIzMmNFaGh1ZW1lMTh2eXdzZ0hPMk51UmVBT0JWZVNReEpxWFFJdkZ2c0Zs?=
 =?utf-8?B?RDlPK09OT1g3cU1IaTJieUs4ZEZ4VS93c2pNdmM3NjhyTExwRUZhSlJ5eHBk?=
 =?utf-8?B?TUNoL0hBOTYwbzh4OXRBTFZCUzFkRm05alRlOXZWUTVSclFjdGliNGVSbmJ3?=
 =?utf-8?B?YVptZlFFNG5xdEZUVkxxb3BDR1UybUVmdm9GTDI5YXhscFFLQTF0SnA1U0pB?=
 =?utf-8?B?R1RuL0hXLzY0S0wycnM2aEVTTUNRZHpNUHErNzhYZ0JvZkxYdUprQmFra1J0?=
 =?utf-8?B?Z2I0MUNlNUNCbXBLL3Q4YmNQQ0pISzQxb0ROcVl0S2l3Q3JCQ0E5U0J6YSs4?=
 =?utf-8?B?YTFXK0t4OXpEeHBGSC82d0w3K1pOQ3E1TUNQUzkzZG9iMGJ0UFlCL1pubVI1?=
 =?utf-8?B?VHBXUVEvUG51b3BDbXR2OENlNExiSFpwTFRRb1QvaDlEcGQzSFVRZ3k5dHla?=
 =?utf-8?B?clRnaUxhSVlEUDZEUWlRaWhVUzQzallHRCtoa1NvS3llZzB2VEkrcmwyLzBK?=
 =?utf-8?B?UWxRcHhmZ3VrSDhramZsWkRkSlJHVDNYUlREMTloRG92ZXpVYVNzYnkyTUtM?=
 =?utf-8?B?cWpMMEhBWjNZUG9tTFJuNHA4cHRtSEpkK0FRcEtzaDVOZW9sZURMUU9RU3F6?=
 =?utf-8?B?aEZXeGRic0dseE84UUVicmc2ZXc5eXhJVkRVR1dTWnBvVmcyT0lCajR4enZj?=
 =?utf-8?B?WEVhaG04aE1jUmtURngrcEU5VllzcVZUUkFsUTR1SDlab2RYQkovSExodHdq?=
 =?utf-8?B?TWJ2ckljYTRwQlJKOUVTTnAyeEgvM1BxNEU2K2Z3V2JqcDU0RzlRaEJ6eHJ1?=
 =?utf-8?B?WFQvZ2VVN1BXdWZFTTRmejFvRFdES1gxVkJzRENDRVIrMW9YbDhSU3owZlRq?=
 =?utf-8?B?bzJoeFlwYkVscTJteVpGcEpGMFVTTHNZb2NUTkJRWHNSOU5kRXdWellvWWgr?=
 =?utf-8?B?d3RlYUxXVStvWHRUL2Z5SXNwdlljRHY5QTZtMnJBdWt1bTJ5bklGSnZTTS9M?=
 =?utf-8?B?SUhiNC9sK0pkeGpIUkRXU2ZSeXg4R0Q3NFlnYmdSWTJRSHM3MDJhVVV0ck1L?=
 =?utf-8?B?aWlyd0p2L2lNVHFmaGpxbVgxSi9nSGlqR2pTWXl4bWx5amJ1SHNJbDFKNDUw?=
 =?utf-8?B?MEFtME4vRzg0M292QmhyempVY0hVOWtSaTNOazNiMXpvbVAzdVU1cXpSVEZu?=
 =?utf-8?B?UEJoTVRIcmQvaXBrV3U0dU5ndTMydGVHeUJqSzREajNERmlIUndBa1ErYUZE?=
 =?utf-8?B?RGFMU285bHlHZHN1Tllxc3N4T3FmbDFzb0JOblZlbi9SbnJ4SFR4Y1k1T3Y3?=
 =?utf-8?B?azN4MDFpbkJ2VmFJdFhuSnpCeG01WWlMRGI3aSs3T1FLa1RKN2twQXlqd1Qr?=
 =?utf-8?B?bkF5Vnp4dktrMFFIcnlBK1BiS3RHQlY3QXJ2SUN5RFpTMHp0QzZlRmJZOHZG?=
 =?utf-8?Q?AiI9FeUBi3Q=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(366016)(376014)(7416014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bkx2ZFRNQ0NtcmF2cUhBOEJPemhIWjh0T3RpN1JFKzhsZy9KT2FLMzJSZEJG?=
 =?utf-8?B?b09mYTErK0NlS2trS2JMb1RYVTNuRzVTUjVOWUZHdU56M0tDdGEyN3l0YUJk?=
 =?utf-8?B?RFFmMVlOaTdGcXNEcDhjeWFrNy9aVjJ1SmR3UDdyMHh4UEdac1h4ZTZHTVBN?=
 =?utf-8?B?aUxMM1Q1TkF5clRRUkVjZWRSRndWZ04zeEsrcmVqUHVPcE5XTlBhblh0NHRY?=
 =?utf-8?B?OFNCQloxQUppYTAvR0xMWEJnbFNUZVAwY0RONjU1TXBRbU5FQVh4ZmNwVmRB?=
 =?utf-8?B?UWRYVVpNbVY1aitJY1VJZ2paaEtJL0Fra09VbnlZejF5elFPeWhJR25qVWJi?=
 =?utf-8?B?MzcvYWwxYjUvZHh0RWw4YkxNQVlsZzlUTTF0QXU1VTQ5V25EdDdxMW4ycC93?=
 =?utf-8?B?VVlmdjdBV2VDSHcvbWg3ZFB6MUFacEhvNmR3SXhqL083ems1UWYwSTRRcWV4?=
 =?utf-8?B?MnZoWEJ5UHRQR3IyY1pTTjd0ZWtWN1NVMkNXd3JIU01BV2dXTk9FYWphQmVC?=
 =?utf-8?B?VnlyTzhEcDl6V09LWitjRTFkbGZoOEsvQzVqei9sQWpLVk1NL0s3S01YK0lS?=
 =?utf-8?B?cjZsRTZQWXVyb0E3emtSWkNBYi9NU3pDSzNualZXekxVYW53RUx3MHNKSXBl?=
 =?utf-8?B?Rjl3OW1GLzVpeWYvSUxEUnRPTHdDSzNGZGRjMEhzbE1SZU9lblV6WkRyQldP?=
 =?utf-8?B?aDlHb21yZ3JKaGI0YUcxeDRFYlo3NUErZG8xeGVuVVBaUE5kZU0wYVFDTTJI?=
 =?utf-8?B?U3dLL1h2ZmpidEh0YU8yQUZsbGovdUp0Q3VOci9Ld2xLNU9ZWkp1NitoR0tx?=
 =?utf-8?B?dU5QWUp3TGJ1R3VqOTlhRFY2NEMwWXhvUnpiak8wR2hUSEd3VGczZTN2dUVz?=
 =?utf-8?B?Y2pJWWpRWlVLYVFhUWRZamV6RVpMN3ljaGNLbFVBZTNHQTUzbWxYQnhFYlB5?=
 =?utf-8?B?UFdwU3U5dmN0VUZlQW0ycXk2cVpUaXhlSkM0K3M0Q3BrWXkzNDk1Y1UvRENV?=
 =?utf-8?B?NTV4eGVoR0ZidmdJQ2xNK2REVk5MdmNGbXA5NVEzaWIrK0MyZmpLa2x1SXR5?=
 =?utf-8?B?Znlvd2twT05CM3VuTFF5YUlTc0tiRldNVTM2N3YxRzJyU2JRWWYvT2pGOXNx?=
 =?utf-8?B?TUpUNnJXNkx5c2tvblowdkFCU2doUng0NThkSWkxQXExU1NtNnhYbGdnZlpJ?=
 =?utf-8?B?YVNJZVFCVDZSbC9pajNlVUIrY2hFNi9iOGZmSTRBQklURENwR3habzhJUFlj?=
 =?utf-8?B?cHVRak1FTExTaE8xYW9lU3I5djNlZDN2NUZjUklrY2JoUldEekEwMzAxdjFD?=
 =?utf-8?B?aXFJZkpDc0RnbWlGOHpCTFRuditYajlpdUYwRmROVFYybTFzbTFCUTVVMVJr?=
 =?utf-8?B?VkU5MnQrWnEyQXplanBaNFkyY0kwYjFZdU95cFZIUDFVTnBjbjNlaFg5SmFO?=
 =?utf-8?B?Y2dNZ08rZzJWQW5MMnN0emRVby81cndMVkZIUi9LODVZbmV0SGxtdTdJTVo0?=
 =?utf-8?B?UUptMXorcld0enlLR25POG81VTZ3a2hORlg5V24zWmExTEVmWE5oWkJUcFdU?=
 =?utf-8?B?K3ZQVmtNSklXSkJvMC8weXZxY1NRdWZ6V0VETEZRRjNqMC9ySjQ3ME5NbERw?=
 =?utf-8?B?VlBDTG1oTWlBRkpLT0YwSW9mQ0U3ZmQ1ZFZTeGNRcDdpNDY3Q3lIYkw2aHYz?=
 =?utf-8?B?V04yMmZuOWtsdkZhWWZHYkd6Nm5kTmFhdFdXMmo3V3I1Tjh0LzcrYzRHYXh0?=
 =?utf-8?B?Y1ZWMnRGSUJBOHBjY2I1Z2d2UDRQV2pYbTlmUEZuVWZSK09SVUQ3WkxTM0Yz?=
 =?utf-8?B?WEpQMkJTd1BsVTk4dG1nL0ozRlI1emJkbnphQXh2ZldPdExMQytBUTNaWWIx?=
 =?utf-8?B?dytMUVY4UDY0L1FJUzhFSGhBaHFJdDZVSm5NS1Bqd01BUUM3VzRzVktGdkVt?=
 =?utf-8?B?WW1Kb1ZpQkt5eWhxelg0Z0d4dTdhZ0hvTGZsWHVKYml6ZGdLMEl6NGZaQlNs?=
 =?utf-8?B?dWF6bmhXZ2lDa3dLWmNOTTU4ZjcxOXFDNm1teGhza2Z0TGZGNVFsWWdjTDN0?=
 =?utf-8?B?VGhKSzZPZGJGMFlzQjd0OVRtMXVWMiswNjM0UmU0dys5Um45YWhGcjYwaVVE?=
 =?utf-8?B?N3hCc0U3Vnd0dzhMT2hBSTlwZ2E4L0dmanNtMDl5NEFsWCtMZG9zeVFXdGRI?=
 =?utf-8?Q?qz9JDnrkPXAqOY624+EIIjf9RDegQvVK7NJBEVOPefyZ?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5dff5679-8016-4ae5-1271-08ddbdebaf54
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2025 06:50:11.4133 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gHlRdcOF9qIFZfQqRnV6asAFPsifqPuqpegV5j05k96rC25n/Rk/xSeQm6ZulSwK6VNbdrwJX9lqIDFNYSmSHg==
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

devinit is mentioned in the code. This patch explains it so it is clear
what it does. devinit is not only essential at boot-time, but also at
runtime due to suspend-resume and things like re-clocking.

Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 Documentation/gpu/nova/core/devinit.rst | 61 +++++++++++++++++++++++++++++++++
 Documentation/gpu/nova/index.rst        |  1 +
 2 files changed, 62 insertions(+)

diff --git a/Documentation/gpu/nova/core/devinit.rst b/Documentation/gpu/nova/core/devinit.rst
new file mode 100644
index 0000000000000000000000000000000000000000..70c819a96a00a0a27846e7e96525470d07721a10
--- /dev/null
+++ b/Documentation/gpu/nova/core/devinit.rst
@@ -0,0 +1,61 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+==================================
+Device Initialization (devinit)
+==================================
+The devinit process is complex and subject to change. This document provides a high-level
+overview using the Ampere GPU family as an example. The goal is to provide a conceptual
+overview of the process to aid in understanding the corresponding kernel code.
+
+Device initialization (devinit) is a crucial sequence of register read/write operations
+that occur after a GPU reset. The devinit sequence is essential for properly configuring
+the GPU hardware before it can be used.
+
+The devinit engine is an interpreter program that typically runs on the PMU (Power Management
+Unit) microcontroller of the GPU. This interpreter executes a "script" of initialization
+commands. The devinit engine itself is part of the VBIOS ROM in the same ROM image as the
+FWSEC (Firmware Security) image (see fwsec.rst and vbios.rst) and it runs before the
+nova-core driver is even loaded. On an Ampere GPU, the devinit ucode is separate from the
+FWSEC ucode. It is launched by FWSEC, which runs on the GSP in 'heavy-secure' mode, while
+devinit runs on the PMU in 'light-secure' mode.
+
+Key Functions of devinit
+------------------------
+devinit performs several critical tasks:
+
+1. Programming VRAM memory controller timings
+2. Power sequencing
+3. Clock and PLL (Phase-Locked Loop) configuration
+4. Thermal management
+
+Low-level Firmware Initialization Flow
+--------------------------------------
+Upon reset, several microcontrollers on the GPU (such as PMU, SEC2, GSP, etc.) run GPU
+firmware (gfw) code to set up the GPU and its core parameters. Most of the GPU is
+considered unusable until this initialization process completes.
+
+These low-level GPU firmware components are typically:
+
+1. Located in the VBIOS ROM in the same ROM partition (see vbios.rst and fwsec.rst).
+2. Executed in sequence on different microcontrollers:
+
+  - The devinit engine typically but not necessarily runs on the PMU.
+  - On an Ampere GPU, the FWSEC typically runs on the GSP (GPU System Processor) in
+    heavy-secure mode.
+
+Before the driver can proceed with further initialization, it must wait for a signal
+indicating that core initialization is complete (known as GFW_BOOT). This signal is
+asserted by the FWSEC running on the GSP in heavy-secure mode.
+
+Runtime Considerations
+----------------------
+It's important to note that the devinit sequence also needs to run during suspend/resume
+operations at runtime, not just during initial boot, as it is critical to power management.
+
+Security and Access Control
+---------------------------
+The initialization process involves careful privilege management. For example, before
+accessing certain completion status registers, the driver must check privilege level
+masks. Some registers are only accessible after secure firmware (FWSEC) lowers the
+privilege level to allow CPU (LS/low-secure) access. This is the case, for example,
+when receiving the GFW_BOOT signal.
\ No newline at end of file
diff --git a/Documentation/gpu/nova/index.rst b/Documentation/gpu/nova/index.rst
index f38041fcd595524b204eabf6ca3aad51038682cf..e4e017d926767284b5cee844d8dba32be6bc064c 100644
--- a/Documentation/gpu/nova/index.rst
+++ b/Documentation/gpu/nova/index.rst
@@ -29,3 +29,4 @@ vGPU manager VFIO driver and the nova-drm driver.
    core/guidelines
    core/todo
    core/vbios
+   core/devinit

-- 
2.50.0

