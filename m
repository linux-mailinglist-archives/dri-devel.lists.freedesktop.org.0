Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 610B9A767DB
	for <lists+dri-devel@lfdr.de>; Mon, 31 Mar 2025 16:29:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A59910E054;
	Mon, 31 Mar 2025 14:29:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ThVA+A7l";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2078.outbound.protection.outlook.com [40.107.92.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A21210E054;
 Mon, 31 Mar 2025 14:29:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qK7on6lw8G8Rwi9c+uAaXGj3kC/fsWNlvN5u9Ns7H40owro/dZxIolumMyowQl/mMTkv5AhWhY+mXrktzIWQk8AfOxN0Y3JUEFRFgyDxw/0SWChLcdhOnS27lr+R0Nv9AToQv+N7Qsvc9dsybiyadAoTXfi8g4Eh69z/uKu+tO+0nbjp9+0Eqllq4MrHFY4khQiofUiW7KUYmp9lmxb858Vp7AzjuKCNXxoSZhJTA0AUop8S0w0xqlhUQ0iUTN8O3hyTsutWpx/Ne4j7Y36B7284EEfzKDH+k+oNIwjUii4dZrVeua+6w7FKSb9g9bxR761n2TGvkhYLXottRrH0XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+mtGEhZ62SaGonnfmXHK4nwhp0WqOE1ws8uI5jPzkrY=;
 b=oKan3CqO4CtrFNtssbW97sNDYMMiCN/XEqtOrzf7dGtY/HXkTNC0wLZJ7dgWSuoyUZ1+wkXo4nMHdTFznvgiIVGYYbzN02Xcd2PYsmHai4Udej87IvCcb+2lx9pmg5vui6/aQHwLoiF5YqHEw2qbzBY/QT+kF8S8WjjoSrA2+LeAgS4LU6b056qcLsS/ZmxwIfw0gRDl5GIR1KR6xDyOUZSAY8JbK3qsyuO8LbPU8PMH/hk0F/kFc/LGtxc9OiAnm/36zgGnb1xTRS+EHm/53nNjrJurOPFpcnM+rwdEk+1TTO0jrf5EJfRPPo5rDGDBz8nJdZcmcIS9jVDaP9Tuqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+mtGEhZ62SaGonnfmXHK4nwhp0WqOE1ws8uI5jPzkrY=;
 b=ThVA+A7lcWwBOT+Z+dRlswDAHQa8prrwTKO1RIvMwHLzqMGV8KkaArtxNKotXc4G8xKiENK2xBlQm3IvrISqCWxsaHARIk1Ym9gEOnZ878UjdSCytycwUuVTOt1WQXufJMzEwxbXuSNJ8Xd0t3YVEJ0BAwrN+z9b0o2Kujr9/dA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB8476.namprd12.prod.outlook.com (2603:10b6:8:17e::15)
 by MW4PR12MB8611.namprd12.prod.outlook.com (2603:10b6:303:1ed::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Mon, 31 Mar
 2025 14:29:02 +0000
Received: from DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1]) by DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1%4]) with mapi id 15.20.8534.043; Mon, 31 Mar 2025
 14:29:02 +0000
Message-ID: <0add5ab1-0717-42a8-8994-a381b635040b@amd.com>
Date: Mon, 31 Mar 2025 08:28:57 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V8 24/43] drm/amd/display: Skip color pipeline
 initialization for cursor plane
To: Shengyu Qu <wiagn233@outlook.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Cc: wayland-devel@lists.freedesktop.org, harry.wentland@amd.com,
 leo.liu@amd.com, ville.syrjala@linux.intel.com,
 pekka.paalanen@collabora.com, contact@emersion.fr, mwen@igalia.com,
 jadahl@redhat.com, sebastian.wick@redhat.com, shashank.sharma@amd.com,
 agoins@nvidia.com, joshua@froggi.es, mdaenzer@redhat.com, aleixpol@kde.org,
 xaver.hugl@gmail.com, victoria@system76.com, daniel@ffwll.ch,
 uma.shankar@intel.com, quic_naseer@quicinc.com, quic_cbraga@quicinc.com,
 quic_abhinavk@quicinc.com, marcan@marcan.st, Liviu.Dudau@arm.com,
 sashamcintosh@google.com, chaitanya.kumar.borah@intel.com,
 louis.chauvet@bootlin.com
References: <20250326234748.2982010-1-alex.hung@amd.com>
 <20250326234748.2982010-25-alex.hung@amd.com>
 <TYCPR01MB8437BA1D5FFC25AE63F731D198A22@TYCPR01MB8437.jpnprd01.prod.outlook.com>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <TYCPR01MB8437BA1D5FFC25AE63F731D198A22@TYCPR01MB8437.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR01CA0091.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:3::27) To DM4PR12MB8476.namprd12.prod.outlook.com
 (2603:10b6:8:17e::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB8476:EE_|MW4PR12MB8611:EE_
X-MS-Office365-Filtering-Correlation-Id: c0f40113-c8f0-4ab4-d817-08dd70606233
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dnkwRjRsYzc0NmNpT20wU2NxRTZBODRHWEdwT0pkR2E5b2F6VXlXa0JrOStT?=
 =?utf-8?B?RnozV250V1FtM0VPOXExUVZUWVZIUTVxaFdiTmlUVlBXQk1hRTA5UHEvVHZM?=
 =?utf-8?B?cGdQY24zRzNJUmtVOThValphbUVpcUxjaGhXZHd5RE5yQWZYN0tiVWw4M2hw?=
 =?utf-8?B?UlBwQ0x3YlVmWXhHdlZQNkRBaXNhdS9HRllrcFFPckJacmUxVUNSa3VmblVn?=
 =?utf-8?B?V2hUNVZRTWgybHhUQ0ZSU0M1aFFjYml1dTVXK3I0ZUpoeHFXbERXdHdxWVhM?=
 =?utf-8?B?YnZkMHN1bDNjb0hHV29NYnRNTlo3ZHJ6Y3BPTjU2eTVzbDZCT1l3enlxaHB6?=
 =?utf-8?B?bjVob3NzcjhQYWF0TUcrbTdHWVpWZktxOUpVWjhrY2IycmpUNWVxNmV3ZkpZ?=
 =?utf-8?B?WnRIVHlQM1gyanp6TkYycFdZYWljMlUwbTBYRllZS2ZyZklyZ1lkUG1JMzha?=
 =?utf-8?B?U0E5VmJQd1BDTjVPakRVTlMwbkNBUUgvRlFRVWpOditjNmVOdWRwdWUrbXlQ?=
 =?utf-8?B?TkZiNTdXemZ4WGhNVDRRTVRVbFVVTElZTHQray8weHdRck8xL280T2hRNzdO?=
 =?utf-8?B?L2NPdkF0bHlER1U4a2luM0kyQktYNU1oTEs0ditNSUxjZjNieXBabHp3QUVt?=
 =?utf-8?B?Uy9yQitUM1NOMVZzVmxvUWExQkVVTjBZQ29DQzcxSnJPVFR0NmUxN2paeHBi?=
 =?utf-8?B?SXBEQmNIQVZnWHprWTJMcm5HODQyOTZCazBqUnljclhYQ0lObVN6UWlKNlk3?=
 =?utf-8?B?RFhQMHdtMmhXYzgxSFJJRTdtNHZvZW9PQzVLMXp6U1A5WDdHa09xUnFMNXo0?=
 =?utf-8?B?WXY2aFpDK3cyYkk3QTlkeFRQZWxGdnpWOHpDblRVVlNlVngxRlI3NFpXZ1o0?=
 =?utf-8?B?ZFAvb2MyYzNCNENUUkNGdENpTE1MTUhFc25HSUdKNXA3cEtmUC8veDlHc00v?=
 =?utf-8?B?RlMwL1RXbUpBNWJXRm52SGE3czR0VGd5Y2phQmVuMUh0Tkt6WTdXaXdKcjZr?=
 =?utf-8?B?TUNPUFlCc0dxbTk3eVdCdVNyWXpFRHE4cFhJNTRyWFJYZEZhNWM0ZXlXNmUr?=
 =?utf-8?B?YkZTdVNwRi9zeWQ2UHlsY0V0SDd0ZFFxZU02VXk3bWhxZDQ0ZFNXV1ZsL1kx?=
 =?utf-8?B?dGNjTzJoTFZjSm85RU9GZStyWlFlWnZ6T2pKR2F2OWJGZDJ0ZjdLY2JIcmUr?=
 =?utf-8?B?RVpzWTA2THdTd0g3Z2NhRW9CNTFwMHo4dzR2aHhjbFZ6WEJTMVg4ODQ2UEFY?=
 =?utf-8?B?MllNODlLUXZBSjZoT3g1Y3gyMHo0bXJ0VVFKRjRiQzdyQXhBd2JyYXdqZVJK?=
 =?utf-8?B?dGs3QVpzTk1zcStkM1oxNVQwUU1XV1JaRTlqc3prdUFCSlhsQk9KYytuazc1?=
 =?utf-8?B?bEhaUXBpQ1pnNDM3bktjSmxXTkFHSWtXWEFqRTlYRlRNeHBrTjRUby8vVTF4?=
 =?utf-8?B?T0VlVmNuU0t4K2orN25tTzgvZGx5U2IzYzZCWVdiNWZnQ3FaWmM5Vm4vTWZj?=
 =?utf-8?B?S2hmM1gxclpRSWRSSzBFWTVJN1I0S3BvdXdXWG5UdnMwUjNpRGFoSDJUMXlG?=
 =?utf-8?B?NDErOTNFaXAyajR2TlFnNHpXd2ZWSHIycktBNkR3TUpWNDNjS0p4MUwxTnpK?=
 =?utf-8?B?NkkzNXRBandLTC91ZHI5VmNjNjExajFQN2J4MjcwYzVHMENka3p1bENEOG1I?=
 =?utf-8?B?L0d1VHFFTUw5TGhGQWdHYkY1TjU1YXN1dkVZYmtDR1FDYk1HN3NDL0RTeWZj?=
 =?utf-8?B?M1pqL0lJajQyZHJwcER1eXJVaTIwbXBzTEhBRmhMenV5RGlib0pRVHFFQVFE?=
 =?utf-8?B?c05zcmUzaWV3VFpDNzBxQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB8476.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q2VkanRzMUR3WENwK2QwaGVrRnhKaVpJU3BKU0YyNmhNRHBOejh3MU1WbXlH?=
 =?utf-8?B?V0l4SzhZQWE5Ti9lZ2Q2anVNSHlJSGtyVXBIQ2E2WlZLd2pRdk9zQk5RMTdr?=
 =?utf-8?B?dzhOWUxzeDFKdEJCaDM1cXY3OEdTbjdjamtSeEt2NXZmUUJlVGI4aEdOS2JM?=
 =?utf-8?B?SW55bEREYVlUN1QvSVViUEZhYUs4c0diRUhra2x3Q1lpVW9WeVB6ZDF0MjV5?=
 =?utf-8?B?VVNSaDhabmhXai94aC85cXVXdHNqdEU3d2F6QzhPYUJ0bUVYQ2NiZnNQZ1BU?=
 =?utf-8?B?WkVtcm96QkpVNU5va3l1aTRLU1ZlOWhHSytPdndwQzBVdVFrSTFWUXhTRSt5?=
 =?utf-8?B?c1ZMMXZzb1hBbzN4V2dNeFhZaHF1RElWckZVZExuZHJnOXAvWkQ3UER5RUpy?=
 =?utf-8?B?T21rMmlVT0luek5jNDZqZVg4YjZEMHduYlZZVVBxQ2hxSEh6elJ1YUtkMEQz?=
 =?utf-8?B?cUF6aGY2SXcvdkpWTDYrK3Y4VTBOYURseitQMG9lOGlRQ3M0M1Z4b2tRWWw1?=
 =?utf-8?B?cllyVmcvN1EzWUxpNlJuS1JCZUt2NG4zZjFPUUcxT3FYSnV0R3V2MzI3S21M?=
 =?utf-8?B?UG5nTEwxL2xEakRJUE9vdmpML2JkYk1aTWdKQytlMXJ4VXE1RUZ1RDdIR2pz?=
 =?utf-8?B?Tm0yWXhrMTZIZ2dWVzViNHJRZ01vNEhOOTU5emFyditYWm1MSzFFU2hLTmR4?=
 =?utf-8?B?TWJhakx2anlBTngrU2RGNzA4S1NCQ1pvQ2ZNZlY4NUxxMENCR0xlNHd0VTZo?=
 =?utf-8?B?YkRVa1NrdTdhd3Bib2tnRG5SajZpNzdOQWNaeEFRN2Z6aHV6WmJYU253YlFx?=
 =?utf-8?B?VEFEdjJCTEQzWU1Td0RZaWdSVHUveU5VVjB4WDZpUkYwZmdYdFhPMlhWbnpW?=
 =?utf-8?B?Z3d4RmNOL2ZtaHgvNEN6SisxUWw5TDJkeGZaZnp1eFBXWTJRSmg5UkdiT0ND?=
 =?utf-8?B?akJPWW9iU1o4eWQ1ZWMzell2UGtGeDZXT3hqVmd0bXBLak5hNFZ5SjlzQnZh?=
 =?utf-8?B?azB6cHUvSlZQYm0wdlJ3QzBzWFpJVUtyOTVKaGFUeVpOblZBR0NVeVBLc1FC?=
 =?utf-8?B?dHM5elk3cm1nRTMyVXlFL3BINFNsV01TZkZHZlBaUzZEQkdPS3hRZFhTaHo4?=
 =?utf-8?B?TGlycU1FU0VsM1dtNUJ5ejdxSnU0amZrYkVPZkdEanZJMUMzVFE3V21QSENH?=
 =?utf-8?B?cDVYNHl1SGtUVnh5MkJlVFJMemZheTBDa3FLTW1CYllrb1NkM2VXZzRiMzdp?=
 =?utf-8?B?OGtLN2FOL3FsWjRBQ0M0QmFURitYOWxhcldxbDBhMEVsNHhTL3J4ckZrUWh2?=
 =?utf-8?B?V0RyY0E4SXMxanhnWHUxMnd1NWNWSkNGempGYi9vSEZIc2VCM3B2QnZmYTky?=
 =?utf-8?B?NUp0bzBoUWlJMUlCdW41ZkJ2UUhVWkRkemZtSUo0RzFIdUs0eG02SExsTmR5?=
 =?utf-8?B?NlhsMDVSRHg4a1VLVHdlN3E1Z1ZIek9qbDNPcjY5NHp6VHduZXJWQUkwS0to?=
 =?utf-8?B?N2pLZEJabnlzNE15ZEpieTZJVUVFOURYS0JlQ3VzSlVrSVlZZURMY05MVFVJ?=
 =?utf-8?B?V2pVUG56NlI5TE1ydzYvRG1VREh3R1RKVmpHKy96Umh2MDZxNGNaVVpTWHZv?=
 =?utf-8?B?N0NpYXZnSDgvZTVCYmowWVF3Y3IwdjRkMER4L1ZhZlZWaDdIRDBhZGJCd1Rn?=
 =?utf-8?B?Z1prbHhFVFMranR4bFB1aWN5ZEFRajdKTm0zNjVxaXRwM1R3SU9ieHJ3V1E0?=
 =?utf-8?B?V213SXVqUG1MTGFMZGpFa0RkTGlGcWVieUUvY1NRc2pHUDk5T2FObmtRdUZT?=
 =?utf-8?B?UjlzMi9NVjUzczhaUk82TVI1Q01xWDlJRWJYY0NTRmtVMlB6RU5QM3g1bkZ3?=
 =?utf-8?B?Ui8xMVgyVTA0Q0JlOHdzcTd6SWl0TUVlS0lCNnNUUnBPbzFRTUJlLzRnRFRo?=
 =?utf-8?B?b05JdEIvK1ZEVlpwb1paQ1BJaXZtbFBFaENQaW1QWWpGZXRJN2FwV3N5Y0Rn?=
 =?utf-8?B?SUc5d1Z4TlRHQWo0TzRtZVpzNmU1cUd3UldTN2pEMEdxckoxTVpoMEc2VkJo?=
 =?utf-8?B?OWo5c0o5UWwyMkM1THQxSmt4VkpEcGhQMGZPaUV2MTVhNExta1VOMVdlQVRk?=
 =?utf-8?Q?JrIaLgSj4pPsi3XwdsCNrvYih?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0f40113-c8f0-4ab4-d817-08dd70606233
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8476.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2025 14:29:02.5703 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aTDSoRFwKIoeh5lsAQHRrbaL91de5+5pxeNB1lTgNpP+fJw37S8V8Vr0IKXpELl20sNULUKodE8+6pec8C13yw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB8611
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



On 3/30/25 06:59, Shengyu Qu wrote:
> Hi,
> 
> Do we really need to disable cursor plane color pipeline support? I 
> don't think we need to disable that if it is supported, since there 
> might be some user-defined colored cursor icon.

This patch applies to AMD hardware only: 
https://elixir.bootlin.com/linux/v6.13/source/Documentation/gpu/amdgpu/display/mpo-overview.rst#L101

> 
> Best regards,
> Shengyu
> 
> For some unknown reason, seems my mail is not shown in the mail list 
> archive, so I resent it.
> 
> 在 2025/3/27 7:47, Alex Hung 写道:
>> cursor plane does not need to have color pipeline.
>>
>> Signed-off-by: Alex Hung <alex.hung@amd.com>
>> ---
>> v7:
>>   - Add a commit messages
>>
>>   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c 
>> b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
>> index 9632b8b73e7e..b5b9b0b5da63 100644
>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
>> @@ -1792,6 +1792,9 @@ dm_plane_init_colorops(struct drm_plane *plane)
>>       struct drm_prop_enum_list pipelines[MAX_COLOR_PIPELINES];
>>       int len = 0;
>> +    if (plane->type == DRM_PLANE_TYPE_CURSOR)
>> +        return 0;
>> +
>>       /* Create COLOR_PIPELINE property and attach */
>>       drm_plane_create_color_pipeline_property(plane, pipelines, len);
> 

