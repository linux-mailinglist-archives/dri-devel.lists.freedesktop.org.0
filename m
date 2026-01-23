Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GIO2Eph7c2kfwAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 14:46:00 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3491A76717
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 14:45:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B5A510EAE6;
	Fri, 23 Jan 2026 13:45:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="BZ68FXA1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010040.outbound.protection.outlook.com
 [40.93.198.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C0D510EAE6
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jan 2026 13:45:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qCnQnqOo2cmbCjUM5YfUW1j6KM2uMyn9gTGmE8Aalm4n8eJ8gDP1zjgCvtkOjhUHbBNxR2xx1ELThuqmZhxN9K3G78ypg6ovXwljJYP3P9q1XRKRhEtuarh0qG1Is50ZeTYLv+AmqPeF1d/Lq3ny0ADrpO5tjH+vmlMaJYPMfvsqQmM8cXE1yUfYc2R56DyOCTdG5yukjhcAC7ogo/s4ynZ4fSr/lBoFsKVDIyG39PBH3LBn8NBF1vxOMpd3vyFBTCy158n/Elu35Za/L+ePqyXKFajjnVN7kxN83sNilv85QG8A0FFOBczc3YoPVHHK7I+jIMJZMBAGCyTjXHnEUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wECDFr8EfZntNKdrdPN2ZU6XPCRH4qqsrHX0TDL33U4=;
 b=tsv6WJk4cpf1lN72zsrSpSSjZySWs9m+i7hV7jzFYDnm1mFq/qUntxPwL11D9RfAdI1Nan4ZC3vNOIPhki+GtRJzWb9vr/AImeVt+FgFJqSCgcIDBbPDW62q3aSb6GsdiGgznTAbhtoJ8FLytrt8iVEvt5bfkDw0ZrUprnsiyGPG7VMJtv87UIK5lL1IgoUgjOprmUG05FjaYjZQ4etq+CfbaObwsCGizRZzVXhe10lb/H6WLE6V/EgVHJroeuqjEHp9ur4A1Y/pAAZSr0fzBj626nAjqtVqdXRQC4bcrWeo2O38lkuxNJrJa/KPn2nOkpf+bas32OpTw8XYdc9ppw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wECDFr8EfZntNKdrdPN2ZU6XPCRH4qqsrHX0TDL33U4=;
 b=BZ68FXA1rjhKsaiQ8QOBq7omnRhDnlN+NwQNdr+s4u/RoyF2v+mRfKvBstTdvsVJSnoLWRALUnHBBPp/ORCGUWCtVTrOGfgJAdgXQJ+r9GSW1OOlnsQmAIKrS0Dw1A4YxunpEIDmPpnoFpvITjoTGOpBDl5Ar4VhL9NvPydTdXQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CYXPR12MB9426.namprd12.prod.outlook.com (2603:10b6:930:e3::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.12; Fri, 23 Jan
 2026 13:45:48 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9542.009; Fri, 23 Jan 2026
 13:45:48 +0000
Message-ID: <9bde8c39-ba4c-49c5-a0bc-4e78338f055a@amd.com>
Date: Fri, 23 Jan 2026 14:45:42 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm: Do not allow userspace to trigger kernel warnings in
 drm_gem_change_handle_ioctl()
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Zhi Wang <wangzhi@stu.xidian.edu.cn>,
 David Francis <David.Francis@amd.com>,
 Felix Kuehling <felix.kuehling@amd.com>, stable@vger.kernel.org
References: <20260123095415.74260-1-tvrtko.ursulin@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20260123095415.74260-1-tvrtko.ursulin@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN9P223CA0029.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:408:10b::34) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CYXPR12MB9426:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e0f6f3a-fb1f-424c-7ef0-08de5a85b6ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R3FET0lFcm5BZ3oyL2doMWF6Z2x6YnFNUFdwblpFTDdnVmVNRlBFREl5dHdS?=
 =?utf-8?B?TmdaNGY0OTkyWEFYVjl3Wlg4Sll2Um9MckwxaWNGVVlZSEltUEcrclN3Zklm?=
 =?utf-8?B?Z05tZW91NUd1Ty9MOGlibSs5Y0kyME91V0pNSU9ocHVQTm1PQUxtbTV3Z2dw?=
 =?utf-8?B?YkU1aGVJY0ZaaGZieEhrNFA3L1o0cGJiU2Zrd2tVdDJEUmJ6SmhSTXQ5ZS9G?=
 =?utf-8?B?ZzlZdzM4c3RXSkh0NGZaOHllNWpXK3hlYXRxcGlGVlp2Mzh4aHVDcWJ6eUJH?=
 =?utf-8?B?NVFienRPK2J3cktHQlZmUE9TSzhTRUl2MnU0OHRqeDFQcHBOQVJmekZFY2dv?=
 =?utf-8?B?OStmNzBlNGs0MzFqYzkxektoaVh4cGgxSkNHQVdCNzhPSlh0TElnZUYxN3hL?=
 =?utf-8?B?NWF2OHJOeUlkRG9IdDYxS2tjM24yN3lneHJSSzdKdDR5RVdRY080NTAvUEFq?=
 =?utf-8?B?eTlxcGxIZ2xuWjBuMjVGMHJBOVZFcVJ6djR2aU1CV2ExdlBhS1BlWEdjdFU5?=
 =?utf-8?B?NHFqZTJ6R2ppUDZuSWtGRkYzdHZWUDYrN1FxV2M5SmhpWkdDTzZ3L09SS3Ri?=
 =?utf-8?B?TXZVR004VFBqTUNvNTNqZG5XM1FOZWs0Y0t6OE9aZ2g3SjE0cHphVVA0eURQ?=
 =?utf-8?B?Q3A3ZW1OTzRiTkZQSFpTc2hPNnZBTnVsbWo2Nmp1V0dQKzZjNjFSZVdOL0tQ?=
 =?utf-8?B?RXpXc0xLTHlHekFBSmpBSzJ6OU9udFdUR2VaSGh1K2dZWDN4SzhPamhqWndE?=
 =?utf-8?B?UjdIUFh6YlpyT0hMSmsxcUkyWEtnWldiTERlUnJWZzlTblU3Sm84L3FCVTJZ?=
 =?utf-8?B?RmpMaG40VDRhdzd3MXZKWFlITXI0TS9WcEo3QlhWa2VJVGs5N1FIZGU2ZVNj?=
 =?utf-8?B?UWNIRFUwb2VjR3dhMU41d2pRZ25FSnQ3ZVliYXE3T1pzM3hnYkJkSi9DNy93?=
 =?utf-8?B?S0F2Mk9yNXlMSTFQakFpUE5raURjSUwreHFUVitZWnB4WGlZRzR5QkRnRkx2?=
 =?utf-8?B?U1l5ZE5qOTJPeTNqejlGUFh6dXo1VXJ0NkYyR0JFNTBncno0Q1dTMHFMenBx?=
 =?utf-8?B?aURzQjY0Vjgva0Zkc1M2b1A5QXRRM04wSUpKWDlEWStSc3Ruck1kWitZTEI5?=
 =?utf-8?B?QkVWNXJXTnVkUUpjeFJZY3JWUU9hblRycG9FbmdvSTJWa0RNOEJObkRSRzF4?=
 =?utf-8?B?NDlsUjdFbWp2Vy9SODJPZDJacHcwSGkzeENLVDZ5bWFod0pFR2pESmZtRkFr?=
 =?utf-8?B?UnVXRWpsWDJlanhtQlZqeGhUamVTazllMjBkZkRFVHVDVlhaT3JsbDR2UjZ6?=
 =?utf-8?B?b2hsK1A5dExRMElURUhTelNPQVRnWFVpOE1PRlZ1NUZkTThuS0tTcVY0K3By?=
 =?utf-8?B?dE84RytmVTZVZ0l6WDZ6eE4vVjRMczRZY1ZsdHNmcUppcEl4aVJMQTVhMVJj?=
 =?utf-8?B?UXdvSHNyVzUrSzg1MGRCc25VZTJVeUo4Q3duZExDdXNXRzh5bTY0SDRVdzl6?=
 =?utf-8?B?ZDJiTkdISjU1MXJYa3ZEM1ZZb2M0a3U5dW1sYUxIa3lqQ2hhRDZhRW4zWDhh?=
 =?utf-8?B?Q0hrVFFNYWVhV2pteFkwVXg0ajVXK0hpb1dJbEdycDdCUngyQ1dGV0xNVkpB?=
 =?utf-8?B?dFBDU2JvT2k2Yis4MWo3V0FITjFNYU55VFAySmFMWkpuWStNNk12WVhJb25n?=
 =?utf-8?B?dnpjL0c5cGQ1bHBFbng4K0lOQnczOFV1VVhQaW5zbm1pSTRFVGR3ZFlWNEFU?=
 =?utf-8?B?bkhxdTZncFo0TUpxc3RhazFRSGFBcnNXenJuei9YaFNMVDhVbzZRcGNFZmly?=
 =?utf-8?B?Z2MvaU0xREd4WVdJb21lVnUwanYrOWEvMkdQY3cwbEkxejNGb2FLY0JGR29Y?=
 =?utf-8?B?MnlrMTluTVRNUTBHNkphbmR0NGRyL29GUXlKWUw0MS9ydW5IR0gzK1pmMkRC?=
 =?utf-8?B?M3hMcnBaMmUyRDdmbVhnRGlhQjVzWTFGU2dtOVp2YzZBajRuRlViRUtkYzJB?=
 =?utf-8?B?SEZYdGsydW5kY2ZHa3VJV1lZUlFjcWw1NDJZMHVxSFNwU0pDeWh5K21FdDkw?=
 =?utf-8?B?ZDB6R3AxeG56WFdMY2JseVhsa3F1ZU9rakNzRDd0V1Z0VWRsNityREdxMk1X?=
 =?utf-8?Q?PTxQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V3VDK0p2MDhhSysrRGY2cXVlUTY2b2lPVGRCSEhTN0hUa2pqZVN2eU51Vk5L?=
 =?utf-8?B?cmkzZU1JU1AwcUxRNkl3djh3YTVsdUFVSEFmZGdNb0FTVm15cTZpQWVJeEFU?=
 =?utf-8?B?bENMamx5a2lxaUY1YnJxUFVFTmpJMUNGdU9najZiYVZUdEI1ZTA4SjNyL21Y?=
 =?utf-8?B?VG5lTTR5NUg1Mkt5ekNQMTZOTk9VUUdGeldmNWhWMFp3dlFXcGwvbjdCK2h2?=
 =?utf-8?B?a29vZkRBSTBKYS9FTk1GalBIVDJ3MGpiRm9SZUJ5eHZKN0N0NjlCQVRyOTFL?=
 =?utf-8?B?SHV2S0hrTlk0ajZZNkt0enpRd2h6ZVNRZW8yK0p6ZHBJc3NxYTc1WGwxYWs4?=
 =?utf-8?B?Nk82eDRWSnM2bGRhcjN3VFNaY0c0VEVIOUJTbW9qNXdUSkMxQ3FpNHJSS0Ni?=
 =?utf-8?B?b3AwWVVJRlYzSVV0ek9tR2ZSMDhMcERLWTRua21PSDRLeTZHMGdFOUdvNDRp?=
 =?utf-8?B?VjVkSFVHWWJRUm9DT1hyRU9jNGIzREtmTDRraitKbmh1MWZUVG5ZSGZBY1cy?=
 =?utf-8?B?bThDOUl3WmhwUmRick4wRHpkc3pHZklhb2RJOHNhY1lpMmsxYXFLWFJPNTZ3?=
 =?utf-8?B?bDF2VEkreTNRNjRGdDYrSEdFMHlJNytRaWZQUFRpRUFRRXNIMVE2SDJWYWRQ?=
 =?utf-8?B?TXRXZU1VUUtSTGFLaU81TFd1ejhPR21VR3JzN0h1Qis5d0JhM2h4RlVMdTFp?=
 =?utf-8?B?L0ZHcUppZ3hqSXJZakhqd3QyMGUwT2pYWjNkUlN0ZEppY0ZvVUdtTENSY09y?=
 =?utf-8?B?Mzl4U2dMa2xQL1lQblgzT2hHMjBoUXAwWlorSjhlaXJ0ZS9VdGlsdFliRUZh?=
 =?utf-8?B?T0NzNEtYMVVZa21kUVhUdVhZbjNpNFpTa2FoWUw0dWJsNFVLMkJkbjFDRVc4?=
 =?utf-8?B?aXdqenkrenVRWUNyanV0VVcrWjUxbnZsa2F0b3JZanZaWGF1bXoyT0FpUGl6?=
 =?utf-8?B?RWRwK3lEZ09EV1NQUXRQR0Uzd3pVOGx5VC9Ga3NDdHhsOTdTNlIwUEpWMDRD?=
 =?utf-8?B?eXFHUHlMVEQrRG0zemdUVzI4ZTNzVktzOExMKzU2OWErQXErV2VJUTgydUE4?=
 =?utf-8?B?eDFCYno3byszTDg5MzBHUHFuSzd6SUkwbnRSNCtqNGtwdkJPKy9JdHBPMTBj?=
 =?utf-8?B?KzRjTVp3UmM0dzBDQXVmSFVLaUgvMzZpUEFJa013VVYvdTRScUs4TGZyUFR3?=
 =?utf-8?B?QnFqVzZLVTlPYUVMYnNlUVg5QnN1WUNrVEZ6ZVcrSG1hOTFZdHpCSWR0N3Za?=
 =?utf-8?B?R25lbU90Tzh6QWpnQVZIaGhNRUVHaGxEblNHaTl4MitQYldwekxiZFlqMXRr?=
 =?utf-8?B?QTBZend5REs1emRGQkM4bTFmZ1FWZ09LQk1US1RzUUs3djQzZ0Yvbkx4TXh5?=
 =?utf-8?B?VFRWZjNWbUIrYy9TNXFsTHpQaTYxZURMSExMYXRuQ3lNOUlhblFEL05WNENV?=
 =?utf-8?B?SE14c1FadHZ6Q3I5UlFGUzU3dEEwTHVCQnZjSHBEZHRoUWlseU9wLzhxNXdm?=
 =?utf-8?B?L1RBNW1SejRINzlGaDM2ZFMwejEya2djN0xkUm9EclBKOWZ1bDBjYkJMdFhK?=
 =?utf-8?B?MnBOMm85dG80Y1BBamUydGVFWmlnd2N3R2VkcFJyOVRCS0VuNmo4bjdxdDR0?=
 =?utf-8?B?ejJDbUxPTU5HQnJpY1FtS1FZMGU3N0JzTHpSNUJNTzhETzl0T0hjdEZZK1NQ?=
 =?utf-8?B?dW5BUFlEWEtXYWNVbWlWZmtaU3pxVDUyTUxaUUpQRXNsRmh5clp4dThkTW5J?=
 =?utf-8?B?bE5hbFBwMFZIS1JRdmZCemRVR1ZIcVBBVU82cmtlbE9Da2JLMTR4d3VwcXA2?=
 =?utf-8?B?MHNOVzVPdGZ2REZYWUJVS0ZKY3VUdUU1WlF6aVdYWFhqUE5EWlZHMFg0bE5L?=
 =?utf-8?B?dzRaaEs5OGtWTU9Tc2JCTVcxTzMwdm9PcDNFSzJaTm1lTk5iRytXYVR4UDk5?=
 =?utf-8?B?RVVVVkg3enhDSVpMaGZPTlc2clF6WWFVRzg0bjVQdVQzeUJIN2d5VGxKUCtE?=
 =?utf-8?B?MTEvcEdjZzdaMEhwOGs1aGhyekN5R3h0V2laR0FFcktmRis5OWxpbE1zUVhI?=
 =?utf-8?B?OXRIalkwbzJuVDkzS2lRaFo4VzMyd0FPUHB1b29jS082YzBCemhTZ0NXUmUr?=
 =?utf-8?B?NW8rVHYyMHlyTS9aSk5hOWEzN0N5WGd2anpmR0dsR1FEVW5EY0dNQXRKc0Jx?=
 =?utf-8?B?aWtjVW84UjVOUUdCNDdrQldoMFQ4ajZKbyt2MEFQaUxGRzh4L2NLSG04ZGxH?=
 =?utf-8?B?RnBzZGxFTTh2Sm5ZaEJKeHBTR1h6MmxwNzRDZVZCVFR2MzAxSVBrYXZUODJH?=
 =?utf-8?Q?pr2HpF3WPm7Zoxw/vo?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e0f6f3a-fb1f-424c-7ef0-08de5a85b6ec
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 13:45:48.3398 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kqlmqklJnYebYiiMzZMtu08baxij830WH+zu+yzOwe2qNVQacBwa4zg2yn71crDS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR12MB9426
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
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:tvrtko.ursulin@igalia.com,m:kernel-dev@igalia.com,m:wangzhi@stu.xidian.edu.cn,m:David.Francis@amd.com,m:felix.kuehling@amd.com,m:stable@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[christian.koenig@amd.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.790];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[igalia.com:email,amd.com:email,amd.com:dkim,amd.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,xidian.edu.cn:email]
X-Rspamd-Queue-Id: 3491A76717
X-Rspamd-Action: no action

On 1/23/26 10:54, Tvrtko Ursulin wrote:
> Since GEM bo handles are u32 in the uapi and the internal implementation
> uses idr_alloc() which uses int ranges, passing a new handle larger than
> INT_MAX trivially triggers a kernel warning:
> 
> idr_alloc():
> ...
> 	if (WARN_ON_ONCE(start < 0))
> 		return -EINVAL;
> ...
> 
> Fix it by rejecting new handles above INT_MAX and at the same time make
> the end limit calculation more obvious by moving into int domain.
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Reported-by: Zhi Wang <wangzhi@stu.xidian.edu.cn>
> Fixes: 53096728b891 ("drm: Add DRM prime interface to reassign GEM handle")
> Cc: David Francis <David.Francis@amd.com>
> Cc: Felix Kuehling <felix.kuehling@amd.com>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: <stable@vger.kernel.org> # v6.18+
> ---
> Compile tested only. Any IGTs for the new functionality?
> ---
>  drivers/gpu/drm/drm_gem.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
> index 7ff6b7bbeb73..c5d3ecc1f8a8 100644
> --- a/drivers/gpu/drm/drm_gem.c
> +++ b/drivers/gpu/drm/drm_gem.c
> @@ -1001,11 +1001,16 @@ int drm_gem_change_handle_ioctl(struct drm_device *dev, void *data,
>  {
>  	struct drm_gem_change_handle *args = data;
>  	struct drm_gem_object *obj;
> -	int ret;
> +	int new, ret;

While this works in C99 I suggest using another name for the variable since it is a reserved in C++ for example. Just handle should do.

>  
>  	if (!drm_core_check_feature(dev, DRIVER_GEM))
>  		return -EOPNOTSUPP;
>  
> +	if (args->new_handle <= INT_MAX) /* idr_alloc() limitation. */
> +		new = args->new_handle;
> +	else
> +		return -EINVAL;
> +

Drop the else and just test for correct parameter. And usually the comment above the code looks better.

Regards,
Christian.

>  	obj = drm_gem_object_lookup(file_priv, args->handle);
>  	if (!obj)
>  		return -ENOENT;
> @@ -1018,8 +1023,7 @@ int drm_gem_change_handle_ioctl(struct drm_device *dev, void *data,
>  	mutex_lock(&file_priv->prime.lock);
>  
>  	spin_lock(&file_priv->table_lock);
> -	ret = idr_alloc(&file_priv->object_idr, obj,
> -		args->new_handle, args->new_handle + 1, GFP_NOWAIT);
> +	ret = idr_alloc(&file_priv->object_idr, obj, new, new + 1, GFP_NOWAIT);
>  	spin_unlock(&file_priv->table_lock);
>  
>  	if (ret < 0)

