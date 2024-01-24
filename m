Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B95983ADBD
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jan 2024 16:49:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A09C10F77E;
	Wed, 24 Jan 2024 15:49:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8288210ED5D;
 Wed, 24 Jan 2024 15:49:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706111354; x=1737647354;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:to:cc:date:message-id:mime-version;
 bh=8CgVZUCRvC8rw1sZ3ggW6w0mrGtUXlvrP0pq0JjkhVk=;
 b=i8nxWEpCb5UTHS662yYZuR2UCIHA8aigAtbXZBiNsJ3RxJVP3Gvf8r7A
 CPxafC1PPria7PD/q+FIiNiAUSmhjTwYWHotM57HpIfXkY8bUSIU7yTt3
 rBVBeW+mEfj2hF2dec+B06IG7EbKiT7adM8+Lo7y2MZYxpni1sRD1rDG0
 5pvVlq2wRpn/JdhcN6NnUsDS8zwbAGf/Z/xoA1hADgPSAsvWEFOtXdjVO
 8EZucukBW4G5tXR5qWD3H9cY+zrVPR8WIIj6gOfDdBEA3VWrLC1e1fdho
 eO2ePm+8DmWOI1tUaTszj6WYi+2pMVsMl/1VUnuHpIz6y0HkrKNHJU1He Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="399035257"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="399035257"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2024 07:49:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="2070875"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 Jan 2024 07:49:14 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 24 Jan 2024 07:49:12 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 24 Jan 2024 07:49:12 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 24 Jan 2024 07:49:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Nsjze+bO0uuuD6rDF0p4UWHoO4Uko5v+V2uePURgTM2/JEUM6zzUvbWp7mGxNddSEkvsEXWWApHpow7lhP2nzUgp0p01Wxn55fO+Rjp+KBU37AVeZYUVdLHG0U9r+sNqAJC0RRrJHepQGF4IWSQG3vULI1LZi9Uztq2loqbNpXNYvd6b+k98PVKh5vDuHHVxU8BVJ6T5Qp8mACUmCvEBPaN26iiewnzkS0mjUSZtjgA+YeNlwrFAAN6CrvPqLJGUxwqH2UGxjrwJIbSZhsNQeOXAmMU13ouenULoAOdraN69ClrZ6QOpcI2yc7sAELWM1yLFgiQyXRoT7VA4EWQgpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BbeyerYEnp0zxF2dKwMg73YWtdYFYa0n3jxoAuZnKUI=;
 b=F1DkG5nSLrOeYIewIBXadmLda5FymXHX78IUh5c9mH79Pm7QTRPzJPax/ZLK5ymt3WCdoskoysNNkwVaj26DVWQJUveEvBdXEPzfOkOrYRbFWEFNizKh9Gy0BbNFrbpx4yaGwENOspKQlhvMleByl5uBVIFp+wni9pY3jxEBAZnrOZhRpCNTrK4TWRN3FtuoHe5fqw7OXZDmumhkA9oC9Ao8SizcM2n76OvtFo8Z7cDoR9JthYvjCnBpVlAkmzo/vjsQhR0KsRLs2MoJNy8mBOnV09bwzRcguofn5Z5gqEUMi2P2Me1mFsiN9J2Wkgc1QBLsW3dpI54+1VsQcuBu9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by IA1PR11MB6444.namprd11.prod.outlook.com (2603:10b6:208:3a7::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.34; Wed, 24 Jan
 2024 15:49:09 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::559e:7844:adc9:7793]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::559e:7844:adc9:7793%7]) with mapi id 15.20.7202.034; Wed, 24 Jan 2024
 15:49:09 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <ZbEsfl0tGLY+xJl0@yury-ThinkPad>
References: <20240124050205.3646390-1-lucas.demarchi@intel.com>
 <20240124050205.3646390-2-lucas.demarchi@intel.com>
 <87v87jkvrx.fsf@intel.com>
 <gvkvihpcc45275idrfukjqbvgem767evrux5sx5lnh5hofqemk@ppbkcauitvwb>
 <ZbEsfl0tGLY+xJl0@yury-ThinkPad>
Subject: Re: Re: [PATCH 1/3] bits: introduce fixed-type genmasks
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>, Yury Norov
 <yury.norov@gmail.com>
Date: Wed, 24 Jan 2024 12:49:04 -0300
Message-ID: <170611134445.31262.2799581830173501277@gjsousa-mobl2>
User-Agent: alot/0.10
X-ClientProxiedBy: SJ0PR03CA0237.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::32) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|IA1PR11MB6444:EE_
X-MS-Office365-Filtering-Correlation-Id: 4427fd7e-e66b-45d6-c7c6-08dc1cf400ef
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rCEAugbiT7z9+/ukSeYojki4rdY1vi6b4H/XpEHFsOvW7a9xTAVMklSQcsRJFRumQ3UCL6XLMhFUQR5MxZ5ETeWGXLcIdr3rf0tek0A0VOH3uhw+HOcDGlGITHBNW1fz2v2u13iifLO6nK2+vSq9t+OCM6fZN3s62xBKYPXDW8wrT+6YhcxofqoR9ymUqMABhwxGeYp4AxeVGzHsSay2rgjaAgDbT2nsE/2a1vxO84joU+kV4cyoXmOndkxGUoT49RsNPjZui8xyKkSgz2csa2D6e2qRwNEFkc4Z/gSumIZTxeGd0QU+NCldzc9XrLd7FDzDKnK0arm9EQ62OqWt2w6AoTBZvobWx8p4leM+oRQZiTMzi/a/40hBWU8/AgbG593Bk4ff5JIyI+O9NOfOqoQH6plblQkjjFqsSpXdKrrUlqs4h6AyBgh7FhOxkZvuMSCgZ2q0sTrwinxADbT38rG9ypGHK2YWvmIK6rZgfXv+w5n7l6M42FtqPBg/l6tmbE75IuSaR6WnQIkfr6gFd3zTkuJ3tiHYmxKEMcVtr94MpALlWCffsjxCyR9+PTze
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(39860400002)(136003)(366004)(376002)(346002)(396003)(230922051799003)(1800799012)(186009)(64100799003)(451199024)(4326008)(44832011)(83380400001)(8676002)(8936002)(9686003)(316002)(26005)(6512007)(6486002)(110136005)(54906003)(66946007)(5660300002)(6666004)(6506007)(66476007)(66556008)(478600001)(82960400001)(33716001)(41300700001)(2906002)(86362001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y2U4TUJEZ3RCRjY1NlhRazQ1RlpQUndSNXNDTjBJV1BOUTJ4bm9JVUZuRTh0?=
 =?utf-8?B?T0xGa3hadkZ3U1hNSlhhYUFheFNEekswaTRtZWFsSnV2ckdtbDduLy92UUcx?=
 =?utf-8?B?R25hNGwrbE5INWwwOVptUWVlOVB4MDhUWXpXREpsUnFHZUt3dm1jbkNEOTE0?=
 =?utf-8?B?KzdnZkVuZzUvOHdJUzRCd3FvbElkR2I5RFR3QVBxWks3YkFyTTljU0RBaWxH?=
 =?utf-8?B?bTNzR1JvRzU1QXUxL3VuSXQ4UFVpTFZzU0g2L3F1alAwWWhlbzNFTmY1am1J?=
 =?utf-8?B?KzVrL2lESWtZYVhtdWdWNlYzYWl3TWRsZU9yS0xRRUtNRzdRaTIzMU1ibVJ3?=
 =?utf-8?B?cGdndTlaNlRSS3o0Z21hemxjOEEydHE5VXdEKytwZlpUekZCdE04cnAyekJP?=
 =?utf-8?B?SW9XSm1ZY1ljZWNjTWZwbytqQS9JNWRPS08zK05MbHFkMTZ1RWpZL3M5QmUw?=
 =?utf-8?B?T0ZGV1NHVXl2VmdnVnhpdWk5cnk4QU5sZGhPczRYQ1NqSTFXNVoxdk9zMmpY?=
 =?utf-8?B?MXF1R3JkVkVLdDZZUjFDVDlISllaQkdTM1F1T3lNRTQ4SWZFamxocDNaZWpU?=
 =?utf-8?B?ZzdwaVRyaHl1TWs4NE84TW5rd2YvZDN1L0Z1SFVJUG5YSTdacGpNdGJYN2pr?=
 =?utf-8?B?cm4vcGt6bktSai96VDgzZVdHb1Q1S2hqNXp1Z2VKWktOSXpIZG1KSkFZWC9F?=
 =?utf-8?B?KzVocS92QnE4UWFvZGdGN3dPT00xYW9sMndNVGZ5eUQwSVN5V2RHNkRKMmE2?=
 =?utf-8?B?R0ZJK1dZS0grYnJLK3NsUTlMVHdwRVRHWEtTQzF6ZFUyemdTcHlMSzVjTU5M?=
 =?utf-8?B?dzhuQlNkc05xZTlxK3d0UzRudTZzMFk0SHU3QXRCYXN0RitPakZGT1JtTDla?=
 =?utf-8?B?Z09vZWF5UVZacWdiVmk3NHRCOVIzWVRkcFdmUTg1akRvZUwvRUQ4SXJRc1Vl?=
 =?utf-8?B?NGQralNQM1M5UnI2elcxckhyRmI1bnhORVI5SVI1aXhHS0hxNFhKbjBTcEVx?=
 =?utf-8?B?MmliamJTeXljSXpMTS9NaDBqdWhSS1lBUTVaYWFjcDdtSXArWUhIVmxLNmFw?=
 =?utf-8?B?VzVWb1MzWi9MU1NlNlNuTFRxRFh2RDlsR3FpTHl2cERiU2tBWHVzeDlNU0VY?=
 =?utf-8?B?eTFybGZ0M2FQRkhpeEk5NDNDQU9LVURpZmNQWjUzRVh5ZjFQM2pVZmw3MGtk?=
 =?utf-8?B?REJMOElDQ1EyQjZYc3BzUVIwRnBrSEVzUlVxM2VmekZ1QmEyOUx1aXM3ZzNj?=
 =?utf-8?B?Z0NHQWJBeFdBT1IyK3EvOVVlYVR3Rm53VEthSHFPNDdybHE3Z04vMmxOWlZB?=
 =?utf-8?B?cS92d0pybEhDb3Q1eTZVMkZZM3VHSE9aYTg0WXFrS3pBVFlOcWRnakkvS0dD?=
 =?utf-8?B?cjJZdUVLYzhQcENVbGJNY0N6b1lINUQwa1k4TlpXR0tiN0lLRnJUWkZGWUtY?=
 =?utf-8?B?NzNkSmpvQmMvUlNoVlJzTVR4ZDdFRWcyOU1yL3duSzI3elRlS0J0cUY1M25C?=
 =?utf-8?B?YzJZcjRUTlZEbmg2NUdUSG9HQWJQT1dKaGU1a3RiQTVPdUdkZGZlMHZSUTJV?=
 =?utf-8?B?b3AvUytZRG53VFdEUEE2c2d2ek5JVXJSY21RRVNKR1grbnJuWTY2bnRjVWta?=
 =?utf-8?B?UFZzRE83WGJRajBtcDhhN1NHOEtkNDh2cHlZNW9wMjF2QVJYSGRUT2w2THJz?=
 =?utf-8?B?aS9JLzBubmdMMkowQThKRDBuSEVhOFBUV1ZyVmpQN2xUNmpwSUsvSzdQLzdU?=
 =?utf-8?B?L1RseEtJWXBtRDdKc0pzTno1aHhXY2oyYkpwMDQ4V3lKeit5KzZWTlBhU2I4?=
 =?utf-8?B?bEsxMElvb2lacWhjVFg2UFRIVlNUeVVOQ0d0TzhBWUJWZVNDbnF6dXNIWnpP?=
 =?utf-8?B?ZGYya0VHVVNoSDBMUHVtaTJ6RHkxaUFFSVlzbjlPM0JzMnU0NExiMnJjeTJq?=
 =?utf-8?B?YmFVdktJYVVZQUwwMlFqbzRXSDkvWSt4YTJ3dWoxTURUR3IzSFdkZjQzcVYz?=
 =?utf-8?B?cHd1bUtCT2hqcGt3Rm13OXdweCtTMnduMmdycjFCOGhvZERMcnpVcUhwWWQz?=
 =?utf-8?B?TWk5eFFyK1Rxc0VWTC9ub0dBaUdKSERsNVNKRU1ISGc1ZkJ3WlRZNzA3a1pa?=
 =?utf-8?B?T1VzNUxMbnBvZTZRV1p6MXJ4UDMyV2ZYbzZZZ1VrN1VrMW1OS25DQ1JueWdQ?=
 =?utf-8?B?Umc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4427fd7e-e66b-45d6-c7c6-08dc1cf400ef
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2024 15:49:09.4172 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FQdO1Ti59ATkqvCLGvWvrV62waqjyUcG0w+8aGnYtMdo531b37+cvNItpjMwUzvPG3G2APPx9X17ZWLB9pzTwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6444
X-OriginatorOrg: intel.com
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
Cc: Jani Nikula <jani.nikula@intel.com>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 intel-xe@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Yury Norov (2024-01-24 12:27:58-03:00)
>On Wed, Jan 24, 2024 at 08:03:53AM -0600, Lucas De Marchi wrote:
>> On Wed, Jan 24, 2024 at 09:58:26AM +0200, Jani Nikula wrote:
>> > On Tue, 23 Jan 2024, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
>> > > From: Yury Norov <yury.norov@gmail.com>
>> > >=20
>> > > Generalize __GENMASK() to support different types, and implement
>> > > fixed-types versions of GENMASK() based on it. The fixed-type versio=
n
>> > > allows more strict checks to the min/max values accepted, which is
>> > > useful for defining registers like implemented by i915 and xe driver=
s
>> > > with their REG_GENMASK*() macros.
>> >=20
>> > Mmh, the commit message says the fixed-type version allows more strict
>> > checks, but none are actually added. GENMASK_INPUT_CHECK() remains the
>> > same.
>> >=20
>> > Compared to the i915 and xe versions, this is more lax now. You could
>> > specify GENMASK_U32(63,32) without complaints.
>>=20
>> Doing this on top of the this series:
>>=20
>> -#define   XELPDP_PORT_M2P_COMMAND_TYPE_MASK            REG_GENMASK(30, =
27)
>> +#define   XELPDP_PORT_M2P_COMMAND_TYPE_MASK            REG_GENMASK(62, =
32)
>>=20
>> and I do get a build failure:
>>=20
>> ../drivers/gpu/drm/i915/display/intel_cx0_phy.c: In function =E2=80=98__=
intel_cx0_read_once=E2=80=99:
>> ../include/linux/bits.h:41:31: error: left shift count >=3D width of typ=
e [-Werror=3Dshift-count-overflow]
>>    41 |          (((t)~0ULL - ((t)(1) << (l)) + 1) & \
>>       |                               ^~
>
>I would better include this in commit message to avoid people's
>confusion. If it comes to v2, can you please do it and mention that
>this trick relies on shift-count-overflow compiler check?

Wouldn't it be better to have explicit check that l and h are not out of bo=
unds
based on BITS_PER_TYPE() than relying on a compiler flag that could be turn=
ed
off (maybe for some questionable reason, but even so)?

--
Gustavo Sousa
