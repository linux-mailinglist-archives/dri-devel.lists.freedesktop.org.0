Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53A39A38559
	for <lists+dri-devel@lfdr.de>; Mon, 17 Feb 2025 15:05:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE52710E46C;
	Mon, 17 Feb 2025 14:04:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Be81bUf2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2082.outbound.protection.outlook.com [40.107.220.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C3B410E46C;
 Mon, 17 Feb 2025 14:04:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jQntMUQD5uf9hDFVBqzaTzamAWJce8ON4UdGtN6QXfAbNhfOBPLqxH93P1o6dnJJMJ1zf0n8phtp8ubU1jAnEJwXdHDSz5cMfQQn+8Zwo3ooDeAgjgWLwdQ8RXpy0uq7+ydHrMMMsL2ifVHZiNo2y81VOecKX4lFx5aAQvjU5+eh9cVbZuDaI5oTl7/UVPSUygR6cG74OSrMLKvViywGvqJ0QmDJbqN/+dT7fXR531lZS+NZINtEcJFTknIG4qgMPcPEPDJn0Mdbh2Ri85rhb0W7L6KQjGtzE6MePTniwM7blv+X3dYowggA+jlLpNeic7dUX971/a3JPsygB2bDOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a99x7DWKCuH25MLjZC88kbZwr2fA4pIdu1TGhFmqrEo=;
 b=n4svnGc+YKeONlS8sxpeM2Or32kJJBMDqa/rdU6P6LlvS76uv3kdjY/+xLEDnx/AS2DJSvmZht6FQcNwYsWPn2jIUIjCP0i1ChBAHzdDWr6iuwgwMdy/yQ3r2rQ53PDvr8XnXXOG51Y/MY2Uo/NVC9YBvAXoBNwr5WMquPOfKHA1SlFPdysdRVhM7yJ+C3hVm5QJOnETJyZZkZkwaK9X9zl+NmJI2bbLeYMsrswT4t+/gZaG/gRpz3vj4scM1S4AFDoCuGBJHckiuWbMGddPIv+bOcPWy6msg8uyF6MBJNa2Du1YMMvVUunzF61197yKHH8GTnmt3CyOndJJ34AsBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a99x7DWKCuH25MLjZC88kbZwr2fA4pIdu1TGhFmqrEo=;
 b=Be81bUf28KVOLXaf85R2F/4rkOtQvm6G6iaQLb0syJim7g+DATY8s10y6asDMlcKml1aCAMi7WJoNE7nDLKqUHeNL2+fXJfr3TCIKzHasxt8OErr795TUEbaOcBxp94rlJcikKtycT/O80e1SBYwjk10wLVf4DQyQjRbN3i4DCO617BO0Wz0MGbn57enq3mtDNKqC5wJ9x7+UE9RJBjtIVpOQzpVSGp+kPxRGGAFQ4v1DDQpgWlCsn7NI/i9/7RzL4fHDScm8lIZ0nWh9wKuqwnMRfC2WKEOSs4CFr7ilZ30elfxD098wk/4xeCTb5kEIttx0BPEz9wByLTQJgNuQw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by MN2PR12MB4208.namprd12.prod.outlook.com (2603:10b6:208:1d0::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.19; Mon, 17 Feb
 2025 14:04:51 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%6]) with mapi id 15.20.8445.017; Mon, 17 Feb 2025
 14:04:51 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Subject: [RFC PATCH 0/3] gpu: nova-core: add basic timer subdevice
 implementation
Date: Mon, 17 Feb 2025 23:04:45 +0900
Message-Id: <20250217-nova_timer-v1-0-78c5ace2d987@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAP1Bs2cC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDI0Mz3bz8ssT4kszc1CLdZDNLE2MDQwuTNFMTJaCGgqLUtMwKsGHRsbW
 1ACjb2D5cAAAA
X-Change-ID: 20250216-nova_timer-c69430184f54
To: Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, 
 John Hubbard <jhubbard@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TYAPR01CA0115.jpnprd01.prod.outlook.com
 (2603:1096:404:2a::31) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|MN2PR12MB4208:EE_
X-MS-Office365-Filtering-Correlation-Id: 635987a1-ebe1-4c2f-8b52-08dd4f5c0bf9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|10070799003|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?amJ5VXZwckRYSFBRdUtXWXcrY05oZzdKNG5IeWRGWllDaEtlbUFrU0lRLzNS?=
 =?utf-8?B?SC9IZWNQTG1kNW1qdXhqelpJU0RUazZrVFVZUGxRTFVBUlgrREsxTFAxY1Vm?=
 =?utf-8?B?THNKNTZNNmNJTFp1aDdRSDFWRExocDRvMUlTQllRTis1QTQ3RkVUbUFEZld5?=
 =?utf-8?B?M2VQaCtueCtDaWNUa0xvYjFpK2NleHhBUFcyK3ozalVrK0lxL2MzaFBDOFNT?=
 =?utf-8?B?OUlMQVRlUFQ3ZjRqQlZxdUNVeGNhdzE3MXppNWJRb1NnQlJNQkpOaTYxTVUw?=
 =?utf-8?B?c1BZS1hRZWNadUFNTFZJeW0wNDlMSXJ0TWROdVRqTmhqZDJJMWV6cHVmanl6?=
 =?utf-8?B?VHZyUnBld1U3RGVEaWxkSFlUYkZ3ZFU5MVY1aFgvK24wYjcrZ0NseGV4SG1V?=
 =?utf-8?B?V1p5U01Hd2E1aitvODdidFZ1M0RYVHNISmdIQ0FLNS9XRVhrUWsrMjUvUXcr?=
 =?utf-8?B?anhIbm1rMVBUWkR2Q24rMXA5YlZtRnljWkY4R1NoWGdtN05TNzJBcGhQdlpD?=
 =?utf-8?B?bFc0emNmVmVxWlZtaDZhelIvOWYyUU1GZVFJcHZ5TVBUb3RObkNBSGczSU9R?=
 =?utf-8?B?TmpXMFQ3ZEhveitMb0VidytNVUN0aCs3MVp4SjM1aEJmOU5WTUtVSXFkWTV5?=
 =?utf-8?B?R0YxemtpY1FIOEFlcU15UHhEellYYkZCZGhPZGMvcStRdGcwR0I2WnhaeEpu?=
 =?utf-8?B?YVpWVG9LSDR4Y2ozZStEUzN2dzcvbG5QaWZTc1VPOWlyNis1RVU4UERJU2Rt?=
 =?utf-8?B?cXUxdUxxY20yNU96SlJNL2U1VXR5NlFLQ2tBdzN2L1VpTTg0Mkd2RUdZQngr?=
 =?utf-8?B?bk9Ecm92Z0pjN3RzZWJ0T05nVC9teFZ0WkJTekpvUUxOSWcrOUV6MU12cUFZ?=
 =?utf-8?B?cVFrRmplQTdEdzc4WkVtOWRLRmlva1YzQmZENEUvYmJoeEdMTkdIZHg0SlVx?=
 =?utf-8?B?aWUrSmFEZnNTMGg3UmNvQTg2SDB2NDZ3azg3cFJDeW9zdERrek81d1hvQjJo?=
 =?utf-8?B?MDlqZElCMFBwSks1RGNBdTFZZ1pqTDNFR2NwL0wvUkFoZjFnVmxibUJyck4w?=
 =?utf-8?B?b2V5bDVabERYUFVUYTJWd1B0UlJQeVVYd1ZZWHRQeS9NK2RURGhuRjdDYWVN?=
 =?utf-8?B?cGFYS0VOMzFHR3BaOEhrY3M2Y3cxYnQxTXVnRFRiUXpOUFlZVy93WVhScGUx?=
 =?utf-8?B?Z3g1SUJaWTZTb2ovWXNiazZ5VlE2VVhBSGZGVFRDQjNBaEZOZ2N6d0JQZkNs?=
 =?utf-8?B?aVJRcDM5N0ZPS0NocnVleWY4bmZMY1I3cUI2eCs5MjMwOVR2eVR3WWZQNWlB?=
 =?utf-8?B?eVdEcmZLbUlqMHRIQStwU3dHanJaTFlDT0NCYmVPb1l0TVFadEU4RndNMkVh?=
 =?utf-8?B?NTF2SUljaWdGWDFGUnA4Y3NlWWxLaU0rNnI3MkFjVldZRXhrUnl2LzZBVCt6?=
 =?utf-8?B?R3JwR3cwRUJQeWFHTTZQSjdUMTN2V0kvckxzNjlXWDZ3b2NvWU9tRC9jMGEy?=
 =?utf-8?B?QllNVTgwYTEvRmgrUk5ncHY4UDZKK3JnVy95WWMwUkVJNkUzU3JuME1EMVlT?=
 =?utf-8?B?NGpVQVVMUndMUmVJaXlHblZFZ1JBMkx0SXR2cHJpREZzcGlqMmp0N0FEQUFK?=
 =?utf-8?B?MWZIbXBOVWJHSVBIenpWWEt5aE4ydHNDNDFWL2wvcnk3clZUZnFWYmxxZGsv?=
 =?utf-8?B?Mm5PaXNpM2xZdnRoRzVhUFp5U3JPOWlZQ2JMdVpKb1U2dWRLNmk2YTJxZGdD?=
 =?utf-8?B?RkVOK2tWV3A5R3NQUXNxMUliUXY3Q21xUlo2bjNTbng2Z3FZeTdpbUdXV3RY?=
 =?utf-8?B?R3VHenlvREdOQUwvbnJLYjRTOHJkS1AyMG5jTFFZaXRjMUtRUE0xMWpKdThz?=
 =?utf-8?Q?fSyypdZp/7HfJ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TFFrY09nRk9ZaTJsMWNHZVVLU1pNcG5VbWdveUhod2k3ZlRjQVB6b3dtVVpM?=
 =?utf-8?B?SEVyWitJMzJXOEtQNC9PQnR3a2cxTVJoaHkvKzMxdFU0MXprN1ZwOHJid2ha?=
 =?utf-8?B?dkd4Q3U4dnEvK0s3UkRTMzVEK05nd3VCWnFERFZvNlJsVmRZZDZ5Z2VNd1hj?=
 =?utf-8?B?dTIxK1dvYXdYQ0hmQStxU09hWk10YzEyTUNEVVp5SGxFM05QYlBpb3lzUHdG?=
 =?utf-8?B?ZkhMd0Y4SVlzTVBxMEFjeUF2N0Z5TGt1WXJUVXZ4SU8zNVNqOE9wN1g3NVZB?=
 =?utf-8?B?YkRFeC9mTU9UVE80K29MQVlmTnZNNm5hZ0hsWVZTQm1ITDdzdlF1c3NDRGZ2?=
 =?utf-8?B?U3ROdGh1L2lFQVZiZmEyNU5JN0h0YTBiMkhUTmUwTk5WdVUrc2hOTzJZS1hs?=
 =?utf-8?B?UmVnTGEzMVZqaDYwMTdqY1lUTzZEOXIwalF4cUg2Uys5Tkkzam5aaFVRcHlV?=
 =?utf-8?B?NmJlZzBvZE9sOGpxQzI5Tm96Nmo2VkdjOG9WK1dZWVdkbGtHVFFrZ0t0RGxV?=
 =?utf-8?B?cTNhNU0rNWN6ZU1hN1QrakowaHh4Z216ektUYTVwVzJLWFBIZlRuVi9IaXZz?=
 =?utf-8?B?TjNHSUZoWCs0WG40UGNJMkhFeEJqN3pPYi9Ld2U1MEdJYU4zSk5qbWFNUDZh?=
 =?utf-8?B?aFdGSXRnbmVyQXltZHVzUytTZitaYjJZQXp2dDFWWTZYWU9NK3BLWGgrNXhY?=
 =?utf-8?B?Sng5WlJHa2RjU1hKdzVYa2hJcW55R08xUkNoaG1vamNzQ1dtTFEyMW81UGFa?=
 =?utf-8?B?cWpxdDhPT3RLMFQ0a0FlTklhQmRBUE9PY1RNR1p1UDhFZDVVZTByN0E4WlZ5?=
 =?utf-8?B?WXkvVDBOckpKbDFlZFZTTmREQ1JKaUo5WHcxcnBKd1p2ZWlXRCtENnBHcnFI?=
 =?utf-8?B?S2hLTk1pNFRoYmZxaDJEamVSeCtuNmxaODJpWG5ISjgwOUpGR0xRL2UrVUQ3?=
 =?utf-8?B?cWdGZk5EQlFNTldoa3F1eTVzR2U5Mmt1NitlaVhUbTNnSVJKNkxCckhnY0NL?=
 =?utf-8?B?b2xBTnh6UHV4RnlhcGY5Q0JsZFpmMHZRSHJwUGU4SXZQR3F0cE9KZGQ2VG54?=
 =?utf-8?B?aGpOck5qNmRXaXdUOFZjL0hEWEpEMTB6d2UyK3lNMUdjc0h2cUZ0cjE2UWhy?=
 =?utf-8?B?bU5sL2tJWUxWWXlyS0lxUFVIcEtEZzVVbWNiNUNzWklTOUM0Y3hGUW93dklx?=
 =?utf-8?B?OW9pTEhFOUQ0UXRpTDFleUlRS0NpWHRqUVNZZnM2djRIMDU2UlRoYXdhb1FN?=
 =?utf-8?B?WWxvMDJnSzVTVnVVYWlaOGlJUWxuT1Q3YllsZktwYU05SjlsWHluSGlyWENI?=
 =?utf-8?B?MTVzdjhTSGFmWWZiTWxmMXZPZ0FEMGJ0MWs5T09lZWVWLzlXZHBoTml5Tnkx?=
 =?utf-8?B?YmZXMEc5WHVyNmx4VDBkdmwwRzBaMUxwRE5pTFhTeEtkMzRCZ2RFcWhmaGhy?=
 =?utf-8?B?Wk5LSEFBVms3dTNIQTNVQ3JGQ3V5NE51cStnTXgzMGQzdy9ncVpXUVJVRldD?=
 =?utf-8?B?N0w1Q2xUTi9JbkVabzRreEoyT3AwYzB4M3Z5U3dNeDFOQi9pejB0T2dPWklF?=
 =?utf-8?B?QUQvWWt3V1VDanJzRmxmZFFPQzVWSFN5Z2x5TzJlQmJSTDM2eFFLOWlHQ1A0?=
 =?utf-8?B?V0gxSFdKSERQR0t3ZmQyRFFqWWFLdFRUc0dtNUpPaGVKS2RKWjVERlkyaDd2?=
 =?utf-8?B?REJuZTNiYmMxcmFmUnYrQjl4emJMcnFlTWZDZ1dFTm8zaVJMK25LR3A3Nmtz?=
 =?utf-8?B?QzV3SDNQSmdpajhRTFc2ckxidk5pM0dZQlJCOFN3ZGtsYWVQRERsVkZIanJ3?=
 =?utf-8?B?QUNmQzZRMy92WHVlNmE2ZjhRTWdTMEZJWUN6WTZsdGVOUE5HZ3lKMEJzY1Jx?=
 =?utf-8?B?dHZOcVpLcHdUdGJUT3lRVzlPNjlrNWpjRkNLaDQ3VmFoTUYzazkzWWR5T1Aw?=
 =?utf-8?B?VFdMUk1mTkdQMGYrNXpSL3hiRC9adE84NGFVYUFqbktYbTRCMDhGeFFxUXdy?=
 =?utf-8?B?b1YxeVJiZ0xJVTlQNitCOUYyUWdpUmNyT3ZxbjlaOUMrT1hndHdUNU5STk13?=
 =?utf-8?B?M2IyK1NwZjM5YTQ5Q1JucFI4anFsYlFEZk9iVG02bFdtQUpMYjFDT1FWVCt5?=
 =?utf-8?B?V2wzNE1sT1JLNC9DcjFKM2YrSU5yYktZNEpXekdUQ0JURll3Q2YxUTg2Yjkx?=
 =?utf-8?Q?BAzuSnkUJB2S+nQ0RKwnP82KEhA3fdvO8zAooLqpOUM5?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 635987a1-ebe1-4c2f-8b52-08dd4f5c0bf9
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2025 14:04:51.4095 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hE3zP+D978PxCQYvUPRHkzMe5hBR5nd1onEbxUfCrbG/egmBSI7qBNWSeHa37qaaQX0INImvvnFiOnameP3LJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4208
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

Hi everyone,

This short RFC is based on top of Danilo's initial driver stub series
[1] and has for goal to initiate discussions and hopefully some design
decisions using the simplest subdevice of the GPU (the timer) as an
example, before implementing more devices allowing the GPU
initialization sequence to progress (Falcon being the logical next step
so we can get the GSP rolling).

It is kept simple and short for that purpose, and to avoid bumping into
a wall with much more device code because my assumptions were incorrect.

This is my first time trying to write Rust kernel code, and some of my
questions below are probably due to me not understanding yet how to use
the core kernel interfaces. So before going further I thought it would
make sense to raise the most obvious questions that came to my mind
while writing this draft:

- Where and how to store subdevices. The timer device is currently a
  direct member of the GPU structure. It might work for GSP devices
  which are IIUC supposed to have at least a few fixed devices required
  to bring the GSP up ; but as a general rule this probably won't scale
  as not all subdevices are present on all GPU variants, or in the same
  numbers. So we will probably need to find an equivalent to the
  `subdev` linked list in Nouveau.

- BAR sharing between subdevices. Right now each subdevice gets access
  to the full BAR range. I am wondering whether we could not split it
  into the relevant slices for each-subdevice, and transfer ownership of
  each slice to the device that is supposed to use it. That way each
  register would have a single owner, which is arguably safer - but
  maybe not as flexible as we will need down the road?

- On a related note, since the BAR is behind a Devres its availability
  must first be secured before any hardware access using try_access().
  Doing this on a per-register or per-operation basis looks overkill, so
  all methods that access the BAR take a reference to it, allowing to
  call try_access() from the highest-level caller and thus reducing the
  number of times this needs to be performed. Doing so comes at the cost
  of an extra argument to most subdevice methods ; but also with the
  benefit that we don't need to put the BAR behind another Arc and share
  it across all subdevices. I don't know which design is better here,
  and input would be very welcome.

- We will probably need sometime like a `Subdevice` trait or something
  down the road, but I'll wait until we have more than one subdevice to
  think about it.

The first 2 patches are small additions to the core Rust modules, that
the following patches make use of and which might be useful for other
drivers as well. The last patch is the naive implementation of the timer
device. I don't expect it to stay this way at all, so please point out
all the deficiencies in this very early code! :)

[1] https://lore.kernel.org/nouveau/20250209173048.17398-1-dakr@kernel.org/

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
Alexandre Courbot (3):
      rust: add useful ops for u64
      rust: make ETIMEDOUT error available
      gpu: nova-core: add basic timer device

 drivers/gpu/nova-core/driver.rs    |  4 +-
 drivers/gpu/nova-core/gpu.rs       | 35 ++++++++++++++-
 drivers/gpu/nova-core/nova_core.rs |  1 +
 drivers/gpu/nova-core/regs.rs      | 43 ++++++++++++++++++
 drivers/gpu/nova-core/timer.rs     | 91 ++++++++++++++++++++++++++++++++++++++
 rust/kernel/error.rs               |  1 +
 rust/kernel/lib.rs                 |  1 +
 rust/kernel/num.rs                 | 32 ++++++++++++++
 8 files changed, 206 insertions(+), 2 deletions(-)
---
base-commit: 6484e46f33eac8dd42aa36fa56b51d8daa5ae1c1
change-id: 20250216-nova_timer-c69430184f54

Best regards,
-- 
Alexandre Courbot <acourbot@nvidia.com>

