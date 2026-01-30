Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0ECeLQFKfGktLwIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 07:04:49 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E123B78EF
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 07:04:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0469810E905;
	Fri, 30 Jan 2026 06:04:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="Gpy0AhSY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010004.outbound.protection.outlook.com
 [40.93.198.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4957010E905
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jan 2026 06:04:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vKQ47HkfRnpgSotIgHpdBcXufBNHkQZO6/kBCEIfw9uMgnVZGKnBN9rfJcLt8qycX+jK9R8eJ27nxpylahAK8eX1Qy9HN1kBth7Y1Ko9xv7Vu9PxdW9eFEUOSzjOmMTS7szBcyaMaRBK9jrj3CPYVqfg8K8qgFnJPUMjaIEg/3GEihl0bsKSjhhVIkOw6pe+SjyB3D0o4N3hxPH0I1FFumVAExyVe4aiWLV/Stm9oN+homecPNGGPHqR6Gt5++atkMJFi+eXXGA6n9ez+CEondiOytnN9q4u6PdXj2TzwaofWFULWpEfy2g55qg0uNB6ggtUO37m5A+uhI52pfLt9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TKxEfo+y7JwqbzMkIxwL0c81dKPbf4m7NbcinrEFObY=;
 b=tyFRhLx+QQDXfFrFEIjRrjiA8Y5a8pluXAoJz9eqboo+Noesn7diA6csLXvfnJosHLreHC1Tr6usc5t4wuDd2ehAY0nRJ6sXX+CfBtlEedgGMp0dKtUlkkdmPjtfNC5phnDGFAU2mif8yX6dZiqse/cnROARFTvhv+70rQ5X/J4LwZI7jtio7E/vQqT5YIazfJwrLvIGPo96s91Bs2MW3Au205lJSPnJCIBNbGc+Ran+iN0eYHW21q4YZdrMgYNs32b6kD99B7bT8ROsZCPM610/DE6fIuWG8t+cDnA25oEWXCKVMDnaDDHdTmHl5IFE/lML2rH6SrJNg7AWPsoLUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TKxEfo+y7JwqbzMkIxwL0c81dKPbf4m7NbcinrEFObY=;
 b=Gpy0AhSYImriDGztj63fSLneqXjS97xE5hEd3ev3fwEIx8QghORV5x5hwlqbZ7EkeKiHFaVZb0sFmrhpNunHd1tes7ejSO9c656+E9puk2mK9o2WZ3+KTzluiqcss5EWRhJ1pwLOPVP3fpi3uPSpzHsk1zUfiVgmyOJ89DyGYQs=
Received: from CH5PR03CA0003.namprd03.prod.outlook.com (2603:10b6:610:1f1::19)
 by SJ5PPFC802EB2B9.namprd10.prod.outlook.com
 (2603:10b6:a0f:fc02::7cb) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Fri, 30 Jan
 2026 06:04:41 +0000
Received: from DS2PEPF00003440.namprd02.prod.outlook.com
 (2603:10b6:610:1f1:cafe::4f) by CH5PR03CA0003.outlook.office365.com
 (2603:10b6:610:1f1::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.12 via Frontend Transport; Fri,
 30 Jan 2026 06:04:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none; dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 DS2PEPF00003440.mail.protection.outlook.com (10.167.18.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Fri, 30 Jan 2026 06:04:38 +0000
Received: from DFLE211.ent.ti.com (10.64.6.69) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 30 Jan
 2026 00:04:38 -0600
Received: from DFLE215.ent.ti.com (10.64.6.73) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 30 Jan
 2026 00:04:38 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 30 Jan 2026 00:04:38 -0600
Received: from [172.24.233.20] (a0512632.dhcp.ti.com [172.24.233.20])
 by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60U64XjP814780;
 Fri, 30 Jan 2026 00:04:33 -0600
Message-ID: <0711169f-6054-44c1-9039-1b56e68c32e0@ti.com>
Date: Fri, 30 Jan 2026 11:34:32 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: display: ti, am65x-dss: Add AM62L DSS support
To: Rob Herring <robh@kernel.org>
CC: <jyri.sarha@iki.fi>, <tomi.valkeinen@ideasonboard.com>,
 <airlied@gmail.com>, <simona@ffwll.ch>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <krzk+dt@kernel.org>,
 <conor+dt@kernel.org>, <devarsht@ti.com>, <praneeth@ti.com>, <bb@ti.com>,
 <vigneshr@ti.com>, <dri-devel@lists.freedesktop.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20251224133150.2266524-1-s-jain1@ti.com>
 <20251230022741.GA3217586-robh@kernel.org>
 <fd9f0b37-001e-4721-82b7-ee29379eb9a9@ti.com>
 <CAL_JsqKYsf9dmY3qKx6MVT0-0emTzO=0z32rOzt3070LykhrPA@mail.gmail.com>
Content-Language: en-US
From: Swamil Jain <s-jain1@ti.com>
In-Reply-To: <CAL_JsqKYsf9dmY3qKx6MVT0-0emTzO=0z32rOzt3070LykhrPA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003440:EE_|SJ5PPFC802EB2B9:EE_
X-MS-Office365-Filtering-Correlation-Id: b572b896-c4b5-4a1f-c262-08de5fc573cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UjQ0RzlpVC9FVXRiTExnNXNpQWo0bXptWHlrbWwrSU5paTF0VktlVGloTGtX?=
 =?utf-8?B?SFI0TkpFSHpwNEJJWTBLSkJRZnVkLzVjYjhwMmxzSmQyb1Q1QkVFbzB0NmVO?=
 =?utf-8?B?c3FIM2toZ3JYYzlOY0liOUJBbFBxUTdwUW1CTGg1aTFuWnU1bi8rd1U4S29W?=
 =?utf-8?B?RGlsc0dKM3lramduYzgwTW1OWUhSdGRVYVdsakw5ZmpwZ1JYNjZkdHE1WVhs?=
 =?utf-8?B?cG1mOEgvL2V5S3h4Q2MrdUVxM1k0QTNrdGJ6N0JnZ3gzc25xSXV0MzNha0hL?=
 =?utf-8?B?OEJGblJoQTBIdEdwWTM4eENBMFNTMFRZWlpMUGZ4eXdETjlxMUFKZG1KWWhW?=
 =?utf-8?B?L3lWNW93M0lhMUpOUzhobm8vWGtCRzJENFV5ZUsxZzE1emNKZ1ZaQVQzd3cx?=
 =?utf-8?B?eXFlQUNRa1ovNFE3Uk9reXQ1QXJManVNaGlqYlJDTnpFOWNGalVma2JLSW9U?=
 =?utf-8?B?T3pXcWZwbm41bTFHNEFlZFRTeDE3bnpsMCtZRFdQbnlWOG10dllucGN6andk?=
 =?utf-8?B?OEFUbTVLWTlXbFFSeUxXRUU1ekV4UnVPd09vS2RteEFxYUozRWVydnJvTE5z?=
 =?utf-8?B?NHp2MEVQQS9nZUxBOXF3aTRMYWVZUlFDWC9uajlaMkxBUEtHNjlLelBVdFFa?=
 =?utf-8?B?UUZGWTlkQkxoZC94UXc1V052NGFFcEtyM3Y0WnhyRjg1QndvaVZhbnAzVUs2?=
 =?utf-8?B?cGJxVHJCeUgxSU9UcGE1QnMwZjJseWlONkJ4TlI2dDhKQjRHMy90cFpJamVk?=
 =?utf-8?B?VlpGQ0lUdmw4OUtuMVBwY1dSMnExQ1pXeG9TYUhtenJYT3hQYTJaa0lOYkRl?=
 =?utf-8?B?NHBuekhFSTQxdExVa21aY01kYWZqYlpXMFMyN2xmWXZhWi84UkNZWEFQcy9t?=
 =?utf-8?B?ZUF1ZzN5SnE2QTZINEhDNjVaTjB6TjYvVDRnc21MektvSnZXRkE3ZE9Lb25t?=
 =?utf-8?B?emdDakNZNFVzUHpnOEl2eUxGMjNkaVNCdjhjdTN3am0yZUp1b1RNOGRJcklH?=
 =?utf-8?B?ZkY4NStwbHQwZGQveDNlUE9Zd0ZEWmJGSStCYVZZckJDb1pJTnN4MGFEZTFa?=
 =?utf-8?B?VGIzV1VSMWhCZlBrQm0vejB6c0RsNGxLcXFUOCtEYWNQR2E0TFFsanZpODYr?=
 =?utf-8?B?WkZHNk5OdnQ5Rno1VjJtY1M2TVZPUk53WjNFSFk0amZwRW1KRG1hUy9lYlZj?=
 =?utf-8?B?WkxEenBLSVRYSk5YeXFSZjZ3dDhLUmdXM2JpcTNYV3pDUXpwZUpka2MvWFpk?=
 =?utf-8?B?ak9BZklROW5wWDFHaDM5V2R4VEgrTi9TTm9pZFRlM3lsU2VsaFYxNm5lajlF?=
 =?utf-8?B?ekVlNzRaU1dUSEJFazh2U3BnSDVpQ3RJQ1dRNUtHQkpiTm9tSkJmbEFjYlJO?=
 =?utf-8?B?a1hsTVA4SWtETGVwOE5vM2JrRkE5eHNFUmtIdFB0UGhBQXJMcGJQQ0Fyck5k?=
 =?utf-8?B?dUhlVDZWcnNUMjFPRjlOcEFmVk1rczZpV2FCaUZZbGVTQXBDeC9wa0R1eEhI?=
 =?utf-8?B?a2hsLzI0NGZDSFBSUXUzZUFkY21vWVVrREhzTlhDcnBrSGNWdDZjQ24wVzht?=
 =?utf-8?B?UkhuQmFDTkRaMGZOa2lTRkNpemNNWVZEaG55WHVhTnNYT3JJWGtUMXNjcVg3?=
 =?utf-8?B?U2xpcGt1R1ZjakNZbTFzQk92S1ZQM05oQ0RNWkM0bUFDb3U3Wi84NWlNTUd5?=
 =?utf-8?B?YzAxUTZpY1U1a3Q3UmhFdDhWZDd1aDkrVXFvRjRyRzl0M2JjTDIyb2RkRkJa?=
 =?utf-8?B?Mm5TQ3JabGtuOEtwTjJaVWlkU25icHdxN2Yxc0FJTk0wcjJQNHQ5enlyUjRO?=
 =?utf-8?B?RGZaL1NSYlEvNVBzbHRGek1hdTJxZXhYMlVMQW01Y0dMdkx5TzlHa2dFTWxT?=
 =?utf-8?B?eW5YQkxFT2hJVTNDeXBRakgyZ2MzL2JXZWN2TDdTWkxDQStlTkNvb2tLZUhM?=
 =?utf-8?B?RHdTL1Z4elhqazFaSzM3Z0htcTVNN1M5eG1wem84a1BIUGlRRnFNeVNWNVQw?=
 =?utf-8?B?R0gxTmFZdkt0L2M4V0w0Z1lDSEdPVU0vMDY1aStqLzZxQ09kbGJmaVoweVNZ?=
 =?utf-8?B?STZkQ1kyVEFFL1Y1b2tycEIxeHp2K3FzblNjaG5zd25FamdHLzhyTU1maUlN?=
 =?utf-8?B?V0JXY0ZHdlBEUFF1QXJlOHZKS3VmeXR5WG9wbVdmemFkYlNVMkIreXdXa3ph?=
 =?utf-8?B?dnpQQXRKemdReTVuM0dJbmlKQUJLa00rKzh3aXQrL2tLU3h3OGc3S2wwclJp?=
 =?utf-8?B?WW9aZmtROUNoWFhVbHllWDArUFVnPT0=?=
X-Forefront-Antispam-Report: CIP:198.47.21.195; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:flwvzet201.ext.ti.com; PTR:ErrorRetry; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: LsL34INujhb5bhSfoU+xDEEHoN+R+8+niXXoCvWSnR2hHti70ZoHkfrk8TbDkfTTsojTgrSnQXyixtDQCwz0Vs7PAW3McEEAAj4huWhfQ6/+rMqQUtkzyWz1pPxP1sSZ2g1CgkP93z4FzBLCu8nUv0lrJHGCAb+yBgzoP5+kQ7iRyvDLyw8fa13yqEGWSKIc+9oATRFg7knAtfYCd/VvT9siQIUkcRRWpwpzqNrxhVgTrwatdXCPDCmHQymIInUYUgUw0cNk3n2HV034nh5KMgxgQ+keMCi62WDAMUH/c0e3YZyCq2cdYHVEmQBR+3OapQjdbv/5gTmWyR8gsOcz28gTLXAY4sn4d11aX6GgB8IMWSTMp0gvpObSV7ZCm1Ee1+hjNny0Zqlcb3owkmjFmITCPaF0WoKwP2ONHgpETPmn1zY4GxHNFazA01EjdJRj
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 06:04:38.8266 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b572b896-c4b5-4a1f-c262-08de5fc573cc
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7; Ip=[198.47.21.195];
 Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF00003440.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFC802EB2B9
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.39 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[ti.com : SPF not aligned (relaxed),quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[ti.com:s=selector1];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:jyri.sarha@iki.fi,m:tomi.valkeinen@ideasonboard.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:devarsht@ti.com,m:praneeth@ti.com,m:bb@ti.com,m:vigneshr@ti.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[s-jain1@ti.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,0.0.0.1:email,0.0.0.0:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ti.com:-];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[s-jain1@ti.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[iki.fi,ideasonboard.com,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,ti.com,lists.freedesktop.org,vger.kernel.org];
	NEURAL_HAM(-0.00)[-0.995];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 0E123B78EF
X-Rspamd-Action: no action

Hi Rob,

On 1/3/26 04:04, Rob Herring wrote:
> On Tue, Dec 30, 2025 at 8:23 AM Swamil Jain <s-jain1@ti.com> wrote:
>>
>> Hi Rob,
>>
>> On 12/30/25 07:57, Rob Herring wrote:
>>> On Wed, Dec 24, 2025 at 07:01:50PM +0530, Swamil Jain wrote:
>>>> Update the AM65x DSS bindings to support AM62L which has a single video
>>>> port. Add conditional constraints for AM62L.
>>>>
>>>> Signed-off-by: Swamil Jain <s-jain1@ti.com>
>>>> ---
>>>>    .../bindings/display/ti/ti,am65x-dss.yaml     | 95 +++++++++++++++----
>>>>    1 file changed, 76 insertions(+), 19 deletions(-)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml b/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
>>>> index 38fcee91211e..ce39690df4e5 100644
>>>> --- a/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
>>>> +++ b/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
>>>> @@ -36,34 +36,50 @@ properties:
>>>>      reg:
>>>>        description:
>>>>          Addresses to each DSS memory region described in the SoC's TRM.
>>>> -    items:
>>>> -      - description: common DSS register area
>>>> -      - description: VIDL1 light video plane
>>>> -      - description: VID video plane
>>>> -      - description: OVR1 overlay manager for vp1
>>>> -      - description: OVR2 overlay manager for vp2
>>>> -      - description: VP1 video port 1
>>>> -      - description: VP2 video port 2
>>>> -      - description: common1 DSS register area
>>>> +    oneOf:
>>>> +      - items:
>>>> +          - description: common DSS register area
>>>> +          - description: VIDL1 light video plane
>>>> +          - description: VID video plane
>>>> +          - description: OVR1 overlay manager for vp1
>>>> +          - description: OVR2 overlay manager for vp2
>>>> +          - description: VP1 video port 1
>>>> +          - description: VP2 video port 2
>>>> +          - description: common1 DSS register area
>>>> +      - items:
>>>> +          - description: common DSS register area
>>>> +          - description: VIDL1 light video plane
>>>> +          - description: OVR1 overlay manager for vp1
>>>> +          - description: VP1 video port 1
>>>> +          - description: common1 DSS register area
>>>>
>>>>      reg-names:
>>>> -    items:
>>>> -      - const: common
>>>> -      - const: vidl1
>>>> -      - const: vid
>>>> -      - const: ovr1
>>>> -      - const: ovr2
>>>> -      - const: vp1
>>>> -      - const: vp2
>>>> -      - const: common1
>>>> +    oneOf:
>>>> +      - items:
>>>> +          - const: common
>>>> +          - const: vidl1
>>>> +          - const: vid
>>>> +          - const: ovr1
>>>> +          - const: ovr2
>>>> +          - const: vp1
>>>> +          - const: vp2
>>>> +          - const: common1
>>>> +      - items:
>>>> +          - const: common
>>>> +          - const: vidl1
>>>> +          - const: ovr1
>>>> +          - const: vp1
>>>> +          - const: common1
>>>>
>>>>      clocks:
>>>> +    minItems: 2
>>>>        items:
>>>>          - description: fck DSS functional clock
>>>>          - description: vp1 Video Port 1 pixel clock
>>>>          - description: vp2 Video Port 2 pixel clock
>>>>
>>>>      clock-names:
>>>> +    minItems: 2
>>>>        items:
>>>>          - const: fck
>>>>          - const: vp1
>>>> @@ -84,7 +100,8 @@ properties:
>>>>        maxItems: 1
>>>>        description: phandle to the associated power domain
>>>>
>>>> -  dma-coherent: true
>>>> +  dma-coherent:
>>>> +    type: boolean
>>>>
>>>>      ports:
>>>>        $ref: /schemas/graph.yaml#/properties/ports
>>>> @@ -195,6 +212,46 @@ allOf:
>>>>                port@0:
>>>>                  properties:
>>>>                    endpoint@1: false
>>>> +  - if:
>>>> +      properties:
>>>> +        compatible:
>>>> +          contains:
>>>> +            const: ti,am62l-dss
>>>> +    then:
>>>> +      properties:
>>>> +        clock-names:
>>>> +          maxItems: 2
>>>> +        clocks:
>>>> +          maxItems: 2
>>>> +        reg:
>>>> +          maxItems: 5
>>>
>>>              reg-names:
>>>                minItems: 8
>>>          else:
>>>            properties:
>>>              reg:
>>>                minItems: 8
>>>              reg-names:
>>>                minItems: 8
>>>
>>> clocks needs similar constraints...
>>
>> Sure, will add in v2.
>>
>>>
>>>> +
>>>> +  - if:
>>>> +      properties:
>>>> +        compatible:
>>>> +          contains:
>>>> +            const: ti,am62l-dss
>>>> +    then:
>>>> +      properties:
>>>> +        reg-names:
>>>> +          items:
>>>> +            - const: common
>>>> +            - const: vidl1
>>>> +            - const: ovr1
>>>> +            - const: vp1
>>>> +            - const: common1
>>>> +    else:
>>>> +      properties:
>>>> +        reg-names:
>>>> +          items:
>>>> +            - const: common
>>>> +            - const: vidl1
>>>> +            - const: vid
>>>> +            - const: ovr1
>>>> +            - const: ovr2
>>>> +            - const: vp1
>>>> +            - const: vp2
>>>> +            - const: common1
>>>
>>> Why are you defining the names twice?
>>>
>>
>> For AM62L we don't have "vid", "ovr2" and "vp2", the dtbs_check will fail.
>> Could you please suggest a better way?
> 
> You already defined them at the top level. Here in the if/then schema,
> all you need is 'maxItems: 5' and 'minItems: 8'. But then you already
> have that as well.
> 
> Rob

Posted a v2[1], could you please review if the patch looks good?

[1]: https://lore.kernel.org/all/20260129150601.185882-1-s-jain1@ti.com/

Regards,
Swamil.
