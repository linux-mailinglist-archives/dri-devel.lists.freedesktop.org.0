Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CB2592543D
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jul 2024 08:54:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 510E710E737;
	Wed,  3 Jul 2024 06:54:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Oh2dwGea";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2071.outbound.protection.outlook.com [40.107.223.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C34AE10E736;
 Wed,  3 Jul 2024 06:53:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dI0Md9vrOrfO8pzDF8Tqz5ohv0DscRu6pZAJuTwHMOHv5QOIwVP3NrzTgJhkmIN7KwXyWirOc4loeZRz6BN2oHQ/+Kryu4cuNyFDG+Ez8ONbqxlcghi1oy5YcoUES1BJ5lYQqmMKb9Z6LpREoe3YZgw9q3jTUNcky09GxZHUqp79tRi7jTJ1rK5BMhvwyjvPV2o6r+jsgb0DfCu5Yhq7s+erLUGw+F5pC8AdC+yN7pm8zgn9ihizCfEaZAAnGTQVTywhesA2uQJeXjZP9xbR3AWHhLhAxRAemrwSjA3yWJINrMzrOMqrCUUJFE+A1sWWfu+alwsG/xCys/TDY2cRtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8kLp3J+X9EKK5Eb0UBZ8IjzjiNzMrBgb9G3Spa/5BIM=;
 b=nPr0V0JmJ0aYOVt6wopOgMxHf6zTraoL5ANawfLOsOkgiJRFLXDfMcO2NpQfK1+0Wrv/0M9W/Ui+j3yVzaztRujAPR5lHoEA3g0EVj60RgEghdHdTQUUOjNnKrVIIWEBFFzpCcTyrBbPWki5+anTt6V7pbz5UVraOuANwepYGe5MqNZwiDkegmRoOIDam8RU7d1WmCZ6cKD95cdTw9r+Q04zUFHvZW7K1VDhNJsJxunk6kr/2YFbg2ZsIaSlcgIPvvYbIrTw/Xrv9n0sGruAyR+7hhws3Y1bYY8DLUgQa28XrMEwf5dneQp/809RGE0yIfE3/2MAnJ6Vz/Qu6JmhDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8kLp3J+X9EKK5Eb0UBZ8IjzjiNzMrBgb9G3Spa/5BIM=;
 b=Oh2dwGea1AZZjzUOql9mjAop+R9V6fTp7q0VvQf9JVQBypWmK6wMEypIsjOYD2k750crT2JCX/idlGrrCGzHo0t50R55FSfpuPGruIt1iY0CGoUVRaQfsRJWSyDbE8PH4NBS3n1oTUF+GTjGkqZE/sKgNRsnZz9Pz6h0ZAAOYRQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by MW4PR12MB6952.namprd12.prod.outlook.com (2603:10b6:303:207::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.26; Wed, 3 Jul
 2024 06:53:55 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%6]) with mapi id 15.20.7741.017; Wed, 3 Jul 2024
 06:53:55 +0000
Message-ID: <920e08ca-1318-4c0f-b1dc-b335c00302b1@amd.com>
Date: Wed, 3 Jul 2024 08:53:41 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/ttm: Make ttm shrinkers NUMA aware
To: "Bhardwaj, Rajneesh" <Rajneesh.Bhardwaj@amd.com>,
 Alex Deucher <alexdeucher@gmail.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Cc: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "Kuehling, Felix" <Felix.Kuehling@amd.com>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>
References: <20240702173048.2286044-1-rajneesh.bhardwaj@amd.com>
 <20240702173048.2286044-2-rajneesh.bhardwaj@amd.com>
 <CADnq5_MU-j1sBYn-7dzvEKF73VBc=bcYOYY0AcbPjrJnKB24Zg@mail.gmail.com>
 <efc11b48-ccc1-4bdf-9585-a66edfa6307e@amd.com>
 <DS7PR12MB59332621FF50996A88C3F84EFEDC2@DS7PR12MB5933.namprd12.prod.outlook.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <DS7PR12MB59332621FF50996A88C3F84EFEDC2@DS7PR12MB5933.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0007.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c8::10) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|MW4PR12MB6952:EE_
X-MS-Office365-Filtering-Correlation-Id: 91addc32-584c-4f0c-f363-08dc9b2ce7c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cklWam5zTHB1NkxnVW5abk15SG54TmtYTnVBbGF3NG1yQWxvcFM2RnFVRUdt?=
 =?utf-8?B?T01VbjFaVmUweEFQRXpxck1od29NRW1VUDFKNWQ1Z0hhdW92clc1TlM0M3Jn?=
 =?utf-8?B?MEt3VlJoSk1nSFZwbm84RzBmSVF0NExGN2VFenJMY01RZDdwcWJpd2YxTUVR?=
 =?utf-8?B?ZjN1OTM0emprWjJJRmx5NUZ2NTRKTjhIUHc0SmtUaVdTNHhySFJCb3lsdVQx?=
 =?utf-8?B?bGdkTUtXZ05wRkV2dm5JN3dseWtFZ3phbytaNFZ2cDF2ZW5zR0tzb1gxN3FG?=
 =?utf-8?B?YWFvdER1cFo1YTZsencvYUFveDJrYlVyWm55NytjbXZpUXJHUDJTbElESXpZ?=
 =?utf-8?B?ZHMyODZvMU0rK3orYUxoWHdSdk1aOEpFaDdWS1dmbHFDTVYzcGttdGc5cldT?=
 =?utf-8?B?U2xIcHpwQ0F1Sld0MU8zQXkzYi83b1QyTlpLZkhKWi9mZnNlaTVURU40cFE4?=
 =?utf-8?B?NUVNR21Gc3RUWk5LZjgyaTNtTS9aWVBHclVTVmp4QVBZTGZKSDBBWGlaNzdB?=
 =?utf-8?B?SGlCUVhLRWhjSHZmUlpTam84cnZwQTJEdXhPWmIxZHk4RlVvejdob2NSN2cx?=
 =?utf-8?B?eUU3dC9RaG96NGs0a0dUK1NDdkRLOG9uWkVTYXNDK251RldFZHkzL1RPdFph?=
 =?utf-8?B?WWxlY3p6dVcwVHJPSnBndUpWYUI2dW9SdjlOM002RlZoQlJCd2UxcUU0ZlhQ?=
 =?utf-8?B?QVFYck9OeExqRTBtbGR2K1p2aDV6SFFNRndMM05Vb0szNFpJdWNNQWljL2pM?=
 =?utf-8?B?bEFxM2NBaU1pcXA4bW85d3ZYT1pNTkphMDAzMC9yZVJtWFp0OW5PL1ZIMHV3?=
 =?utf-8?B?bitHMCs0Sy81aTVLYkJMZ3pZVHlCdUJadkFLSThWdGpJTUNCcmpjc3VDYjk3?=
 =?utf-8?B?MGkxT2hkR0xGclA2VEx0UUZwdndxZ3ZxT0VNeUVjODlxNlhxOXdnWDVoSUN0?=
 =?utf-8?B?dmxadlNzcWs1MHMxZFVZLzkwTXVLdnRTSExqUDR6KzJnUUl3Z1dEMjRSTDl6?=
 =?utf-8?B?RlJuenZFZTFoT2h0MFRDOG1FczlvRkNodlRUbUVxcWFqVW95NTBpMEt5K3FC?=
 =?utf-8?B?RWUzcWpmMjBqNm45dWdPZ0lKTlZubnFHZE93eis1b2RqZGtndEgraC9Gbllt?=
 =?utf-8?B?UDJyd3Q2ajZNZXdNZnpRQVJ3Zlo3ZXBCRFNOTGNWRGFaYUhDdnhLM1V3Y3hW?=
 =?utf-8?B?bWMvcmEzYzJLN0ttVTN3N0xYbklGOXZpN2pxWWw4aTIzMmxqK1gxWTczQkxD?=
 =?utf-8?B?U1V0cTArYWxzN3FxZ29CKzhKSEsydE91K20welgzTEF3amxpOElic1luSmF3?=
 =?utf-8?B?dzVWUHNtRUtKRzIvWWF4VFllMVlhdjV5ZlNDS2dJUmtjMXR2S0p2U21JVE1H?=
 =?utf-8?B?QWVlaFVOQXA0TjZtWkhzaDQwOWhSOUIyNDR6d3Y0c09iZVI0aFRvdXV6OGJU?=
 =?utf-8?B?TC92ajRTMnNQTGFmUDJVVzUyVTM4L29majRtNG1SeEo4WE1WMGNSYk1BUGZq?=
 =?utf-8?B?WG9BdEQ1MjRaLzFYaUFWbkhQbmdJTmNGd1pUaEdjKzJOMDJudTdWOEhYdHlB?=
 =?utf-8?B?Wk95eVF1VXJKdVJTQXZKNm9qMDJDaGxURnpMM2o2RkZPYmVRMm5sV1JlUjFP?=
 =?utf-8?B?YnFtOFRYaFM5dU5wK0ZGZ1d3ZE1KaEYrRTM5amQvSHFGSkJEQmFsZmhLWVZ1?=
 =?utf-8?B?eXc4VGFRRXFoT1BYMFN2U1h3MFgxdkZvd2tOZU5KWU1rUXF1Yms5VkMxQk9i?=
 =?utf-8?B?RE81Si9HK0lpUmVORGxYREtsNkJGYkpFSE5xM1dEWXYrSWJXcEJQQ1I3SW1K?=
 =?utf-8?B?Ynl3ZWdvdldMckxDYmtFQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UzB4SHA1b29lbkpyY2ZkOSt2QjhJVmdZS2R4U1pIdTgvdjNub1c2czlQVHdn?=
 =?utf-8?B?U1B6WEJxSUxSTStKdXB5QlVEekhkR0hISVA4V05UYlZkMG1xYmFtdkViMGNk?=
 =?utf-8?B?SkVWUWZTK1puaEhFeGdxZFhFbEVKcE9wM0JYdGUxUS9aRVkxQXdkQXBFWFQz?=
 =?utf-8?B?T3QzQmhkd0c5M2tPaVIwNHFCdnFCQ0pqWGhZTTFFeUJpZE05S2R4cEpOYnRX?=
 =?utf-8?B?NUxxUXRFT3ZBeUJoRVV3WThCTWthTUxGK2U2cWF6MnBJWFhEQk5YaUVyTldJ?=
 =?utf-8?B?TTlKaVA2djFQZk1NK0FrR1RaZHM0ZE9vRmpyaGwvQm44TXpkM1RmTUlGMWk1?=
 =?utf-8?B?WnhVVll6VzZyWlI1bGs1cmdWVlU4bVVXMXJOTzJ0VlJ3WXBOejFpa2ZHVklM?=
 =?utf-8?B?eE9QTUM0Z3lGUmpROWgxN2k1RXpySktwSHptOG02YU1yb01vNTdpZ1JiaVlG?=
 =?utf-8?B?TnNVZTd6NW9PeE8wQlkzQmM4WXFsOFV6akszZmlESlF5aUt3UGVqR1VSdWx1?=
 =?utf-8?B?UlNwUERZb1dBZ3pNQ1ZsRHpYTzhnei9iMjlLYUdVczFaWmZwQ0pRZDlTZVRS?=
 =?utf-8?B?MVY4TDRuaTZWZUhFNXNad1ljVFBEM3AyVktZdWdxZFk5ZkxNaHludTM0T0E3?=
 =?utf-8?B?SzZqUHBjTkRRZ2tzWjRMdFNiUjNvb0FVVU9nbDRiTDBaOWlaY0ovQVlxbm1R?=
 =?utf-8?B?aVBoN2orTC9NdDFSOVM2QklyUlV4a0pLZEVrOUtsWitjbklON1Y2NW1JV21n?=
 =?utf-8?B?MGI4cjAxWDJFUmRjMTVtWmwrcnY2Wm5iTkxPREk2QVErZjNvMXNPd3dYYUsy?=
 =?utf-8?B?RFQ3Y0hNZFF0VUxkTU1rM3I4Y3UyWUZlS1FSd3JUemZQU0JUVUVXZXRBNHY3?=
 =?utf-8?B?MzNPR1FzZ0wvWU5zbjhnZjdmODg5clkzbTI5KzNRTm83R1dmaFg4enNxQ3k5?=
 =?utf-8?B?Mm9jNlBLY3BQWkcvK2NTRUpzeCtSNDFGK3Q1U1p3d2ZpdXFiRmg3QUZpRzEy?=
 =?utf-8?B?N2g4cHVQYmQ3ZTREa0cvZkI4c0pvUHdBREVKNDhnVXlJUHV6eVQxNm9FS2Mw?=
 =?utf-8?B?UkF2NHdLZzNBclNScndlODV3MDdPL2J2SHp1aGZIRkRqUXBMcnkzbWVicEs3?=
 =?utf-8?B?Q3FtZnNFeEJrazdjL1VTUkdha2NabURub1pWc0IyTXdsd3NaRFhURzhpZUJo?=
 =?utf-8?B?SVNZZ214YzVNalR3UlY2eWFBdWlzWnZaQ281T2hwVitQaXEyZ3FkRExOb3Bv?=
 =?utf-8?B?amoveXlqdTVtR01qZTJzenhtRmZlS0VpdEQxRktQdVk4YmltVjQvMTFIMWNH?=
 =?utf-8?B?Y1dpUUNNOVBETlc5aGZ0MzVscDM3Wlp6T0JMMnNzbzk0L0ZaalBodUp0VVVV?=
 =?utf-8?B?MkdLZk03YUNiMkhHQWsvZUQ4SllReW1vZm8xeWJndkM4ek9vaHBPVURmMDcy?=
 =?utf-8?B?eGNHd2YyUWdiTHBVY0JSUFRsS3NuUVRldGlzbjQvUi9GV2ZIS05nMkpncm5M?=
 =?utf-8?B?MnFGcXc3eU1kcm5nVTVISExzeHZTV0xJUXk2dzlocHl4cm9WT3dkaDBIZWRq?=
 =?utf-8?B?ZDRMS1BMRXlobGtDQzA1ZmtZS0ZYY3BiYjUyT0FBbzhUdWlOYVpMZTIyWmVq?=
 =?utf-8?B?ZU1NKzY5MnNaUFBnZFRkZHdJMnZHRTRNMktaT29TZ3lONmZpbGJDMW8wbXFt?=
 =?utf-8?B?MHhTRmVBZE5GVmRqZlRCM28rYmtxK1g2TmU1TVQ1OXZzWHRpN0JobjNMN1Ra?=
 =?utf-8?B?dktXVnFZN0twcGZwS1pKcVVCZGRYaGFURzlyem1kZWpwUDNYQUFDaks2Z0Iy?=
 =?utf-8?B?b2R4QjFFcUNpQkMwdnlQSGlNQjZjQUNiMUFRMlRGMmszd3Y4L2J3dzlKTE8w?=
 =?utf-8?B?OGk2SzZyeFFUQ1VRWjVWRHB5a3I5NHRuY2NscVU0b1N4QmxwdEVTaFkwV1pF?=
 =?utf-8?B?U2ExUVJWN25LWDU4b215UGFSMDJaN0szMFlMU3liNXQvZTIxQnU0bGF6bEF5?=
 =?utf-8?B?blVwZzI0bFRpZnZoRlVFYXlFUTMzbzR3cUFuTVN0cVZNQUFHTklvRGpxdDdH?=
 =?utf-8?B?bTZPMWt2YjVCYlFyYVMxRXUra0M4bWVpUXhSbjljblFLQmg1V2V6K2w2Uzcy?=
 =?utf-8?Q?mGnvNFVOyTvuWVh6WT9HgiubE?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91addc32-584c-4f0c-f363-08dc9b2ce7c8
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2024 06:53:55.1150 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GidUsV7MmlC2jgs649lpbXPPp6CL2AkI33oquFuqGM30KvDIFKLAhSSoTdIkqlgi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6952
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

Am 02.07.24 um 23:54 schrieb Bhardwaj, Rajneesh:
> [AMD Official Use Only - AMD Internal Distribution Only]
>
> -----Original Message-----
> From: Koenig, Christian <Christian.Koenig@amd.com>
> Sent: Tuesday, July 2, 2024 2:25 PM
> To: Alex Deucher <alexdeucher@gmail.com>; Bhardwaj, Rajneesh <Rajneesh.Bhardwaj@amd.com>; Maling list - DRI developers <dri-devel@lists.freedesktop.org>
> Cc: amd-gfx@lists.freedesktop.org; Kuehling, Felix <Felix.Kuehling@amd.com>; Deucher, Alexander <Alexander.Deucher@amd.com>
> Subject: Re: [PATCH 2/2] drm/ttm: Make ttm shrinkers NUMA aware
>
>
>
> Am 02.07.24 um 20:20 schrieb Alex Deucher:
>> + dri-devel
>>
>> On Tue, Jul 2, 2024 at 1:40 PM Rajneesh Bhardwaj
>> <rajneesh.bhardwaj@amd.com> wrote:
>>> Otherwise the nid is always passed as 0 during memory reclaim so make
>>> TTM shrinkers NUMA aware.
>>>
>>> Signed-off-by: Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>
>>> ---
>>>    drivers/gpu/drm/ttm/ttm_pool.c | 2 +-
>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/ttm/ttm_pool.c
>>> b/drivers/gpu/drm/ttm/ttm_pool.c index cc27d5c7afe8..f93ac9089a60
>>> 100644
>>> --- a/drivers/gpu/drm/ttm/ttm_pool.c
>>> +++ b/drivers/gpu/drm/ttm/ttm_pool.c
>>> @@ -812,7 +812,7 @@ int ttm_pool_mgr_init(unsigned long num_pages)
>>>                               &ttm_pool_debugfs_shrink_fops);
>>>    #endif
>>>
>>> -       mm_shrinker = shrinker_alloc(0, "drm-ttm_pool");
>>> +       mm_shrinker = shrinker_alloc(SHRINKER_NUMA_AWARE,
>>> + "drm-ttm_pool");
> You also need to make ttm_pool_shrink() actually use the nid.
>
> Yeah, Did you mean setting the nid of the shrinker control structure from something like ttm_global_init() -passes NUMA node id dev_to_node(dev) to ttm_pool_mgr_init and use it to set the mm_shrinker->sc.nid ?

No, the nid needs to be passed in as parameter to ttm_pool_shrink(). See 
function ttm_pool_shrinker_scan()

Regards,
Christian.

>
> Just setting the flag won't really help us.
>
> Regards,
> Christian.
>
>>>           if (!mm_shrinker)
>>>                   return -ENOMEM;
>>>
>>> --
>>> 2.34.1
>>>

