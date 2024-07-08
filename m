Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84A8392A58B
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jul 2024 17:24:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C017410E242;
	Mon,  8 Jul 2024 15:24:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NLntevwz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E231B10E242
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jul 2024 15:24:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720452241; x=1751988241;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=u4XcO8OKxouVyV9YfEado12sSMU5c+Uip/vhnVeBGIM=;
 b=NLntevwzxe+DBKbUdHZqoDFHnVS+JPnmV8nIqHPXJfk42zA5BCT45EZl
 j6A+X2qRug7tH0CfhVhOJe5yktvxU4mRV85HtWT/H4Wfp6CSdNge2qxGI
 oUeyZxRdwSwyBb4j8LIaebM5zkKtFV+WedAeEd9S0SOVeFGaI8Of3trkR
 BDmhEtr/Nf63p7u10NNXVVPX7bmTD8bFwLGQO+dnh+IoxIRL+FoDtu7Sw
 m0Rf2jJOUlNbGsXz282aJiB5ayv93mBvH22cMLQQd3fPX0JJHkqjoVTPi
 HvMDMOyuZvvHhRpYdqaKwxCZhzUDIJOUCzj9RjoYxMNmwDw0Et8I8xhqS g==;
X-CSE-ConnectionGUID: RPcFNjVdSruRPWaAv9MX8g==
X-CSE-MsgGUID: L+Pzv89iTQWJ4Pvi55KV9g==
X-IronPort-AV: E=McAfee;i="6700,10204,11127"; a="17368330"
X-IronPort-AV: E=Sophos;i="6.09,192,1716274800"; d="scan'208";a="17368330"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2024 08:24:00 -0700
X-CSE-ConnectionGUID: xkGhelTiQgayyYbJBXO5eQ==
X-CSE-MsgGUID: xhmeqSc/Qx6nHdaa13nSrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,192,1716274800"; d="scan'208";a="47459240"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Jul 2024 08:24:00 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 8 Jul 2024 08:23:59 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 8 Jul 2024 08:23:59 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 8 Jul 2024 08:23:59 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.174)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 8 Jul 2024 08:23:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MjFoQmVVas9s9S8phkYyamY2RMEqEri8yJDcTWE7YiGuCVupAcEauR8VnwoJFLgYZddFyP3+E4rd3rb4DjUm1c8W4SrZOBbWZhqp+WOi7W/gkyjhtN5xleU7c1RAOOtwDVdHJT8ED73mb+N4moPNr39dLWxxQFCYNXbOSxbK90MwdVpPGKyeZzPn/P+E+GOVjJTsWk2qDSja6sVzmIqiQEbPjo2iWYzZb905sWhTBnqIVULhKT0gq4ZMT9tAs05O1DK2cWoOo25OG4rqDuX9K4EbwqoLTYi6yIuSMRGshcu0Q1uuvYGd4p0BysxDgysg28tQefJT1Iukn6dSC8Gxkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L0GwmfveDFqdOvsaBNoopB8vLYELQsmTfnL//VCyymg=;
 b=RutAcT8giO5+2By7SCZ3uyf/BRYfnUreyQapATFotZp4lGPRzQIi7I+PlwKXAikOBN2OPpai4eDUMl+ouDgO0J8c31o7A94bHdsQf1M9efABIJwJ8lTSkjMz2UvJyJN0LC91NDR3Khuq9TOiRFmhf+vxeVp8JykxDHUTeY2beC07veavaXmWAgw5KNNBg+uOL2ymu5LAL96mMAyoNNmGAt5SpgWxfXgSTXrT0OHLGjeCvKJXQ0iuJalFuOx2AbzJiRGFrdwPw9Bbs8BaQ7m8iGPGzydpi86sTkSzXibSnJkd6Q4cr4igqmcBhzXd2YZWTeS0lGDxZosbJhtTlzo29g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by SJ0PR11MB6671.namprd11.prod.outlook.com (2603:10b6:a03:44b::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.36; Mon, 8 Jul
 2024 15:23:56 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%4]) with mapi id 15.20.7741.017; Mon, 8 Jul 2024
 15:23:56 +0000
Date: Mon, 8 Jul 2024 15:23:11 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 <dri-devel@lists.freedesktop.org>
Subject: Re: The TTM LRU-walk cherry-pick series
Message-ID: <ZowEX6tlXJJafTDZ@DUT025-TGLU.fm.intel.com>
References: <0db8246a59e67c8e740110c6cfdd8339bec97f32.camel@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0db8246a59e67c8e740110c6cfdd8339bec97f32.camel@linux.intel.com>
X-ClientProxiedBy: SJ0PR05CA0021.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::26) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|SJ0PR11MB6671:EE_
X-MS-Office365-Filtering-Correlation-Id: 62be6482-10d3-4950-6843-08dc9f61fb7a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?1iFFwqmr6UTl18wi1tmJrWXoSKktfaFQnrr/00gyNqjtPkLR9v301cbIpH?=
 =?iso-8859-1?Q?JdWlUEu57I5q+S5ev3c5Xe82qDKNoNa/13QfYd8/qG4H3tK+UWMQWXMVPD?=
 =?iso-8859-1?Q?RxfRRMrEkS/PjHwD/XldjdlgVXfXFAPVIYIVNmeEJIoz7OaG1Z8GsKa1Lu?=
 =?iso-8859-1?Q?0rzz8GW+kWHlftYXxmsMQE85l6eb2OmqrrgMFYd08K8vLkdLA7FjAZAJ4q?=
 =?iso-8859-1?Q?28wcSyzmV3pMkCbh8ErsOgOYzpacPDIuRD39nCQ47y1w3pOC7C5njSufPA?=
 =?iso-8859-1?Q?v55gSxpD/Lb8qojpiol9NfLzotvdUERjUaxqUGqYxvXWqAYdqLbci/9dRL?=
 =?iso-8859-1?Q?TXSoGFe1AD8guC9V1qion79ErbIDgEGz8XSxyS2O3uJxUq+BI2xifhbmIn?=
 =?iso-8859-1?Q?4+WjAeQuzd9hJjgfq43P8lKmM9lMjBGo1rRv5yY4f7HJeOgxw5Of33ma3B?=
 =?iso-8859-1?Q?axGyhZE2875I48bZukXymuRlFY0MNsAeTLdmya10JXSITl+C16GuDgtEpr?=
 =?iso-8859-1?Q?wK80rW9sdBpRmGIUAHF2ENKhwmJltQ0xBZwtUqo5ATAzs/NjBJkg2A0xOW?=
 =?iso-8859-1?Q?8/FQ+X94oiAQffh+d+Yc66x453TfF+6+G7L4M2g6KWgI692Kfo4OC+1pzk?=
 =?iso-8859-1?Q?fVDL56lb6u5JBCQae8M64u4/DbmPKdNggdJpy+0mZc9PZYwMKteGBMiZhJ?=
 =?iso-8859-1?Q?+TXyeZHl0GzejI2tX7U+1O6TusgW8JgNw6Q77/QCIFkPlDVHJjkaAezaZa?=
 =?iso-8859-1?Q?E/VaAEzuepcTjjeGMCZsPcgz5Z4X0bYOa5a5Na5juMIYR7XdXawzA0zBH0?=
 =?iso-8859-1?Q?lGggLOh/Az503S1I1YH5b4loUNaaXa/UM/kDOmWRG+NDun6auNXRnskZcu?=
 =?iso-8859-1?Q?OlUy1sgaMkV7+I9WM1CHmKRqxDnnsl6UjGXLWV6N9qGe7Eo6/kYBv7PleE?=
 =?iso-8859-1?Q?rHh+LUiG4bzMCCm944S+IdK4aRbm6hWwyIagloCiLRr6KHAZmZippdblu5?=
 =?iso-8859-1?Q?ZLFhIpCKZBeGeF840YqA+blSi3OuPyXjdn65EZo93BQIuDG/3efzUGfdWz?=
 =?iso-8859-1?Q?HoO6gT8s5NtAJY+VZZNr9OI38xJ2HfARz/JknglOnTtT+f7XMOq+eARUOo?=
 =?iso-8859-1?Q?4CrCjpyN5iFX+0wH3iTt49wDPaPF2xK5HBMpvbY3vqWXX1o4KPU4JIc0Bp?=
 =?iso-8859-1?Q?3MIRrMzIQ36mONoVUjOSiVSF3imNBst8P2BD+vNhtr3xr62FH5UZBhryme?=
 =?iso-8859-1?Q?Ar7XXjKvwrazo9wDhmhX6qRG+4UbvO2a8o4p0wr1MBDiKbAG+qe+3n/Au3?=
 =?iso-8859-1?Q?IVlj+AvOpvNUpRa4g29Uyo57R27sM8emN92N+hOxq6edlDs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?G90Hy6Gl90+iscN9Q/Y0KmlkXYPKwEMwRWLPg0v/2x31+9Z8zCfQtXqS3s?=
 =?iso-8859-1?Q?09W1EbCVzoSoluXfw8hzDcu7lQdMe7wg/Z09zUZ0Vbss0HbZ4U9h/fNlQL?=
 =?iso-8859-1?Q?WoH89QjePc40ZCZ0KctWsB9MbyyB4W/8a2hoi+ZKVgy9m9m0pk7uGnDPVR?=
 =?iso-8859-1?Q?aIsBdmhnoR1hDt34KcD+Vxl653LYY8ikUDlzJsgsyUS5Bql2gNWgvtGjJn?=
 =?iso-8859-1?Q?X5M5jCeA0sZ8w26Tdk7y2zq/nPwAiouotjuo87J+vaKg+RCsO2odzVGDBv?=
 =?iso-8859-1?Q?xkO/xuabs5oAI/mZAQNM+l4i7x29vS3UBVwk1ysutnqiTv3iLSt3Zikl6e?=
 =?iso-8859-1?Q?VEK12BZQYADfB2reOvi920E1kb3zkB6Bc5NZOpAnbbKYlggKfF8NajdkZw?=
 =?iso-8859-1?Q?dJ/whsdAW6fbfH22qizjQd+KJuO1TrifoQ1Ac3QknzaA/9mEkgn9HNsuEj?=
 =?iso-8859-1?Q?b+QQKzRtQuN+tZ2vNqaFDAMUM0dRM6OkpvRDpe4mDgjocd4xI5AigPhGGy?=
 =?iso-8859-1?Q?R4doIyhkahqykYxcNjFqWJoKoqf+OjDHqJfiI2BzyGGBUYmMQN0npAExQD?=
 =?iso-8859-1?Q?jJRGfANmm01pxq9kBKs+D1hyjM/O2KGm8uK23wXnz+UuLYuzV+CKmpgAH7?=
 =?iso-8859-1?Q?ChWcOvQHN7JLgUUVkX6uMwWkoCEPN3zWxzsqRPreBNx84Bu+cgMVAqSY1c?=
 =?iso-8859-1?Q?g8rMnlC09fkPLnrPRZcHe2tI5FduKWsDrXmFeUUIGgQ6DcI0G1/OBAVn6z?=
 =?iso-8859-1?Q?niQ0yEWkOFHblGsjRfp0x/sjRgRgh/XyIydzs2N1uEaGcFYQEVJKOzwER9?=
 =?iso-8859-1?Q?7T/aE/fHSIVMYXIUN6XnI0SdEHZL4pjgCmvKl2o8XgJj/pbvj2QzUkH3LF?=
 =?iso-8859-1?Q?e1Iq6hDL1p+pdk1xlt6OyrhxgiQOI7YxKagEeZrqnp6yR5ljRasBGD8BF9?=
 =?iso-8859-1?Q?XYX3EqsPcsNhzE+4lukOzL7yUskwpo4NyL2dYLafhyhM71Fg/KbDLlI0B7?=
 =?iso-8859-1?Q?Qe1X6/T0KcTVelmtKXMvn38AGZzjGbVac2BM/FIzc7Gwpg59HycqmzW24z?=
 =?iso-8859-1?Q?bXyyYhsE+16BoXBF62eDbk6JbE36b1MdkN1RvssEmeYcbzMtVvhHuTya1w?=
 =?iso-8859-1?Q?tJPqlhzwoHQ6BXYwY0tv9Qbz+7pd/mxYWrbJwuY0u2MiSS+ZqtandxRdVf?=
 =?iso-8859-1?Q?S4vTg+65xDTes762aBg4t1TlrWnKO2vj1y+/grrKpKgly1aTLy60/iekuM?=
 =?iso-8859-1?Q?6kfZ3Jxj5B3qcsBqQv1eu2vAewgyji2P5zOYCvoEqrOj9lReDvCBB1V5YN?=
 =?iso-8859-1?Q?55jjR9fSIxsI9d4XnhTuIFR1VSLOLTBP6onmjDMrVhNU2P5M30/VV8pubg?=
 =?iso-8859-1?Q?qUl57RNH+2MrJh/KxJfzhSMhHdcfCrhuwzWPd9kATSBX6e8EH1bRnYTeMN?=
 =?iso-8859-1?Q?C0vVbJR8kxdMFD/6vo9Et7vWEmylwc6hbj2BUCokOSknK8rdME2uchqd1j?=
 =?iso-8859-1?Q?hJLQdr8wbsI20eFNSdAvyg+udSea1wCjsCWgj2M5EVhgOmaYAmFycBwZt/?=
 =?iso-8859-1?Q?M/h48kNDNATIrWNhM+7jLzXvRO0F5gZ4stRz3lZS8Nq3jojIiC0q/B+Oc6?=
 =?iso-8859-1?Q?pWJwfZI8bWf8r3AybSZVXPzJjXhaRm2dNjMCw/PEaXXqZqo2Ly9QcoLQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 62be6482-10d3-4950-6843-08dc9f61fb7a
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2024 15:23:56.1027 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7Fly3a+ULMfCdQ+P7tzftieKGsBBLb+zJu4G/r16nQrzrPNboV0QiBElcURYJaC/NEYNZyxcDD6D7d5yqSFEYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6671
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Jul 07, 2024 at 05:49:16PM +0200, Thomas Hellström wrote:
> Christian, Matthew,
> 
> I think I addressed all review comments and a couple of anticipated
> ones (s/long/s64/) in the swapout- and eviction patches.
> 
> I'm heading off on vacation today, (4 weeks) so if something becomes
> urgent in-between feel free to pick up, modify and merge. 
> 

I found a couple of nits in last patch of [1] but gave an RB as the nits
can be fixed on upon merge.

The series [1] is fully RB'd and CI looks good. I'm thinking we should
merge this. If any bugs pop after merging feel confident that I can
quickly fix them while Thomas is out. Also fine for waiting for Thomas
to return too.

What do you think Christian? 

Matt

[1] https://patchwork.freedesktop.org/series/135801/ 

> Regarding the drm_exec trylock functionality I'm for as much as
> possible that it should look like any other locking primitive trylock.
> i.e. no additional tricks needed.
> 
> Thanks,
> Thomas
> 
> 
