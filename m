Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7672AB133F8
	for <lists+dri-devel@lfdr.de>; Mon, 28 Jul 2025 07:07:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93A4C10E282;
	Mon, 28 Jul 2025 05:07:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="aiwY11ik";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2074.outbound.protection.outlook.com [40.107.223.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15F8010E0FE;
 Mon, 28 Jul 2025 05:07:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ERci5BgbEk416+4BmFT5i61ipEz1PYFEGBmmRqMt2ubyKAtnQgwZ9fISgRJMVIE8jD7dbxOfLLytqKGB+2xjIXRAziFo5ZWLmEMqFBeyRkRRLRasp02boeuweQqazEYGeTGpSgDPmm+f6eXwBzqjHt7B8S2P7P54m8mHgT9sEeNEwEQFygCT40QcbnZd08mZj2VqlsToRIfB5RzArJ71s6b6qONCgOMf0KO49yiXSC9PgC2q9YL8tX6wPyG5kiLxcQlG3d1ZPwsVmYaoMZ0ISjUl5fU5qL6FLsDdp5nRTX4NgDnY7wwRVvZk34awHMnC37StBcgDFxDdYLzEDhY6SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6Z9mq3c3aC/GL20QEZKUQmzYc6Yk5SNPHalqHnHffQo=;
 b=rzc2tn+TRapIuO/Ph++Q71RpVQ6qjnm39RkwNxiDELEzD/pxXgQ6Bbn6Qrnu3QUPyAQKAAuKZEs9T1OaGqA3XreGwkeNBRVsg51iiYGvDAl4SekVKfepK7Gu/slarczokyV/eskecHqaQybtHL1COwTZMMBRRwClrMosV7svJb/Z1BITWo6PfcPp2PbZ5qY+asibvByQY/o9fOuf4g4p5mA5jmBALd8EsJ0Ayostm2vtht8IeSZlxv842X0JF8NBBVd8UxgwM+bRwTrGkfRzv7HH1z9m2kPzOZKgIwPU5sPBCxHExea8qrN4/jypH4AjAuEVdPd+44dSr/XpOoHiyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6Z9mq3c3aC/GL20QEZKUQmzYc6Yk5SNPHalqHnHffQo=;
 b=aiwY11ik28E8XUWXbdtriMR1KrBniUF/MNoDiP7ancaEmLI55HvFjz4WpoOScejDN/KvD1jm67m6vxGIe42hfL88kymbJLF1XdBRitXkCd5Tr+J1SlodenUWfoWdUSQIhYuxXcyBVpEsUzGaquzo43gwrYgrzT1MXF4xSSKh76qGY/oybZMAFPoFaK3t1MWMhyq7S94gT6wvo8XVSulDxqn9Z37Yo5IeQFovQWtk2gcLWsnIPyvpji7x2s+hajVQng4ivMWD06a8Ivvpur/0tt+ekZD83TxSCppjVRT8YX1dc5DoHmRNpUDS9zvpc6T5CV2LWXnWE2JmSd0X0/2cig==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DM4PR12MB9733.namprd12.prod.outlook.com (2603:10b6:8:225::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.26; Mon, 28 Jul
 2025 05:07:38 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8964.023; Mon, 28 Jul 2025
 05:07:38 +0000
Content-Type: text/plain; charset=UTF-8
Date: Mon, 28 Jul 2025 14:07:35 +0900
Message-Id: <DBNFEW6TF3JZ.1WW0SFGRXXJYI@nvidia.com>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "Beata Michalska"
 <beata.michalska@arm.com>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 15/19] gpu: nova-core: register: redesign relative
 registers
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Daniel Almeida" <daniel.almeida@collabora.com>
Content-Transfer-Encoding: quoted-printable
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250718-nova-regs-v2-0-7b6a762aa1cd@nvidia.com>
 <20250718-nova-regs-v2-15-7b6a762aa1cd@nvidia.com>
 <F19649A8-3002-4BAC-8FBF-095CF67B3946@collabora.com>
In-Reply-To: <F19649A8-3002-4BAC-8FBF-095CF67B3946@collabora.com>
X-ClientProxiedBy: TYCP286CA0291.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c8::13) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DM4PR12MB9733:EE_
X-MS-Office365-Filtering-Correlation-Id: 0fc86fdb-b5a7-40be-c465-08ddcd94ac1f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|10070799003|376014|7416014|366016; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VndSdGJ3QVczeTljbDRBc1E4cGZPQ3pFWnZzMnYzU1dEb201VjhnM21LUEFB?=
 =?utf-8?B?a1IzQlJzZDN1UnVMUWFOOEFPUU9BNzBjMW5EQUJvV0ZFL3Y5bjdvY3pyL1F5?=
 =?utf-8?B?QXA2ZUsxRU1kZFBiVCswdmFPZWt4L0dzWHplbFhSY3A5cWFWUUh2Z1RvTUxZ?=
 =?utf-8?B?NzRMcFJ6ZGRxZWNlNWxmRG14b3Q2d2p6QVJ3OFpCR29LbVdOVWlFdlRUMzFL?=
 =?utf-8?B?ZHBLcFZYcy9WRW9odlFMUTFYOHdrSjdha1liaFg4UXl0dGZET1dMcDIvV1dW?=
 =?utf-8?B?YVgvWWRsNHVBdzBWdGo0ZXhxc25VMFRhLytXcFIwMkxvbXBTMHNVODVBRnRj?=
 =?utf-8?B?RzQrUlRsdFcvL082Tm1kdlBPamVIRFhmc0p6SnBHM1plSmcvaW9NeFpuOUw4?=
 =?utf-8?B?YjdFKzlxd1hFeUVuVlRTa0xPeVNnNmRmV3lBbzdXYW53ZHZDWVdqM3JXK3E5?=
 =?utf-8?B?TGZ6TzJWN1dLb1pyeFcxZTJTZDRJc0tkUDJoT01NTndXTWpTOHI4V3Q1UGlQ?=
 =?utf-8?B?Q0N3NU5zVW14WU9vMlJhTXRDczVSUGNOc0xVaE1DenNvQzZTdjU0N1R5cVlj?=
 =?utf-8?B?dWhsbURJZlZpRVdCdEFwNGJORnRCbVlxdFgyNitvSWpQRGFLQnU5UEF3Nm9i?=
 =?utf-8?B?aTRERDNTcXlOcUd5K2wyQmhwZGlFZ1dnUityQUh2TnAwZkhieHlKdHNBZWlr?=
 =?utf-8?B?eE8yT1dOdTUwZFB5OXd2WkVpMmt4Vlk3MzZwTUxXcDlyTGNsc2orOXBPZzN1?=
 =?utf-8?B?TUhXL2E3NnJjTzdYN0lnWVB4U09JcEM5YnZLZ1VxenFWdkNDcVI0RndJZ1Zs?=
 =?utf-8?B?MUt6Q21hTEVBeFZKRUhVSndOdVpDTHI2TG5wNUFSTE14VHpxbFN5Z0tYOXNG?=
 =?utf-8?B?Sk5hb1Y2dWE0S2gybVRXSFpXK2psSitiazM3V25uL3VsYU5XQTEwK2lzV1VI?=
 =?utf-8?B?WDdINk5nODgyR0FGSWJSbjRoTnBYM05QT21pOWVMbjVueE1NS1BSR3E4cFpi?=
 =?utf-8?B?QUV3NU5LTktXanZKcXNwYVFHSjBqaCtTcmNiSGpxMWE5ZDYxMGxYK0ZtL2hk?=
 =?utf-8?B?Q1NTOVdzYmJ6L29TUklob2oybkEvMGxDR2c3UWxMSnkzcHNnbGpENUlaWk11?=
 =?utf-8?B?RWpNbnlLYjVxS1VOdUZ6Yk44aU5xYVhwSFljZjFkbWVXL215TXZuU2xEbXl2?=
 =?utf-8?B?UFFwNlQxMWtZVW9mL2JNK2x0Zno4NVJmSmVWOE1uaW5WSmN6M1F6dzcwajd6?=
 =?utf-8?B?M1c1WEdKT243aGNlV3pKeHVuMTh6RTFDQTg1eDRrMlFBNXcwVDRTT3JUY3No?=
 =?utf-8?B?V3ZEZTFyNzZhdkdxNkhWTG5ycDBvaWdCd3hEZGxvTDZsZ0ZHVHRMRG9xNWhv?=
 =?utf-8?B?UzJ6Z29EamZkYXQ2Ly9NcFpPdmpsY0JxK0Jqbi85T0tnc0ZZVW1nb3IzNEx6?=
 =?utf-8?B?WEhCSnJXZXVVdVFSaTY3b0ZpdDZzMmtRckhIRDVxditnQXR0b0NndEFpR25M?=
 =?utf-8?B?U2tjT3hNUXQzRmdhSk9ybW5SbG9SNVZzOXF3SFdCbkVFQ0I0L3gxQW5OUzlD?=
 =?utf-8?B?bEVUZVJURnF2WUJTSFdMcndqbkxicTdNalUvTk1Xbnc2Rm9qQ2NmOUd6UzRF?=
 =?utf-8?B?OFczSnZPTWYyRXdXYlhhSnpJbWdadWNTVUFHeHlPTDcyYXoybnROVDFuRGZs?=
 =?utf-8?B?TE9ManRUZVdhZlNMT1BSMkN0bkg4MDUvTGVrbnBWdU5XZlRoSVNqTnBDVGp2?=
 =?utf-8?B?b3lBSmR5RktrWG9GK1pBNWMvdjMrVEdTRXg3QW1QNENIdXhJVit4Rmw0MHJy?=
 =?utf-8?B?bjhYaXp2aEtzOC9sTTd5ckpCRUZ3V0ZvNE5QTTRlU0QvNVNMUXZoaUxhSmIx?=
 =?utf-8?B?UEdWcWxPSzdqaE1qWWZMUEJENzRhWjRoMWx3Q044VmcwY05SRWNGUzNTUGFo?=
 =?utf-8?Q?cciZBq9ACsg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(10070799003)(376014)(7416014)(366016); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YkRlTU5NTUx0YmFiekUzV0RYSXhGaTdoNDdZZENGbzJMdnBoeEdtR1BWZm5H?=
 =?utf-8?B?Q0xZNHN1L252SUQ4Nlg5SVJQeE4wNDIxdysxN2FRZWhaaTh0c3h0ZGxqRjBs?=
 =?utf-8?B?Z3RyTmpzZmtKQStDQVNCb1pqS3lERXFmN3QvbVFtNEU0blJET2t5NWtNVkEv?=
 =?utf-8?B?VEMvYTJHeS9BbHQ2Njd6YTQyQlBZN0hZVElEQ0VEWmcvUmZNY1kzbkF1cE04?=
 =?utf-8?B?bHRSRk5ESlI0aFJLUjZEb24ybG56aE1Fdko3cW4yZmUvY0ZiWWJadGFvbUJT?=
 =?utf-8?B?bjdadk40dkN5eGQ4K1BTN3NhbU8xemtDL2k1WmNkbGYxNnF4OEFzcXFLL0Q4?=
 =?utf-8?B?aEM3cDFuT1lKVmphR0pLbTB5WnNwRXZ2TnFpSGc0NmtaUzdFMnNCY2NWTWdv?=
 =?utf-8?B?bTJZeXlJblY3RDVYcy9BOXBpZDVnTWs4bTQvKzRFc0NCU3JXYXk2NXdFVlNx?=
 =?utf-8?B?cFRJQ2htaWNzS2VDcU44c2c1QzRDL1BUekhJL2tEOUFrcG5CZEtHczVaMWZy?=
 =?utf-8?B?RFhLWGtJS3BNRkN2cm1tdmYwaHdtSlRLTmMvSWtkK2xEQnlzMkxQYlc3SFN4?=
 =?utf-8?B?ZDNkb1Z2SnFtWVpSUE1KdUFlU0RMM3krcmxJeUpZdzFTSkFGcDNhWXc3SE5n?=
 =?utf-8?B?TDZMWUUzUFdDR2hjYlpjcHdmL1ZyQ3BHNk0wNXhYc2NkT3NUS2FnOXl6QWcz?=
 =?utf-8?B?ZzlLa3RpYjF1MnRLc0k5VFFSYytZd2tNSEFjK1JXSVZqOXlVbHBTOTNRSndZ?=
 =?utf-8?B?UVZhTFB2VXpCaTJkMHBPbDRVbjI1Q0t2YVl6U2lKYXZudFM2ZTkxRzY4RjZp?=
 =?utf-8?B?bndqaWVYK2lHQ3JZM1V3MU56U2NMaUVqNmN5ZHdiREY3TG91L0YwN3F6a29a?=
 =?utf-8?B?UXlpRWo5by9USG95RENOQVo4VlNROS95MWtwQ1JYblRvYUs4VTRTKzRtQUlw?=
 =?utf-8?B?dGxDVUhMNUYyZDMra2Q4akYyN0NsSmxDdjROSHYrWTk0WVZ5MGc2dmpNcUhv?=
 =?utf-8?B?c1BtUzBEQjhTYktWTDBqL1FFK2xkdWNocjdsZFAxSjhrakEybFlEcGowSys4?=
 =?utf-8?B?TzVFdE5aYlFnODVPOVZsU3BVZmhneVk4VFROaThSZ3dwS1FiaDJWZSs2Vllz?=
 =?utf-8?B?UHhmdXNMU1NHRG8vNS9sc09aMzNXOWhLNjdrZW9oYTg4YWNja0R3SzFvcVhE?=
 =?utf-8?B?VWxWVFBxSWh2M2FFSU1Ia2xDQ2lCK0tKcjNqNWgxb1ljcDZqTWVOSG9QSHB5?=
 =?utf-8?B?K0cydEljUjhKN3dHSWluaVpvdllVYU8zTU1Zb1h1T1Qrd0ZKdFh6OFhVWks3?=
 =?utf-8?B?Wi9MVkJLSi9weUVDNHFkcHhXZWRkU3FDUGZWS2VDaUtycFNzNG5aUGVJNk5U?=
 =?utf-8?B?TDhCU3NmaVFzRzRWUEF6MUk1Y2lESTdwZVFKSmhoT0VvbjhneXhxNnhZMitj?=
 =?utf-8?B?Z2kwNzRCWHFyd3VYc2wvVHkxVW02d2R6eUdFcXBTQmt1ODdCRUtseTF2UXV4?=
 =?utf-8?B?Tm13Y2J6K1lmYXlGMUQwVStEZTZ3K0hzbTdGQUJEcjZBYTdKa1ZrSEhzVmlL?=
 =?utf-8?B?Yzd5OTVtOUtWVFpVcC9MNW9TK0RYUyt2TEovV3RaS1ZKYWdEd2psQlhZOWJG?=
 =?utf-8?B?OEFiWWQzREJ4RzhURUJVN2JiRXNmc2dQdVNjdmNkekxsL0NZbWJaaFk0WCtm?=
 =?utf-8?B?aU5TMFFLQ0RTSDJKWEdzZHdvOWVLbjRMWkIxc0oxek1XMERPS3hrOXhBWkxW?=
 =?utf-8?B?TVEwWUllS3VRbmV5bWZPNXV3ZVlpYVB2akJMV0pSQ1AraTF2QjRhdy9EYU8y?=
 =?utf-8?B?MVF2ZDBmMDkzMmJwQzlWK3UzNVJPKzVnNGh5Q3d3Z3dka3VtV0EvTDRja2hM?=
 =?utf-8?B?bklIRkoxOFM4QkI0eWplbWIzaitIRmUwc25pM0pFSGNjWWJUb3FuMkxtVFFl?=
 =?utf-8?B?ZllnWDlGQ3JMSkx0RmVvL2J4dUY1UStIa0NBdEdzRGxZY2gyOWhyVC9lUTd3?=
 =?utf-8?B?UlBUUmVKRFdpTHB1R25ZUFpsUnZ0TVRJeTh3aWN5ZG1QQlFJdU0vUTRhRGZm?=
 =?utf-8?B?SitHdlhUaUUvR2hIN3UxdVljV0M2dFlWMlRxOUp1Z3JrN3NKc0pzalh4a09M?=
 =?utf-8?B?bUdGRVBTbU02dUE2QitweEs1SFBLVjZHTTVRczhWSzVEWXRxL2MvMmNxR3Rv?=
 =?utf-8?Q?1aDx0TgLqVPjMG6qN1VMq7GBcddEhFMABSL13CWlSgZU?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fc86fdb-b5a7-40be-c465-08ddcd94ac1f
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2025 05:07:38.5335 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f7HRJxlsKI3ULDOdpWARaA9ioI0hvxtb3pXwXXA+Nr8dMQc/eYDHPsJ3KnmH9F0gcT5QBZ6AEC7aAT9PtBL6MQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB9733
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

On Sat Jul 26, 2025 at 3:56 AM JST, Daniel Almeida wrote:
> Hi Alex,
>
>> On 18 Jul 2025, at 04:26, Alexandre Courbot <acourbot@nvidia.com> wrote:
>>=20
>> The relative registers are currently very unsafe to use: callers can
>> specify any constant as the base address for access, meaning they can
>> effectively interpret any I/O address as any relative register.
>>=20
>> Ideally, valid base addresses for a family of registers should be
>> explicitly defined in the code, and could only be used with the relevant
>> registers
>>=20
>> This patch changes the relative register declaration into this:
>>=20
>>    register!(REGISTER_NAME @ BaseTrait[offset] ...
>>=20
>> Where `BaseTrait` is the name of a ZST used as a parameter of the
>> `RegisterBase<>` trait to define a trait unique to a class of register.
>> This specialized trait is then implemented for every type that provides
>> a valid base address, enabling said types to be passed as the base
>> address provider for the register's I/O accessor methods.
>>=20
>> This design thus makes it impossible to pass an unexpected base address
>> to a relative register, and, since the valid bases are all known at
>> compile-time, also guarantees that all I/O accesses are done within the
>> valid bounds of the I/O range.
>>=20
>> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
>
>
> I think it would be helpful to showcase a before/after in the commit mess=
age. IIUC, we'd go from:

Agreed, that would help understand the change better.

>
> /// Putting a `+` before the address of the register makes it relative to=
 a base: the `read` and
> /// `write` methods take a `base` argument that is added to the specified=
 address before access:
> ///
> /// ```no_run
> /// register!(CPU_CTL @ +0x0000010, "CPU core control" {
> ///    0:0     start as bool, "Start the CPU core";
> /// });
>
>
> To:
>
> /// ```no_run
> /// // Type used to identify the base.
> /// pub(crate) struct CpuCtlBase;
> ///
> /// // ZST describing `CPU0`.
> /// struct Cpu0;
> /// impl RegisterBase<CpuCtlBase> for Cpu0 {
> ///     const BASE: usize =3D 0x100;
> /// }
> /// // Singleton of `CPU0` used to identify it.
> /// const CPU0: Cpu0 =3D Cpu0;
> ///
> /// // ZST describing `CPU1`.
> /// struct Cpu1;
> /// impl RegisterBase<CpuCtlBase> for Cpu1 {
> ///     const BASE: usize =3D 0x200;
> /// }
> /// // Singleton of `CPU1` used to identify it.
> /// const CPU1: Cpu1 =3D Cpu1;
>
> So you can still pass whatever base you want, the difference (in this
> particular aspect) is whether it's specified in the macro itself, or as a=
n
> associated constant of RegisterBase<Foo>?

The difference between the two designs is that with the former one, the
code reading the register could pass any base it wanted (any number!),
whereas with the new one that base must come from an explicitly-defined
type (which implementation is controlled by the party defining the
register), which reduces the risk of typos and mixups. The type system
ensures that you cannot e.g. pass the base of a GPU to a CPU for
instance, whereas the previous approach had no such protection.

>
> In any case, have you considered what happens when the number of "CPUs" i=
n your
> example grows larger? I can only speak for Tyr, where (IIUC), I'd have to
> define 16 structs, each representing a single AS region, i.e.:
>
> +pub(crate) const MMU_BASE: usize =3D 0x2400;
> +pub(crate) const MMU_AS_SHIFT: usize =3D 6;
> +
> +const fn mmu_as(as_nr: usize) -> usize {
> + MMU_BASE + (as_nr << MMU_AS_SHIFT)
> +
> +pub(crate) struct AsRegister(usize);
> +
> +impl AsRegister {
> +    fn new(as_nr: usize, offset: usize) -> Result<Self> {
> +        if as_nr >=3D 32 {
> +            Err(EINVAL)
> +        } else {
> +            Ok(AsRegister(mmu_as(as_nr) + offset))
> +        }
> +    }
>
> It's still somewhat manageable, but I wonder if there are usecases out th=
ere
> (in other drivers/devices) where this number will be even higher, which w=
ill
> make this pattern impossible to implement.

If the range separating each instance is the same fixed number, then
this sounds like a good chance to use a register array with a stride of
`(1 << MMU_AS_SHIFT)`. But I suspect you figured that out. :)

