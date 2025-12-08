Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA4DBCACA72
	for <lists+dri-devel@lfdr.de>; Mon, 08 Dec 2025 10:27:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FD0110E3D9;
	Mon,  8 Dec 2025 09:27:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="pPZ851r7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013010.outbound.protection.outlook.com
 [40.93.201.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3723B10E3D1;
 Mon,  8 Dec 2025 09:27:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NYZ9JRYc0J5cH5lRtICCgEJ3UZ+Ynpu9LMBkkx8sPpWi2K2gJzPZawfPvK7IERrPl+u5N+fvaBWf9fG+rnFTLvg6z+vgs5T0ocgrtm5yuxzVLxlDUCmPUT5oqCyktN4306ccETAuqs1ElBog2TovOFI4eAde8xYcvy83uuimvO0gkYa+22DmBD39nKEfG+gDV3rRl0iq6xeIO0L64hkaoUWuBk69Vw8+4X0XUFhVFfx1FtnOg2QNQwWaHC4uDb+PJznYBmJBcb4YrYgYnJFVbJWnp+SgZXakWAEkhsQZwexd/EryK7p4wjDOfX/ePGk7EmC2WkRPQDdZEKFfhQI5hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EDu0Ba4u1qGUcfSDU+w89Ipktu6Mt9iPjQkdgwHgj6A=;
 b=vpelkW1rbl4poblie8zPuTFUqlprdnZUq1vIRn7lSatkM79n2o35G1tlbXlLZb+0WuGrjv+sXykXaYvLqhv6JuSUx4xMG3VtVMgOAwvMuhfva3kd/gnuZxmRTtyeayWKaQTCbpHuRCmEP5By0PL/FxyMWNOg0zukTl8OghonJ7uHaU4JzzOekTunMWNlelqPWFw7trULZ8zBjqnFsbfBsaWknlXAJAPCdzvgOeA/H4NPDYQij09qfv0G85bRPvcxRm7aswWWezTJJpPM+rWGXxdV5WqDyGZCpjt4tuj/IikBf3R7m3GRXSPTgkr9C+IyGXBtx3kV+b+6eX3VNzcY6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EDu0Ba4u1qGUcfSDU+w89Ipktu6Mt9iPjQkdgwHgj6A=;
 b=pPZ851r7sMQSv0utSldsWQspUCEi92NycFfzDKfLs2JOHVTohl/Yq4irLVjr4upXHAEcRQkJWyluefDgRrGhcm8tHrBwbMwkG8GNTo8KX59wAbepqI5jt7y84OKt8pzUHB0JeLTXn5TZlyXsSVNE1Pat7EbFNjahMu49zWrDs0Ro5c02p42mQ//RKpTqehjtCUwdhWL1QMvep3XnAySDzjvZMJwPHxccSMnO0ma8LP0r3vSWijyKUeSLg5n93mibBgbD7FcN5HsAfxHsvk9Oym0d2RoFHFfkQdSxHvgCzBEUdrlQg8hc7n/3XbyoAxkGCJ5hpMEhm8m33asTTerjRg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH7PR12MB8108.namprd12.prod.outlook.com (2603:10b6:510:2bc::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Mon, 8 Dec
 2025 09:27:05 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9388.011; Mon, 8 Dec 2025
 09:27:05 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Subject: [PATCH 0/9] gpu: nova-core: miscellaneous improvements
Date: Mon, 08 Dec 2025 18:26:52 +0900
Message-Id: <20251208-nova-misc-v1-0-a3ce01376169@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANyZNmkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDIwML3bz8skTd3MziZF3DFHNL8yTTFDOTNCMloPqCotS0zAqwWdGxtbU
 AvfPM31sAAAA=
X-Change-ID: 20251208-nova-misc-1d797b5d64f2
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Edwin Peer <epeer@nvidia.com>, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: OS3P286CA0037.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:1f5::14) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH7PR12MB8108:EE_
X-MS-Office365-Filtering-Correlation-Id: 3fda74d5-2505-497a-803e-08de363bf36c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|1800799024|10070799003|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VGdJcnNSN2JWb09kRS8rOEJxQnRNNnVDU2QwSDBoakJqdjladDF4SFJxd25n?=
 =?utf-8?B?eEJNVVBpU2FtRlV1SHFKR1JDYjk0OXdldjdTYVNWZSt0b0RaZlB1emZPNkFm?=
 =?utf-8?B?UCtjc3RsR1JqMS9GL0JMUE1vc3BQbVlJeDlJWEF5K3dnaG5nM0IzcU5tZWpp?=
 =?utf-8?B?QWgyRnhKZm5TeVUzM3dMZUtZTjN1cCt4dmV0U2t2L3VZZkpKYUw4bTJsV3c1?=
 =?utf-8?B?cWlKa1NSSHM0eHA0QkFjVUsreXJDaE1ZbXBVTmFPeHFabzg2ci9JUGRXNmJ3?=
 =?utf-8?B?dFk5dDJkR29XVlhFOFkyaGFEQ3pKUFJvRmw5SUVKZVVQR216eXN1WGJ6YW1D?=
 =?utf-8?B?ekh0RDgyNEgxdkU3Q3RpZzZtSnNyNjEvbGxkcnNxS2N4YkpuZkpwU04wdlls?=
 =?utf-8?B?dnh2K1lvM0M0TXc0d2JFZW00ZEhnajBKb1JmMUExOWhDbnA4clhaRmx2R21W?=
 =?utf-8?B?dFdKdlZGTHVxOEcxbjRrcnhZUkM5SnZMMlM3MzlRWU1uYm1sbHVKalRQUzZE?=
 =?utf-8?B?dEluQ2s4S203L0ZyL1JCaXhYL0piaTl6cFk1dVpUU0FHOXQ2WWhrZUhjZUI0?=
 =?utf-8?B?V2lxTFlXUXI4Y1N1em5oblFOZ29kWXMxMlh0OFhsaktuQ3o2Mjd5M1Ywb2tT?=
 =?utf-8?B?NFpNdUpXRHF0b1p2VWI5OUFMcDBwdDEvQTNCaG9KQk9wYlczRURNQmNBQk8v?=
 =?utf-8?B?bXN1VzNmMTVuODZlWlJGem1wQ0R4cVUwM3BaSUVJN3NGeEJpRjUzOE9aRW0z?=
 =?utf-8?B?OFJGL0MxTGdVQU51aU9RYi91K0s5WHVLeXZ3cFZ3TVlWTXZKTHlVemhSaFp1?=
 =?utf-8?B?MWhmT2VuTVlRQlloZEdveWxNaDNlSmRnUCtNdERwZGFzSjdXMVUzOTM2N3c2?=
 =?utf-8?B?TVd5N2IvTHhzOFBoZFlBVXllWkdRUDJIcjZ4NVlPL2p3amFNbEhHZ1FPWDNj?=
 =?utf-8?B?TnlRditCWHFHeXZyWW95OElmVUFwek5SMDNxWWR4cmxHekdtSnJPR29wOFkr?=
 =?utf-8?B?Mmp3ajBPSkpHeWpLMnpjZXRiekFWbm83UmZ3cElTN04yVWU4dURkZWNxY2ls?=
 =?utf-8?B?TnIySEJmV3k2T1BtRTUydHZlRUtEN3hIeWwxK3daeXBKSHNFVG5DeGhMc2h6?=
 =?utf-8?B?dXpBWTZWeGM2ZHByT0pJWHNtOVArQnh0VHk1SHB3YW5udnhpL2xQUTVYQjNo?=
 =?utf-8?B?dy9PSlJrZzUvY3lXNWxiRVNKRFlFTDBFWjcvWjNUQjBEL25WRXIvb1U2TGdu?=
 =?utf-8?B?N1U0YWtoeHVjRXlGUzFDeUZhNm9qdS9nR3BXZWtTSEZ5MkVDKzBBYzV0dW5W?=
 =?utf-8?B?em1DbHpwbmoxL3JkZjJFdDUvOVNlMmtTK1M4SFBXbE4zdjV1eHVzamdvL0t0?=
 =?utf-8?B?ZWgyVm5ObHk5U3k5MG9CVmkzdFNUUURPbnJRL1owR2hRZ2ZNODdueW1RSUpK?=
 =?utf-8?B?Zjh5SHhKRXpCeGhqOVg4WWJ2NEZINXd6TFEyZzMrNmJhN3E4aWY1bzBLaXJw?=
 =?utf-8?B?S2RRMGMyQmNTWlpKdWV3Tkd6Qzc5d2poZ2lnMDBkemU4Z0JBWTA2MW1McEJ0?=
 =?utf-8?B?OWRSenV6Vm9IeGZXWWg5VkljNVNDalBKYzJCOEVCT0J4bDBWQkZJMUlOYXNI?=
 =?utf-8?B?bFNhMDNKUXlaYlEzbTcyN3JYZXlhSzBIUDRqOWV3ZVlGb2FiTUYrTnc0Q3Uw?=
 =?utf-8?B?QVMyZC9za0ZEOUp6NE0wMW90MGxwN2IxekYvVVBJdURIdEZpS3FIMzJ4R0Yw?=
 =?utf-8?B?dmlpMFNDb2NwSG1BcjYvUld4ZWgxbEFjOGxoQUdndHF0bjBncG4yV0N1RnRL?=
 =?utf-8?B?MjNYRno4a2hTVEhqSDlJNWFPQ0FYTzg2b00rUDJSenNLTEVYeUlzTktsK3hQ?=
 =?utf-8?B?SHJkR2lzVE5VZEdzOFd1dVZRSGd2K1ZyNGhxRGF0TVQ3U1ljU0U1Z2g5aUFm?=
 =?utf-8?B?YWx6V1JzWGE1azRwVklqWjgxUVEyb3JrUVpzN2p4UE5xdHBKdU8rQWF6cGND?=
 =?utf-8?B?RnNuQ2E2bmlnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(10070799003)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a3BEczF3SVZaZXdEOEZHZUlLa3Jjc2dkU09xSGpDUzZHcWczS21pVDFKcits?=
 =?utf-8?B?bFBvczhDa2QxU3FJZzVpUWhjSGZhZGVhSldlUTQ2WVpOVFhDZWFyeENDam55?=
 =?utf-8?B?Z1MzZlg2b1M1QTR2V045aHNnUVA1MldmSjVUM2paWmZzSDZkTE1oNkd6Q0RU?=
 =?utf-8?B?YWtXeE05b1hTWWR2bzdINUhiN0pNbWVaMjNhdnk3d0FLRDhKVGxvK3U4anE3?=
 =?utf-8?B?YVVORGlEZG5pcjlxRHNnMHJaWWgzK0t4WkdYV3FCblFWcFBDUm16QmNXcHFG?=
 =?utf-8?B?ZlpxRHRkckxGVlZDa0s2a3NiNHBtZUFhbmlOdEVsVFFGMTlPaW1nK2tJNW90?=
 =?utf-8?B?cXFlK1ludVBSeEUrNkw3OGtrOW1lMmtsTTF6Vm12aVl6U29VVXJxc1V2Skph?=
 =?utf-8?B?RHFzWSs1UHM4Vm9pOHBiSGoxOUlWKzBnZDNOYnNBTlE5ZjdXNmlPdmlBQlVO?=
 =?utf-8?B?aWVqOGZWOGFXbDVVNWtkU2JNQkJJZ1JEaEh0TFQ2aVg0alBVQkp1MGlVQldv?=
 =?utf-8?B?N3loNWRacklSOUpjRkZ0dXRtVk9NUUtFQUMzZUxzWE5yTExiMHNuNFZtNU9C?=
 =?utf-8?B?TEphdjJXcmdmMlBGV1dqc3VSMjM5UnRDM0ZUeFM3dElTNHpRMjBNMWRYZERP?=
 =?utf-8?B?WC9hVEgyTGhCaTFuQVJoSGVyOHVKNTFYWkNINzk3Ums1TFZ6UG94bXNBRW5Y?=
 =?utf-8?B?ZW0vN0xCNmFGWGkrVFZHYlBmRUsrMEpMYkZSTVVrUTB3L0dMY0M4d1FBYkpI?=
 =?utf-8?B?UldjeVBocUkycXpYMGhBa0hsdkhOWHIySExsSFIyS1dKRnZGMjJEM1NUUlRn?=
 =?utf-8?B?c2RtTFhsUW9rNVdIRlQzcGNnV0l6YXh2Mzh4dnZWeUFwQTh1MEZZbjJmencw?=
 =?utf-8?B?TXY1UDNZRFVRVVZ2YXBwR0hRMGpseEpvUHdHNC8yVGI0YjhWa2lTeWpPMkhJ?=
 =?utf-8?B?SFNnTFN2djlrcW0rQ3dTbWxXTHVNbzQxUEtIVGhYSVpwcVA5eEREUFdocWVw?=
 =?utf-8?B?bEhwWGd1M1BzS3ZTYmp0a0VlUmM1SEcySHZNVkE3cGNQOE9JYU9BSjdlTUE2?=
 =?utf-8?B?N2FCcXd2REZlc21JdHR5MkR5UWovRmhCL2JuY1JyOFR5SUFpQ1Q1dVQ3YVE2?=
 =?utf-8?B?ejA3bFA2a3FjM3BHZy9YOXhoeHhlbXdSdnJhWXN3enFqclg3WDh4QnRGdzQ2?=
 =?utf-8?B?YW82bTFzQ1FkcGNPN2ErUU5BUGNIejlWYksyVmxySndKVjdzZW9QTHNBaXlZ?=
 =?utf-8?B?TElPL3lNTTBVUmx4KzAxMlhWSUc3cDZZWi9mMHRtZlpQMjBQZnBySXFZcHln?=
 =?utf-8?B?aGpYbENSUkl2OGt2QXJzZWgwYUlVRWF0QVRMQnZuVFY3bWgrQ2FIdDNZMTd5?=
 =?utf-8?B?azBJV3dQS1N1dURERUxXVENTbVZkM3I0UW1vTVJTb2dhbm1XWnZtalFTcDE0?=
 =?utf-8?B?SENGTjB1WnhKRWN2SklQd1liOHU5d0hHWUhaME0weGNDenlyZTRTOFltVGJl?=
 =?utf-8?B?TmZlREFyVzFkLzR6K0JhMWZhNTJoQmlPVm5OL3RKRmVEbGlscnlQUTBwbDZD?=
 =?utf-8?B?V2RBY2hvS2VyTytGSFZNRkNJdHFOTHV1RXQrV2xZdFRqN2M0dHNES2NYUitX?=
 =?utf-8?B?OEt6dHhZMkFVRG8vOWZtQ0hIQS9TS0dtTUwrclpid2JFYXplTm9QRGdXTHJR?=
 =?utf-8?B?TGF6REE3SWNWMlFHdjdNekhNNE5MemZIQWVjZVdDOWhHRWc3QkpxbmxKQjMz?=
 =?utf-8?B?TUtHRW5ZR3ZzU3R3RC94d1JIdjdhNGFLMzJsb2cvSk5KdHVVV0tDU3hobUpl?=
 =?utf-8?B?aXQxUHhZd0hQRCtURnVQeWlRblZTNzZzN00zS0lpSVc0VHlKQ3ZQWVlHSUFP?=
 =?utf-8?B?eVU1OElKOVdjU3crbUJjR1hXYmNoT25URFYxTy9FeERNOGlodDlvUHBQblpO?=
 =?utf-8?B?NHA0S2dMU2hvcnBOSDNCT0FRN2Z0Lzl6TEpCT2hXd3FXNmRYMDFTVjh0cSs0?=
 =?utf-8?B?Mjg5S3lvWnRhUTFIL2tab05DN0tmREordHo1eW04QmJkL0xOaGpEenBCNmxt?=
 =?utf-8?B?OUNBY1JHMmV3d3M4WjlLWGtqZmZsRGQ4QmV0N0gvTng3dFp0aHY1VGFDRjdS?=
 =?utf-8?B?LzdFd2ZSWmJVczloYzVqVmlOdWVESklwcHVNeTI5aHg0SWtBOFVsTXAzR2dp?=
 =?utf-8?Q?icFKiOz5xQw3dJdWW9qwaFMN+MG9GLj4i2bT59txL0gL?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fda74d5-2505-497a-803e-08de363bf36c
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2025 09:27:05.3387 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Gttznaxib+iL2j4FxYiZaDn6WJbU8Ljk1r1/toSaT0X5FCP5sRA3Z4UVW3RlqRrheT29W+Lnmth1bHB7Doc5zQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8108
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

A few simple, loosely-related small improvements for nova-core,
including reporting unprocessed data in GSP messages, removal of
unnecessary code in GSP and the sequencer, and leveraging the Zeroable
derive macro and core library's CStr. Probably nothing too
controversial.

This series is based on the fixup patch series for this cycle [1].

[1] https://lore.kernel.org/all/20251123-nova-fixes-v2-0-33d86092cf6a@nvidia.com/

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
Alexandre Courbot (9):
      gpu: nova-core: gsp: warn if data remains after processing a message
      gpu: nova-core: gsp: remove unnecessary Display impls
      gpu: nova-core: gsp: simplify sequencer opcode parsing
      gpu: nova-core: gsp: remove unneeded sequencer trait
      gpu: nova-core: gsp: derive `Debug` on more sequencer types
      gpu: nova-core: gsp: derive Zeroable for GspStaticConfigInfo
      gpu: nova-core: firmware: fwsec: do not require bound device when unneeded
      gpu: nova-core: use core library's CStr instead of kernel one
      gpu: nova-core: simplify str_from_null_terminated

 drivers/gpu/nova-core/firmware.rs        |   2 +-
 drivers/gpu/nova-core/firmware/fwsec.rs  |   7 +--
 drivers/gpu/nova-core/firmware/gsp.rs    |   6 +-
 drivers/gpu/nova-core/gsp/cmdq.rs        |  14 ++++-
 drivers/gpu/nova-core/gsp/fw.rs          | 104 +++----------------------------
 drivers/gpu/nova-core/gsp/fw/commands.rs |  11 ++--
 drivers/gpu/nova-core/gsp/sequencer.rs   |  18 +++---
 drivers/gpu/nova-core/nova_core.rs       |   2 +-
 drivers/gpu/nova-core/util.rs            |  11 +---
 9 files changed, 44 insertions(+), 131 deletions(-)
---
base-commit: 449c67daceeda195c0553ca890d6944a054ff4d8
change-id: 20251208-nova-misc-1d797b5d64f2

Best regards,
-- 
Alexandre Courbot <acourbot@nvidia.com>

