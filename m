Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AE5dGPoZj2k0IwEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 13 Feb 2026 13:32:58 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E4711360E5
	for <lists+dri-devel@lfdr.de>; Fri, 13 Feb 2026 13:32:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EB2910E7E7;
	Fri, 13 Feb 2026 12:32:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="btpypdUw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010019.outbound.protection.outlook.com [52.101.61.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D27BC10E7E7
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Feb 2026 12:32:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OghMXSvE0JtQOej6WRsG6iGzD4rZ7cN/nrc1sVNwaVjRYdZir8zxkQvlJYaJPs3iQIzjg7uFXiPaP8uOMm8sXrCMcF6AFieCF7fP/WbXfmOdZxNweoRpJXBbpAZ/M5G2KuMIMbbhJyHYFQ4ak4ZgjKLmg1MCI48EjC/OwTMf15BnudmYyUAxSjD0VcOaL2kiUcf9tyusDkEqe/ja0O4o7pyQ6znot5jGkZQflTgPi+JQEy8KjLppil099l83+g88ZBuX2WOWhvfkVXH132Si8Hkl7smz6bfsnKqkhWGidePr4aTBncg8vKiXzFnAPochMzgdlzTUg0ZN3JLXP88PtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lEOIEALaEvFPK8KL6+hGZk0ISaREwajSgnrpZntMW6s=;
 b=SUKQ7LFe2GWuRwTpgFS7W8DeJrdVcOxXXMqWCxTZOWCRXcb2jfErTd+GjJZ/JxrilZ4J7KeiouF8US1qPcW+V5Em/oAo0wSYt3ToxoyWfC2SjpgMITDeb1lhqdiZQoBYE3Z3zNrrWXKm2mP2ZflrUAMfQErl7mToklTu4lU18rB3oGd9AmRBTUn1efjnxtMuyLRIVnn0fn6NlEIFzcm8oqbmdkoyoQBQOdEOs0I3mtPRJ4Irzwr42Jf0mBkuYCCqY0gQFi0yWPRN2ExnCX0ZUpovCuOSITXimaJ7kR5VfRaoJMssioQryv2eK6cYII1oepeyHnAQoDdJ09M3lZIF1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lEOIEALaEvFPK8KL6+hGZk0ISaREwajSgnrpZntMW6s=;
 b=btpypdUwOtQwEJDAEmEU09RkT0bQToU/1X0hZy9XR+tYK0jihgKp0eb3e9OJT3wxyHcHQ7tpguD0D5l5POG1jwuEJtZdvcSnfs+dvp27OGcdWi7NjA7p4X4Lp5I2AZRJoOkUTbvgpy0AlMv5k8Mc5gfhzoWNFuA79MGTO51rg6o=
Received: from BN9PR03CA0200.namprd03.prod.outlook.com (2603:10b6:408:f9::25)
 by BN0PR10MB5048.namprd10.prod.outlook.com (2603:10b6:408:117::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.14; Fri, 13 Feb
 2026 12:32:50 +0000
Received: from BN2PEPF000044A6.namprd04.prod.outlook.com
 (2603:10b6:408:f9:cafe::6b) by BN9PR03CA0200.outlook.office365.com
 (2603:10b6:408:f9::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.10 via Frontend Transport; Fri,
 13 Feb 2026 12:32:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none; dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BN2PEPF000044A6.mail.protection.outlook.com (10.167.243.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.8 via Frontend Transport; Fri, 13 Feb 2026 12:32:50 +0000
Received: from DLEE212.ent.ti.com (157.170.170.114) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 13 Feb
 2026 06:32:49 -0600
Received: from DLEE202.ent.ti.com (157.170.170.77) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 13 Feb
 2026 06:32:49 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 13 Feb 2026 06:32:49 -0600
Received: from [172.24.233.20] (a0512632.dhcp.ti.com [172.24.233.20])
 by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61DCWi6n747503;
 Fri, 13 Feb 2026 06:32:44 -0600
Message-ID: <310efefa-90b8-46e5-9346-d71646d9d674@ti.com>
Date: Fri, 13 Feb 2026 18:02:43 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] dt-bindings: display: ti, am65x-dss: Add am62p dss
 compatible
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, <jyri.sarha@iki.fi>,
 <airlied@gmail.com>, <simona@ffwll.ch>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <robh@kernel.org>,
 <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <aradhya.bhatia@linux.dev>,
 <mwalle@kernel.org>
CC: <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <devarsht@ti.com>, <praneeth@ti.com>,
 <u-kumar1@ti.com>, Nishanth Menon <nm@ti.com>
References: <20260116095406.2544565-1-s-jain1@ti.com>
 <20260116095406.2544565-2-s-jain1@ti.com>
 <462b3b7a-c228-456a-84bf-0e6103be61b7@ideasonboard.com>
 <5f0d509b-f1e4-44c8-80f4-74c3f4b61b28@ideasonboard.com>
Content-Language: en-US
From: Swamil Jain <s-jain1@ti.com>
In-Reply-To: <5f0d509b-f1e4-44c8-80f4-74c3f4b61b28@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A6:EE_|BN0PR10MB5048:EE_
X-MS-Office365-Filtering-Correlation-Id: 75415169-1dce-4fb8-d4c9-08de6afc004f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|36860700013|376014|7416014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VVcwSms4QkQ5bFlzUDBrTVd3bTAxbk5UTEZuMFNzOW9odEZZQ1hoREJoeS9a?=
 =?utf-8?B?ZUQzVTVJTFEvTEdQL2FGemtDUkFXTlFjYjNDR1ZpWGRCNERrY3hXZlNiMDVD?=
 =?utf-8?B?ZUVPZ2hyTW9HRmlSbkdNdmlwUzlISFFWaWE2MlRJM2JvRGVCOUF1TTQxOGxP?=
 =?utf-8?B?UDJiR3dMcFR3ZkdiL2E1aUZaYjA0Wndodk95YlUwM2lUVXRtckVxTjgwV3J6?=
 =?utf-8?B?MjFWUi8yaTNYdTBzOXBBbVhnMGcxak5xa1FTYUZEdklXTk93VlpkUFJUcmw5?=
 =?utf-8?B?aDZUWHJZVUdKVVFCcmN2UFVidE5ZSmpuSTljNXdTZ2EyMWErQ3I1RVdCckZn?=
 =?utf-8?B?UXNtcFBBK1lQQkJQb3BjcDVic08xOGI5YWRtUEw3SjR4bHZ6VnVZeDZtTElw?=
 =?utf-8?B?c0dHaEpIQ0RPUXh6R1l5a1BYWEFiaU1yVjF5R0JKbzF0T0F5RE50dXlFTlFr?=
 =?utf-8?B?NUZIUnBuSEFWalYyTHQ0ZFJ2cmZoc28wOTN0TnVGYXFjU1IwbnVZZ1FueDRO?=
 =?utf-8?B?cGNuV3h0cThtQXFNRmFRMHpYL1RQcVBFcWpOTHA2dW55NzlLSjBCSHZHN2Fx?=
 =?utf-8?B?Q3FBQXNsK01XTUpJUHROR0xacXQwNWt6SDExTVg2ZHRjWURCS2FyZm9ubzAw?=
 =?utf-8?B?LzNUbnlTckcrQXMzTzZBZC8ySUhINlh5YnBneHFKOVFvYzNhcUlWNzY3MTFh?=
 =?utf-8?B?MlJ6dGRZWUEwblY4cGRMZSs1Z0tZQ1FiRWQ0ZjFyVDVRSFhmTk02THJvT1Qz?=
 =?utf-8?B?a2IzVC9SaWRETEY4SUZxejNMSkVvVG8wNzZuS09uV1d2UEhpTDRiZEsxL00z?=
 =?utf-8?B?aWFWYVdXR3pIZklnR0RiQ1JLcEpVbWRUQ3VqTjNWaVdJdGFoYm1rVUZkR0Zp?=
 =?utf-8?B?TW0yTEtHbTJUdVdMNzFyNlYzbjZkc0NMUVZsT3FwS3QyS0pRN3pjekh4OS9o?=
 =?utf-8?B?RkZOL1IwSnhEYXpxeHBiNkplSFp3bVdHUml4ODBua2R2cm1EaUJTWlV3dTFD?=
 =?utf-8?B?Mkg4QzM1cy9TUkZZNy9VQkxKYm5iVVhBRXBCcUl4YVQ1T3hMR3ZGbDNBWk1S?=
 =?utf-8?B?azBmci94ZENZNUVsMTFmKzh4bjV2d29Jb3AvT0xVS3VmeDZGUnRBeVFhQlVI?=
 =?utf-8?B?R2ZiV0M4VEtQRTRNMlh6c0R0Y2l0bnB0dEJOaEVmU0gyMVdDR055cDIwMFg5?=
 =?utf-8?B?MjJBSVQwMGtYYTZLblM2M1hnOVJ2MG5WMTRVdkdPd3VlREtOcHFIYnNrV2F0?=
 =?utf-8?B?bTJCMzE1ODBTYTR6eXBPVzFXRXlvVm1uWWt6d3EzV25WYURuZ0ZuUXEzVkR2?=
 =?utf-8?B?R2pSTThMcmFSSHFSUGJhb29wSzZST2N3MVNhK25ob3JvaXd1S0xOd2RESDdB?=
 =?utf-8?B?SlpKSWppcENKT0FtSzl3eElIN3VQNlpnNTJKd0tUVDdtRHFqRjAySW1iUjRr?=
 =?utf-8?B?YzdvSDdidmlvbkFMTW11cUEvOXF2ZHlBZzIzZ21pa1kycW9jYmVjcjYzS1lZ?=
 =?utf-8?B?TWRhTWJUU2tHZDZSdHRwZTc5K0cvYUlzSUR1UXJIdkZHdzlWeTl0ZTJJQXBK?=
 =?utf-8?B?ZlM3OEN4QWxXNzN6WnJLeXNuMUlIWklGdHlMdmM0WGNBOUNxQm5kbTF4azNH?=
 =?utf-8?B?VTJFTkV4US9Xa0ZSdGtrUG80L3RRcXpYQk9mQktTRktSR1NIdWwzZnJZYVZz?=
 =?utf-8?B?eEUxeHBBOTRSdUtRc1pvdTVUU3g3dHZXbTcwWloybnJjTTd3ZXV0bmRaK2NW?=
 =?utf-8?B?N0kxWTAwUVptVmNjZHBUK0tSWVl1alVnMW5Vem5oWW01QllTRWZoS0h2Ti9i?=
 =?utf-8?B?RlZRN1Q1Z3lINVBnd0V5YllFMlZhU083dWFyT0NPV0dhSGpOWDdYZGdlQUN3?=
 =?utf-8?B?V2tNcW9ES0g2LzBQL3lhenluT0tYbnd2b0JVb2MreC85ZzQ0TVNqemFFL08w?=
 =?utf-8?B?bWx3OXR4Ly9SL0ptUzJ1a3Y0ajJZM0F1ei9UeG96cVFQNVJLVE8xTFR6M09J?=
 =?utf-8?B?elVNVXJVUjIxVml1c3A5ckx3RmduTFFNTVhkWDFDekFJTEMwd2lpdWxFTzFD?=
 =?utf-8?B?eFJ4WTV0YVVkRlFMZ3hTMmQ3ZWlQYmxma3IwRjZyM3VMMk1hcVlCbmp4cGNv?=
 =?utf-8?B?K3hhamFJTk5uSVVvV2kwYk10VU1tMjZRRStiQ0VDRHdZTXVzVWoxY29ON3Ur?=
 =?utf-8?B?aDJnZmZPeVVYT2crZXk0THNWcUF4RTFtdmZTSWhxUGZEb3dTNTNvdXZKRXNr?=
 =?utf-8?Q?oUeQjJA/XPRdnUL/E6wlXGsIb1ddr6G8FFIHvOOAAY=3D?=
X-Forefront-Antispam-Report: CIP:198.47.23.194; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:lewvzet200.ext.ti.com; PTR:InfoDomainNonexistent;
 CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014)(7416014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: Cesk/UccRXE+6gsYZkcPLV/NJpggQdJ/jSfEm4K8tmFfncBG+LbgHZX9v8IK+mHsGZ1xFqk4CYBz3Fj3Vf9IMYYvZa9nIfN0eLBemgN7irPIP/p2yDafMUMKqmkU2oRUDFFoZHuveLfbG1kDI769sXplwN6EfHcasjSJdC1X5uFAYiuFzyLVM5njXAtPvdOHnt7/xrMT8llgypIZ7JcxvhLs153677CSstgHeIwk4WxNfdiOo65fQLJkx5UIKYTokYFA8Z6u3KPv3Q7mHpi5xbEwi7VTfgb9aw/vTbhiYeZKXc0AhzNUpHGVEhz86RGMaFJqvRZeLita1Srj8WgcrVSBLegVfdzhgnhAEsUQRPrVIQW9B/Y+Yeb7cdOdw4NeV7TGt2/RMoyZqEpjubbQ2hufiYGPbP3foz+2EhverKVHAVwc0iVZUOdxJF3iawOp
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2026 12:32:50.1495 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 75415169-1dce-4fb8-d4c9-08de6afc004f
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7; Ip=[198.47.23.194];
 Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF000044A6.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB5048
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
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_QUARANTINE(1.50)[ti.com : SPF not aligned (relaxed),quarantine];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	R_DKIM_REJECT(1.00)[ti.com:s=selector1];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:tomi.valkeinen@ideasonboard.com,m:jyri.sarha@iki.fi,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:aradhya.bhatia@linux.dev,m:mwalle@kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devarsht@ti.com,m:praneeth@ti.com,m:u-kumar1@ti.com,m:nm@ti.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[s-jain1@ti.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_TO(0.00)[ideasonboard.com,iki.fi,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,linux.dev];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,ti.com:mid,ti.com:url,ti.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[s-jain1@ti.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ti.com:-];
	DBL_PROHIBIT(0.00)[0.0.0.1:email,0.0.0.0:email];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 5E4711360E5
X-Rspamd-Action: no action

Hi Tomi,

On 1/30/26 17:30, Tomi Valkeinen wrote:
> Hi,
> 
> On 19/01/2026 12:10, Tomi Valkeinen wrote:
>> Hi,
>>
>> On 16/01/2026 11:54, Swamil Jain wrote:
>>> TI's AM62P SoC contains two instances of the TI Keystone Display
>>> SubSystem (DSS), each with two video ports and two video planes. These
>>> instances support up to three independent video streams through OLDI,
>>> DPI, and DSI interfaces. The OLDI interfaces utilizes two OLDI
>>> transmitters OLDI0 and OLDI1.
>>>
>>> DSS0 (first instance) supports:
>>>   - With respect to OLDI Tx interfaces, DSS0 instance can either drive
>>>     both OLDI0 Tx and OLDI1 Tx together (e.g. dual link mode or clone
>>>     mode) or can only drive OLDI0 Tx in single link mode with OLDI1 being
>>>     utilized by DSS1 or left unused.
>>>   - DPI output from video port 2.
>>>
>>> DSS1 (second instance) supports:
>>>   - With respect to OLDI Tx interfaces, DSS1 instance can only drive
>>>     OLDI1 Tx given DSS0 is not utilizing that as described above.
>>>   - DSI controller output from video port 2.
>>>
>>> The two OLDI transmitters can be configured in clone mode to drive a
>>> pair of identical OLDI single-link displays. DPI outputs from
>>> DSS0 VP2, DSS1 VP1, and DSS1 VP2 are multiplexed, allowing only one
>>> DPI output at a time.
>>>
>>> Add the compatible string "ti,am62p-dss" and update related
>>> description accordingly.
>>>
>>> AM62P has different power domains for DSS and OLDI compared to other
>>> Keystone SoCs. DSS0 can have up to 3 power-domains for DSS0, OLDI0 and
>>> OLDI1, and DSS1 can have up to 2 power-domains for DSS1 and OLDI1.
>>>
>>> Signed-off-by: Swamil Jain <s-jain1@ti.com>
>>> ---
>>>   .../bindings/display/ti/ti,am65x-dss.yaml     | 37 ++++++++++++++++++-
>>>   1 file changed, 35 insertions(+), 2 deletions(-)
>> I think we have a bad design issue here, and I don't know how to fix it.
>>
>> The OLDIs have been a bit difficult to model, as they are not full
>> devices: they are not on a control bus, and don't have registers, yet
>> they need configuration. Part of the config is done via separate IO
>> controls with syscon, part of the config is done via DSS's registers.
>> It's not documented, but I assume the OLDI registers in the DSS IP are
>> wired somewhat directly to the OLDI IP.
>>
>> So currently we just consider OLDIs to be part of the DSS. We do model
>> them as separate custom DSS child nodes in the DT, so that we can model
>> the pipelines correctly. For example, to support dual-link OLDI, we have
>> two OLDI TX nodes, which get their pixel stream from a single DSS port.
>> The power-domains for the OLDIs were just set as DSS power-domains, as
>> OLDIs were part of DSS in this design.
>>
>> This felt perhaps slightly hacky, but it also made sense and allowed us
>> to model the HW.
>>
>> Now, with AM62P, it gets a bit interesting. We have two independent DSS
>> IPs, each of which have two output ports, and we have two OLDI TX
>> instances. The OLDI TX instances are shared between the DSS instances,
>> and the first output port on both DSS can be muxed to an OLDI. The first
>> DSS can be connected to both OLDI TXes, the second DSS can be connected
>> only to the second OLDI.
>>
>> This DSS application note has a bit more info and some pics:
>> https://www.ti.com/lit/pdf/sprads3
>>
>> Now, both DSS instances have identical registers for configuring both
>> OLDI instances. This is not documented, but I'm guessing that when
>> configuring the clock muxes (the clock tree is also "interesting"), it
>> will also mux the configuration wires coming from the DSS instances. So
>> when you change the parent clocks for DSS & OLDI to be the right ones to
>> use, say, OLDI TX1 on DSS1, you also change where the OLDI configuration
>> is coming from.
>>
>> So the OLDIs are now shared, and the configuration registers are
>> duplicated and routed based on clock setup (afaiu). Clearly the OLDIs
>> can not be considered being part of DSS0 or DSS1 anymore, nor can we set
>> the OLDI power-domains in the DSS node.
>>
>> What this series does is that it adds three OLDI nodes, two for DSS0 (as
>> DSS0 can use either one or two OLDIs) and one for DSS1. And then,
>> depending on which OLDIs you happen to use, you're supposed to set the
>> DSS power-domains accordingly, so that the DSS being used for OLDI has
>> the necessary OLDI power-domains. And connect the media graph so that if
>> your panel uses OLDI TX1 with the DSS0, you connect to that OLDI DT
>> node, but if you use the same OLDI TX1 with the DSS1, you connect to
>> another OLDI DT node. I don't think that's right at all...
>>
>> I don't right away have a good idea (well, not even a bad idea) how this
>> should be designed.
> I still don't have a binding-idea that I would be satisfied with, but I
> guess there's just no sensible way to represent this hardware. How to
> model an IP that has its control bus changing based on a clock mux...
> 
> I think one thing we can do is move the OLDI power-domains into the OLDI
> nodes. That feels like a more correct place for them. Earlier the OLDI
> PDs were in the DSS node, as the OLDI was considered an internal part of
> the DSS. But now that the OLDIs can move from one DSS to another, this
> "OLDI is part of a DSS" model doesn't work.
> 
> However, even if it looks fine on DT side, I wonder if this will cause
> problems on the Linux side: OLDI is not a device, so I guess we still
> need to associate those PDs somehow with the DSS device.
> 
> For the issue with the control bus, I don't see a solution, so I propose
> doing what the patch here does: The two OLDIs are represented by three
> OLDI nodes in the DT: OLDI TX0 and TX1 under DSS0, OLDI TX1 under DSS1.
> Only one of the TX1s should be enabled at a time, of course.
> 
> So the DT structure would be something like this:
> 
> dss0 {
>    power-domains = <dss0 pd>;
> 
>    ports {
>      ports for DSS videoports
>    };
> 
>    oldi-transmitters {
>      oldi0: oldi@0 {
>        power-domains = <oldi0 pd>;
>          ports {
>            ports for OLDI TX0
>          }
>      };
>      oldi1: oldi@1 {
>        power-domains = <oldi1 pd>;
>          ports {
>            ports for OLDI TX1
>          }
>      };
> };
> 
> dss1 {
>    power-domains = <dss1 pd>;
> 
>    ports {
>      ports for DSS videoports
>    };
> 
>    oldi-transmitters {
>      oldi1: oldi@1 {
>        power-domains = <oldi1 pd>;
>        ports {
>          ports for OLDI TX1
>        }
>      };
> };
> 
>   Tomi
> 

Thanks for the suggestions, Tomi. With this approach we don't have to 
make #power-domains flexible. Will respin the series with the required 
changes.

Regards,
Swamil.
