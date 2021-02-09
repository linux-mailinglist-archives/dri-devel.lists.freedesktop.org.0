Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 43C06314A5F
	for <lists+dri-devel@lfdr.de>; Tue,  9 Feb 2021 09:35:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED40C6EB6F;
	Tue,  9 Feb 2021 08:05:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20621.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e89::621])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 916276EB6F;
 Tue,  9 Feb 2021 08:05:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lLwyiUaVHBaaOdua9xpf8zJLAtRdF3N/JENdu8+PIEDNc/pLyC5OZGzO8ZHaQazuPG8w66ypxWxYY9StIC48aB38EdlVbG8MEVJa1KwbYeZO3Rn+cqCptvP1aSip4Zc8nR+XGfw37rqz0PdFExCefeFvS0tJbNQxpQQsiTj18ISo3Kg+0ad8fgDs83TXlbq2JPq4KylLFWANZJEw998vOL0rcBcoRC02sHARGkRTAH7ollzfk4m7Muq8wnx9qcKTrC7kma3zMjSrg/Ld0DRv1c0Mik3m0+RfjIgAAy3GjepdwUfoTBarUJfbrrop5gzMJXV3hxkDzCmOO6AWVzhPSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+CVNEJrAa6Ifu9p/DYuKccOX4PuAr8KemBUHmaO4tuE=;
 b=hWIYiJvH4A3+Zp6tBjL4XdPwPj2PhYfEGesy1L/CQaKKO2Gsz2qgMZrqLAsvUwJCK4yE/a8MJyrlKe13sr4JvpoBwNHeG7dF/xNmCE7nn/KuFiUze3MU06wQ1J4eHGrgPX2aBQ3MWvajOoJ4LfKrZYWGLJZJt7IgsoJSbovCJAqR08/YNnC/RDmAn7MyqEs1ExGUf0bUZaEi66Q14ZIiGGZmmvldgyv4OVT43X6qvlDwzXNL+dYIixgnPJCejhvyJm4zI9dDMby5Ai1YkhoOc2WZCyo+pT50WxUBr49ivzqr984lZodVWb4cg2GRFjremCxmWZ0ZiZ5w4RuDv/bYDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+CVNEJrAa6Ifu9p/DYuKccOX4PuAr8KemBUHmaO4tuE=;
 b=ZDJ9LZVIH8t+3BWD8UWynB3Qlt2mCV3KktkrEI67JIYq0yPGCpy5uQcdvMjZeRDn7+Dmuh86MT4iS0VHelK7UArBvn4pWah/uzKA/rClm9fd1PmLvslJh3FD6BOJP/dQlmP79Sbr7Xqmk2h1+mi0/Q6EpahooYdLqzBUtYGvDhY=
Authentication-Results: linutronix.de; dkim=none (message not signed)
 header.d=none;linutronix.de; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4223.namprd12.prod.outlook.com (2603:10b6:208:1d3::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.20; Tue, 9 Feb
 2021 08:05:45 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2%2]) with mapi id 15.20.3825.030; Tue, 9 Feb 2021
 08:05:45 +0000
Subject: Re: [PATCH 0/4] drm: Replace in_interrupt() usage.
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 dri-devel@lists.freedesktop.org
References: <20210208233119.391103-1-bigeasy@linutronix.de>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <21c6af35-165c-3f34-9105-dedbccbf8ddc@amd.com>
Date: Tue, 9 Feb 2021 09:05:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20210208233119.391103-1-bigeasy@linutronix.de>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:444c:9a67:948b:2493]
X-ClientProxiedBy: AM4PR07CA0003.eurprd07.prod.outlook.com
 (2603:10a6:205:1::16) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:444c:9a67:948b:2493]
 (2a02:908:1252:fb60:444c:9a67:948b:2493) by
 AM4PR07CA0003.eurprd07.prod.outlook.com (2603:10a6:205:1::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3846.10 via Frontend Transport; Tue, 9 Feb 2021 08:05:44 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: f54f3d0d-d6fe-4b73-24e7-08d8ccd180ce
X-MS-TrafficTypeDiagnostic: MN2PR12MB4223:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB422339ACFB683F858EA7F37E838E9@MN2PR12MB4223.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jYUnWpyohtTjt6WVOzxt0+HHAKxNfz8eTz3QVI51HY+Jmza/zS8fJSpppUM2Gj2KlxWdgEnLSxnRezITENoJ8lcbAC08ekFC1RJhoA+tJWCrgkz4tw3CkU5UcTj/yaypBakFbAog2km8+3VMiEP1XML1PaH96LJdTg4oTtURPZpRYAaHLidArWaLwUFzsx5U1iavN68MdTCj2UGTIAGCNpWl6AgqeYo6Rn1Vi2HRHbEPNWY/u3zrN0NGdtw47nZIp7ubxy/8bSpOg8rsVh6sSsYbYPvkRpEF+/i4lZQvIWcOyLocJ02ieUVhQsTx38KR2WSy3F0CCJ+P2CWyqrXwg4/+BOk/zcledY3925Ga4kwfwav/5sn7Klu0WPS9t12K6jd9nbNJ62y+6SmXX58m6756m7YrUEjnf9FjJCicNaJPVT2UuO2tuxsKH02FOhWPz39Ljzqr/Gd3zBxKDHNKFB3YE9l4MaQRlBazMKpCnVsO6LIKbKyQcmH/TDefilIdOLrgngjlEqpzrzGM8oDkMotXtg1InWcqNd+x1aMFemR3G6UP5RvPuRkdMcwK8VSaA1/hZXLWZv26tVyJVQZImjEDwl/4Ml5L88Fx97il1P5z/kSijNJM4a5jI7L0L11qKW0nr+Iz+yII3O9NjAYBV9SUKFzR2+eoGhdIxMdbzqlLCRvzQVecy4+1owLKP53P
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(366004)(396003)(376002)(346002)(136003)(36756003)(54906003)(52116002)(478600001)(16526019)(31696002)(8936002)(8676002)(66946007)(316002)(2616005)(4326008)(186003)(4744005)(66476007)(6486002)(66556008)(5660300002)(6666004)(2906002)(86362001)(31686004)(966005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?SHF4WW9FL2hGa01aakQ0RVdPNzc3UjQzaklrS3BtNHJmUFRKQTNRSUUvWW1o?=
 =?utf-8?B?OUNkb3FaM1RqancwR0JCUFdybmJ2UXY2aVBhajhtaDdUK2IwNk5wZXIzMnE5?=
 =?utf-8?B?KzJyT2k5SzZjaEVhWHc3YU9WbUZ4OTQ5K3lZWTVLbkhxUm42SUwwTXRZQUNI?=
 =?utf-8?B?blB2SWdKaHA5N0VmYVVtOWpVcnZGSEpmRWw5WWFGVGd4RytQaHEwZURWdkpw?=
 =?utf-8?B?aG5vcGZLTmdDcDh5U3dremFOMGJyaHY4cHRCS09jSmNNUVVzTTZpVzFwcmNN?=
 =?utf-8?B?Vm5MSWJnUXNQbmsxalJkbDMwWGhlWkU0Z2F6ditCM0pyOVh0eDFEK2dkY3M2?=
 =?utf-8?B?K2ZUUGhadkMxdUk2UnVXZllqNTVzSCtreUlIWE9kUlVWNnh0VVBzbjJuSEFF?=
 =?utf-8?B?YTJuMWRxRkloMFJ0SXVDSFNEOWxFV29rOTBkR2ZxVWFoN3diSTBoWUtSN3k5?=
 =?utf-8?B?aVZPWjJacUtpaHBZdE9ndHNLRFU1a21CdTdhTGplQWZTeEFSL3k0eUpBNjZq?=
 =?utf-8?B?NVFRSStpN0k3RlhCdURGK1ZEUjlkZmp3VVdwbUs2SG0rZ2NCTjR2TW5KU1dP?=
 =?utf-8?B?QUVxZnRWVDVWQ2t5NEI0ZEhQTXdwdDkyemJpWGZYZlFobWk2WjBVTVFsL2lO?=
 =?utf-8?B?bkxITUR2UThtd0liTytpTkxCbkY4SzUrTkdNejdFVWZVSWtWeUJVbWlCbkhl?=
 =?utf-8?B?WU1JU1hERGY4VitwVjl6MHU0TnpmTlBRVm9VUWpHb2tVOGxhTG9mcEVwYU9o?=
 =?utf-8?B?U05iR2s1L0JYenFFRjBvL3ZhaUtLNzNpc1Q3VHIrV1lhTmxlMkcweVgzWDdY?=
 =?utf-8?B?MzVUYXdFd2tiem5jZ3RmcDRWZGk3ZmFnZUhoUFFwazhsYytwNk1hanFRN1hq?=
 =?utf-8?B?b3FCcmhna0tRVGpwelpibFRuWEF2cGJYWnFwMGVvNGM2WWZZSnhhMUJRUFRs?=
 =?utf-8?B?VlBJMitzOGJoc3dLbEdSY3ZqY1ZnUTJMWkFZbXk2OGtxZUNtZ3p1NkNMZTlI?=
 =?utf-8?B?K2ZhNURPWEpxSkZ3MWh5OFM0NmRxUzdyeEM0aEc4MmdOR1RVbUFKN2pzM3Bs?=
 =?utf-8?B?SmxvMTV2bTNLZjlGODlua01zY29GeUV0K040SlZyaHhEYThUeW9Hb1VuMkRO?=
 =?utf-8?B?aW82MkRrV1h3TTlwOXk0TVF4eDNVSHJFbnVtOXJKMkUyMmF5ZlB1Z01zcjR6?=
 =?utf-8?B?UlVFenFYTWduZk1pOG8xUnlhMTZLZllySUNPRStaeUE5V255N0RPYTg4MEMz?=
 =?utf-8?B?dE9XeWlUNkxObklWd0NsU0dISFNMSlprLzZhbUtYOVA2MzlEZWlDNmIxdm8z?=
 =?utf-8?B?K0NXUzdMaDJFNVIxT0VHdmwweklaQ2FnUUUxNGZvaW9HdHJjSFYwaVNDRXUx?=
 =?utf-8?B?N3hJTEJLYm9JUFRwVnpNZGtZNXpRckZpajl4ajlNYk1QRTdINDFWR0RnTW0r?=
 =?utf-8?B?dUNkbzB1OHgxcHVQcWFVV0Zha1B4RFU5VHlMT2hmdjZHK1NSOHJYQ0l5VnU5?=
 =?utf-8?B?VjVNM1JMQW12Z3dzYnNrS0p1SlRaNkZqL2V6MHJCZlQ1dkhWVzA0SEN4aVAy?=
 =?utf-8?B?RGNLbTh0WTN0VDZHN29wLzhmN3k1UXRJanorSSswMXpmV1NUb3E1QnV5eTk4?=
 =?utf-8?B?SmRJMm5mTEhnZDBLMW9WekhYY2pSMGdxTHdxeVAzd1ZDNlZDMTcrSCtjWnRH?=
 =?utf-8?B?VzFTclNKZkNzRHNPbm9TQnpWUVRLd2ZoM3FCZS9GR2xnVWlSVHFrWHU5U0Rx?=
 =?utf-8?B?Nk9KaXVCbmxTZkx1R3dRRHVIYWc0VW1HYmxDdFVqUzRZK2ZJYndjcnVmcklm?=
 =?utf-8?B?UHc5ZFdSakFrUFpGWnlMenN4em5pNEtnMFc5UmNuSjZjSWpOV0kyYXc5WXFB?=
 =?utf-8?Q?JgzlX3ZWSF7Cn?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f54f3d0d-d6fe-4b73-24e7-08d8ccd180ce
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2021 08:05:45.7307 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wzyYezcTt8bbkXwnzS0ZNCtbX2CawPT92z6JxHY6ustG2eGJYtwDDZWSzbns0zjd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4223
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
Cc: David Airlie <airlied@linux.ie>, amd-gfx@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, Thomas Gleixner <tglx@linutronix.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The amdgou changes look mostly good to me.

But please send them out as separate patch set than the gma500 changes 
and please simplify boolean checks and don't use "x == true" or "x == 
false".

Regards,
Christian.

Am 09.02.21 um 00:31 schrieb Sebastian Andrzej Siewior:
> Folks,
>
> in the discussion about preempt count consistency across kernel
> configurations:
>
>   https://lore.kernel.org/r/20200914204209.256266093@linutronix.de/
>
> it was concluded that the usage of in_interrupt() and related context
> checks should be removed from non-core code.
>
> In the long run, usage of 'preemptible, in_*irq etc.' should be banned from
> driver code completely.
>
> This series addresses the gma500 driver and parts of the amdgpu driver.
> There are still call sites left in in the amdgpu driver.
>
> Sebastian
>
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
