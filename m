Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8IgXGjjMhGk45QMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Feb 2026 17:58:32 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0C1CF592B
	for <lists+dri-devel@lfdr.de>; Thu, 05 Feb 2026 17:58:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4CC310E932;
	Thu,  5 Feb 2026 16:58:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="IJeecZ3T";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010017.outbound.protection.outlook.com [52.101.61.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A24C10E22A
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Feb 2026 16:58:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BZt9/Akz9GCHIPuI+9ikJhl8oDbey4IkvrZFPf4GDYL1+pJeKFDhVPv52eJebVU0S6BzyPppcaLSJZ6EaH1me41xtat7nUf0QYzJBrtJ43kZwDy3OwVjYCtNG+Li8oR+21GQT7BE5qCl8TZFfrYIriG2pctJoTTGdrR9+JePexp+lTJPjZ1mxQIbkaQrCexXXxBNd/yv+pCNDmMvlTb/rXbAQQIg6FJOHsFKVQqhJfCjHrYH1MkCtM5oshgG/cb05B2a2m7flaKhxDLCdzrsYxwvH6E/IkagvvW4ZKBVNGJbChYpzwezqlGCtIZKER3wCWKRq+EFiaUAK3fsA2OYuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xaVLIW8gaztuSikTRz+ScFRr7byYjKNBOal9p3Fw7yU=;
 b=sQRVcQpPL/biGe+kBbLdxhoHpJLVgr6pZSessypCzFtbo7ASZPPi7zn+tV+TN989xTlYq7ur4r4gk5tK3Qs5lh7O+e39pwe0YDZBqA9b+YvouR/tB4pbErFjXJfZudn16EXLvM+/3Pu19UGhCrWQZz0fhFa2LSZMirCKWRghfc5ux43sD9gbTe6s1c6et7oSJNe4YpxU7bIFRAT9SrRe7bizFKGmhipaBfqFrni950B1zxZi4+z1XlBwUd02XX2pNOrJFoz6XDxRCz4PPVzEaL9gtF5dKoHvu8nmUxRC70pRQFTk+QR4wIAchrTka+iSnu21Y4hD0UtoqFf/XOq9eA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=oss.qualcomm.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xaVLIW8gaztuSikTRz+ScFRr7byYjKNBOal9p3Fw7yU=;
 b=IJeecZ3T+4yG6+84dH/1GIT2hPcBrEapxOpkD801WFWx9L9WL0udpXfI7ZQvR6Oy2slEpT1gUsS91Y5ISUQkrnh+HPCXH3bH7h4dEyzbBwSwswQjaxscxu09ivdtEPtK4PMbaF95F/uq639IdNd517MWauKHtdgJbLnilRmq/Q4=
Received: from CH0PR04CA0050.namprd04.prod.outlook.com (2603:10b6:610:77::25)
 by CY8PR12MB8213.namprd12.prod.outlook.com (2603:10b6:930:71::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Thu, 5 Feb
 2026 16:58:21 +0000
Received: from DS2PEPF00003440.namprd02.prod.outlook.com
 (2603:10b6:610:77:cafe::b3) by CH0PR04CA0050.outlook.office365.com
 (2603:10b6:610:77::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.15 via Frontend Transport; Thu,
 5 Feb 2026 16:58:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 DS2PEPF00003440.mail.protection.outlook.com (10.167.18.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Thu, 5 Feb 2026 16:58:21 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 5 Feb
 2026 10:58:20 -0600
Received: from [172.19.71.207] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Thu, 5 Feb 2026 10:58:19 -0600
Message-ID: <8b830e47-b2f8-5429-085d-2f10bb0d679c@amd.com>
Date: Thu, 5 Feb 2026 08:58:19 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3] accel/qaic: Handle DBC deactivation if the owner went
 away
Content-Language: en-US
To: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>,
 <jeff.hugo@oss.qualcomm.com>, <carl.vanderlip@oss.qualcomm.com>,
 <troy.hanson@oss.qualcomm.com>, <zachary.mckevitt@oss.qualcomm.com>
CC: <ogabbay@kernel.org>, <karol.wachowski@linux.intel.com>,
 <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>
References: <20260205123415.3870898-1-youssef.abdulrahman@oss.qualcomm.com>
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <20260205123415.3870898-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003440:EE_|CY8PR12MB8213:EE_
X-MS-Office365-Filtering-Correlation-Id: dc221abd-476f-4d4d-42b6-08de64d7c4c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|82310400026|1800799024|7053199007|13003099007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Nm52dU5pdTAybzNvYVB1VkZwc0YvK0ZrQ0RiS1lxb1Z4ZS9hSExSMjMrM1hq?=
 =?utf-8?B?UURIM1hPN0J1Z3JheHd3aDh6dkpUbnVOcDFudHZMZ2MzNCtBdzlDTkhmaWp5?=
 =?utf-8?B?UWNuVzBwelFFblRYREZWNmdkUGJiN2FRWkxiQVVvdWlnTmJzUkk5Y0QyY1kz?=
 =?utf-8?B?aUY2U1FRdnpJenlXZGRVaytRR0w2OVd2RlFEZVZnMEVzbTNnY0dWY25VTThi?=
 =?utf-8?B?dlVlN25UODgzR2dRVzI2N05xWWhQZFBhb0V3ZW9SZzUrbldkNUU5ZXdML2Fl?=
 =?utf-8?B?MjFtemk2N3hHUmpRSnRqcnltS3p4c2Zlck1CSnYxd2x2SkNsUGs0aExiSmkr?=
 =?utf-8?B?RzMvUGZTTlB1REREUVZpb0FQYW9PaTJEV1M1SzJYOU1INC9QYnUwMzVNUFJB?=
 =?utf-8?B?YUI5OXhzY1k0TEFodGFxYWxWY3ZpQm54WmsyUnhtSksvTkx4UjlvZFptcFZX?=
 =?utf-8?B?OVJ5ZktNR3ZpSE4va3lVYTdkRWtlTXNlV2hDdU43NWh3eFpiUGpaQ3pqczJT?=
 =?utf-8?B?eW5zd2lZSWtYWnJPRWdQQnU3OXpuRkxGUTVRcEJHOHBWTnNsNWU4YXNwV3dS?=
 =?utf-8?B?Mm95WXY5WmFueWNJOWRsZEJpWE9SSVNKM2xtb0tvSGJlb0lQempsYlRtV1Ru?=
 =?utf-8?B?M0lWUWlPWHh5MnIrMFFTVytzL3dmdzhSb0p0OFNETnl0RWJFQlhpYitaSVpN?=
 =?utf-8?B?cGU5aW02Q0JqcS9ITmFsYk9EWVl4UG92OTVGdWFtRG5Fem5VTFhTeGlBL2hW?=
 =?utf-8?B?cktrejIveVVvbzBDeG1rMHdqS0JXS1Y0WEs1ZmtDTUtnSWk0SmpzRkZINU8r?=
 =?utf-8?B?NWdMdzViR08remlqWnlueU1wSU9CUTVwQVVMRS93d0pVZVJVOWsvV0QrU3Na?=
 =?utf-8?B?SjM4bkloa05lMXc2Y29UU3J2M3VDUWpCWUNVQlJJZWVWNkM3SXdnV3BTbUxI?=
 =?utf-8?B?MkVUdmNYWmNJbC9kUG5CNHllUGJOQ3JuWjVmMDV6SlRFQ0gwWVEySnZDZHR3?=
 =?utf-8?B?dEZJdFZvY3FQcUh2c3JUZnVkcGhrdnVPbkxacGk1aFMrNUpsK3ZyaFQrTk9J?=
 =?utf-8?B?R2pGQklWNXhJQ3JlSzVoL3pUUk5TZEpSM3g5eVdhTU5CNit5RzdrUXJiakZk?=
 =?utf-8?B?ZHFmdCtlOEpoM1doMUY4dXd1am9XWU5iRU13dFZ1T3pGdzV1OVpJL1E5azlY?=
 =?utf-8?B?Z2M1YzhVSkF2cUoyYi9TNHA2Tis1UXA0bFM4V0VScDJzRmVGTGM3U3Fhdjli?=
 =?utf-8?B?SkFpWWRYeXg1ZDdRSHlibFIxVWxVa3VLMWJLL1Nyd2w5a3BJT29ocnVLT05m?=
 =?utf-8?B?U2ZjTG1zTnNTVXFKeDFIV3ZSV2xOV0piMVEyb3dsS1hvRGZtOEpGR2Jla3VM?=
 =?utf-8?B?Kzl0bTUrWktLeW16UUFOYVJTRndFTlpwSFpOTW56dXZNYjJ2RXBocG52UXJk?=
 =?utf-8?B?M1BpT0VuUUdOR2pmTDZFVm9CVjJ5RTAxVVFJbkozOHN1dmpEbU42ampGS1lW?=
 =?utf-8?B?QXZjOWVJK25NMmZTbFZCLzBEUE5QQ0hBbjVFZVZwRFR3bEpvaExPUUJHTHpO?=
 =?utf-8?B?L0ZRMGppVm9QWFBwano1cHY5ZFU3NHo0SHlwWFFOaGxPNlFNbEFDT0RoWU10?=
 =?utf-8?B?amVaNXdKY2tneGF3MklYM0ZHTmF3MXRVREFYOHpVSnVwdzdVci8za0JacVZp?=
 =?utf-8?B?MTR2L1dlZ0tpNWw1dGhneVY0UldLMG1RUjZoQytPdUxzcVhpVTFpYTVtcTBp?=
 =?utf-8?B?QVJXQzFNa1lQUEVKME1kZVJ2Sk5NVmVzNFYxZU1qbHB0NVNjN1lPcDYwRkxL?=
 =?utf-8?B?Z1A4aHNLMDNOUXV3SVVpZGR3OWtjUVBOemx5TUkvUFZ0M2F4SktCYkdKbDZr?=
 =?utf-8?B?R1VGUUhhc3NBMTdPam8rOHpCV2dBWVBoZ2tLOUI1TG1JOCtuQnlqN1lDS2x3?=
 =?utf-8?B?a3phZ0xNemZKcWhyZ3hRcjIrbzJadUt0WXVTRDlrL0poQVZBR2p0SmE3a2tr?=
 =?utf-8?B?OVpRRHRnb3REZVVFajJBTElnbmF5d1R4bU9CdGJmQ0ZWOEF5ZWM0ZWJMZThM?=
 =?utf-8?B?bGZzWk1MbmF4SDQ2R0JzYjhaamZtM21MMmthSDNIbzFENFVSM0lIZzFvT1dS?=
 =?utf-8?B?SXo0T0oxakZTcWNuZWNEeGdWNTAzSzVjS2pjMUZkMG1aMmJwWHNBRHNtd1lM?=
 =?utf-8?B?MzNja1BxKzFRNGRqbnpaL3VlYXZ6WUdhZmdieWMzWi9sdzZaeG9URVpqVjJr?=
 =?utf-8?Q?oN/tLO666cW1fXEIi/oJsnjGaMjZlMQZIEmsEWFRD8=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024)(7053199007)(13003099007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: hm5RbQHEeBB/hlOHIo7lad/02b31H48FGoH8sxQbP9oo1lVssDKG9Rpy38vY9IHuN3F9iS3iWYP21e4jMgrtWH+aHAp6DVUfYK6N+YCKtbEXDGJNc45wzKqztRL6n8BPAcWyaXUr5JeG8tTieqyR0uEuuAbOkm9c2ipjVxCTPAI6qe1ahNqDN2g/f5mj05xBebTG2NQx2yHahB2e+KU+cUuN2FF3ldzY83ltL9RwSOXCoMBuUnhYXrjZ2xK2iiltRUU9XMa2gUGgHV0f5cQ8sCS0As3cSV3fb54V3H2o8T4ULreGZFl5jLOEANEdJvlNUh5/7P4Zfze6YGXgeCVHCEMv9SOQGtyt3/fMbYCRIywHcde9MnV2LTKYGJ6pzeZDiWxPEqu+HZtdLPey85Rt5buBP1+wNGVPKbcixDRdM4/5G+DgjNdYZOaWE0iEoN5S
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2026 16:58:21.4486 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dc221abd-476f-4d4d-42b6-08de64d7c4c1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF00003440.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8213
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
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER(0.00)[lizhi.hou@amd.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	FORGED_RECIPIENTS(0.00)[m:youssef.abdulrahman@oss.qualcomm.com,m:jeff.hugo@oss.qualcomm.com,m:carl.vanderlip@oss.qualcomm.com,m:troy.hanson@oss.qualcomm.com,m:zachary.mckevitt@oss.qualcomm.com,m:ogabbay@kernel.org,m:karol.wachowski@linux.intel.com,m:linux-arm-msm@vger.kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,amd.com:email,amd.com:dkim,amd.com:mid];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[lizhi.hou@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A0C1CF592B
X-Rspamd-Action: no action

Reviewed-by: Lizhi Hou <lizhi.hou@amd.com>

On 2/5/26 04:34, Youssef Samir wrote:
> When a DBC is released, the device sends a QAIC_TRANS_DEACTIVATE_FROM_DEV
> transaction to the host over the QAIC_CONTROL MHI channel. QAIC handles
> this by calling decode_deactivate() to release the resources allocated for
> that DBC. Since that handling is done in the qaic_manage_ioctl() context,
> if the user goes away before receiving and handling the deactivation, the
> host will be out-of-sync with the DBCs available for use, and the DBC
> resources will not be freed unless the device is removed. If another user
> loads and requests to activate a network, then the device assigns the same
> DBC to that network, QAIC will "indefinitely" wait for dbc->in_use = false,
> leading the user process to hang.
>
> As a solution to this, handle QAIC_TRANS_DEACTIVATE_FROM_DEV transactions
> that are received after the user has gone away.
>
> Fixes: 129776ac2e38 ("accel/qaic: Add control path")
> Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
> ---
> Changes in V3:
> - Remove unnecessary list_empty() check
> - Link to V2: https://lore.kernel.org/all/20251224143009.2769836-1-youssef.abdulrahman@oss.qualcomm.com
>
> Changes in V2:
> - Add missing closing bracket in resp_worker()
> - Link to V1: https://lore.kernel.org/all/20251223153151.2232297-1-youssef.abdulrahman@oss.qualcomm.com
> ---
>   drivers/accel/qaic/qaic_control.c | 47 +++++++++++++++++++++++++++++--
>   1 file changed, 45 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/accel/qaic/qaic_control.c b/drivers/accel/qaic/qaic_control.c
> index 428d8f65bff3..3842e59291b9 100644
> --- a/drivers/accel/qaic/qaic_control.c
> +++ b/drivers/accel/qaic/qaic_control.c
> @@ -913,7 +913,7 @@ static int decode_deactivate(struct qaic_device *qdev, void *trans, u32 *msg_len
>   		 */
>   		return -ENODEV;
>   
> -	if (status) {
> +	if (usr && status) {
>   		/*
>   		 * Releasing resources failed on the device side, which puts
>   		 * us in a bind since they may still be in use, so enable the
> @@ -1108,6 +1108,9 @@ static void *msg_xfer(struct qaic_device *qdev, struct wrapper_list *wrappers, u
>   	mutex_lock(&qdev->cntl_mutex);
>   	if (!list_empty(&elem.list))
>   		list_del(&elem.list);
> +	/* resp_worker() processed the response but the wait was interrupted */
> +	else if (ret == -ERESTARTSYS)
> +		ret = 0;
>   	if (!ret && !elem.buf)
>   		ret = -ETIMEDOUT;
>   	else if (ret > 0 && !elem.buf)
> @@ -1418,9 +1421,49 @@ static void resp_worker(struct work_struct *work)
>   	}
>   	mutex_unlock(&qdev->cntl_mutex);
>   
> -	if (!found)
> +	if (!found) {
> +		/*
> +		 * The user might have gone away at this point without waiting
> +		 * for QAIC_TRANS_DEACTIVATE_FROM_DEV transaction coming from
> +		 * the device. If this is not handled correctly, the host will
> +		 * not know that the DBC[n] has been freed on the device.
> +		 * Due to this failure in synchronization between the device and
> +		 * the host, if another user requests to activate a network, and
> +		 * the device assigns DBC[n] again, save_dbc_buf() will hang,
> +		 * waiting for dbc[n]->in_use to be set to false, which will not
> +		 * happen unless the qaic_dev_reset_clean_local_state() gets
> +		 * called by resetting the device (or re-inserting the module).
> +		 *
> +		 * As a solution, we look for QAIC_TRANS_DEACTIVATE_FROM_DEV
> +		 * transactions in the message before disposing of it, then
> +		 * handle releasing the DBC resources.
> +		 *
> +		 * Since the user has gone away, if the device could not
> +		 * deactivate the network (status != 0), there is no way to
> +		 * enable and reassign the DBC to the user. We can put trust in
> +		 * the device that it will release all the active DBCs in
> +		 * response to the QAIC_TRANS_TERMINATE_TO_DEV transaction,
> +		 * otherwise, the user can issue an soc_reset to the device.
> +		 */
> +		u32 msg_count = le32_to_cpu(msg->hdr.count);
> +		u32 msg_len = le32_to_cpu(msg->hdr.len);
> +		u32 len = 0;
> +		int j;
> +
> +		for (j = 0; j < msg_count && len < msg_len; ++j) {
> +			struct wire_trans_hdr *trans_hdr;
> +
> +			trans_hdr = (struct wire_trans_hdr *)(msg->data + len);
> +			if (le32_to_cpu(trans_hdr->type) == QAIC_TRANS_DEACTIVATE_FROM_DEV) {
> +				if (decode_deactivate(qdev, trans_hdr, &len, NULL))
> +					len += le32_to_cpu(trans_hdr->len);
> +			} else {
> +				len += le32_to_cpu(trans_hdr->len);
> +			}
> +		}
>   		/* request must have timed out, drop packet */
>   		kfree(msg);
> +	}
>   
>   	kfree(resp);
>   }
