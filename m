Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57FCEC3DE17
	for <lists+dri-devel@lfdr.de>; Fri, 07 Nov 2025 00:46:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70CA010EA12;
	Thu,  6 Nov 2025 23:46:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=hotmail.com header.i=@hotmail.com header.b="M4X48A3Z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azolkn19010016.outbound.protection.outlook.com [52.103.12.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB0BA10E9F9
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Nov 2025 23:46:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d6d0TJbi3QvbAYyQ3XlTjrBhR5XWxvrZEdYL2iOA7t6sIUgb7uMavhSCSE4ce5uNEEpmd5xjaHr+YIXM9+3n9GySjvYu5MQW7J6zMy1op1wuQkBqtmGjgzdUIisq+jV7G2L+rLkfySWZ6rOf65me6OvM2LS+FDaGfJz+HKOwabwh1rsusROY1HyzOW7fzJkcsib0FDL5tdiO14fWG+Rz3GgzSNRNU5pIALZw/S6OJK6wiY8eT7JLGuOK/WL77qTSiA/8+7UkjDy6pvrtLhi4uW6lquCJk5QQ5rmRlpEdaSU2s77re0nzTW26ChrY3XfcBiUMz+pixPH3ERQ3MS9skA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v9iwr3GCQeSJF/lrNylrfhSeQo0oZaMe4YTY14iB0bs=;
 b=LcoSLPWt+0GauIniqIimHKkCtfq/1fbJ0Q/GUxqq91Ow9a7ER1qrVxUGuwhRa/4er810m+gax67WyFccvuwnozG9zypWp32nFW4BQJtjRC8ufF6IJqp6o9ahA2YJD2nSlUDS6LcqTWZD2U2XD9bDZWEOQ0dPNDJ57ddtLF/kjSIIhrmWuITjiWHpSVjq+DCZ8M+lwL7QH4kiIjAWCfwMcqRNWP74AMktE61I0i7WSz9w4TuG5zUF9lEfNQOTfg4uamtcPIErZRRlXGr7t2cdEa3X2vvD8VTfjlPV1NlCecQsvVmKkZOYF0vldG67savIoM9X+A3Si2RibYb/X9anjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v9iwr3GCQeSJF/lrNylrfhSeQo0oZaMe4YTY14iB0bs=;
 b=M4X48A3ZVv3paRx/tPO6C3Hv/gEUMObFmh0QduHUUM49GJn+A/aMtecHhcZm9WjcU7lwdKhjXGQ6SCn5j73vFCOlb8JTJsZp+vFJpdadajMA3+7l+SgluM04TevhK71GIkjI6LgCf6/K+zvCd2eZwOxnyewLGr6BN2rZkIxWFlu//3j8Zq8qXMA70c90TnmNOOAva6Kaif6u0sBPLNXFfCqpfvreJE0q3Jfo03nPe01rswrtZTV5GTifFkpkN05FdCPzcU0fupMbV+qo2bprJ+IDmVRozHbq7Wtv7mYiL+xtERMutdkVpZIc9N9+owWk3AeZQgwJMIeYXfTVRT+L7Q==
Received: from SN6PR1901MB4654.namprd19.prod.outlook.com (2603:10b6:805:b::18)
 by SJ0PR19MB6583.namprd19.prod.outlook.com (2603:10b6:a03:47e::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Thu, 6 Nov
 2025 23:46:30 +0000
Received: from SN6PR1901MB4654.namprd19.prod.outlook.com
 ([fe80::7ffe:9f3a:678b:150]) by SN6PR1901MB4654.namprd19.prod.outlook.com
 ([fe80::7ffe:9f3a:678b:150%5]) with mapi id 15.20.9298.010; Thu, 6 Nov 2025
 23:46:30 +0000
Date: Thu, 6 Nov 2025 17:46:27 -0600
From: Chris Morgan <macromorgan@hotmail.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: linux-rockchip@lists.infradead.org,
 Chris Morgan <macroalpha82@gmail.com>, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, cristian.ciocaltea@collabora.com,
 sebastian.reichel@collabora.com, jernej.skrabec@gmail.com,
 jonas@kwiboo.se, Laurent.pinchart@ideasonboard.com,
 rfoss@kernel.org, neil.armstrong@linaro.org,
 andrzej.hajda@intel.com, conor+dt@kernel.org, krzk+dt@kernel.org,
 robh@kernel.org, tzimmermann@suse.de, mripard@kernel.org,
 andy.yan@rock-chips.com
Subject: Re: [PATCH 2/3] drm/bridge: dw-hdmi-qp: Add support for missing HPD
Message-ID: <SN6PR1901MB4654F4B7C67C04A00559C7C7A5C2A@SN6PR1901MB4654.namprd19.prod.outlook.com>
References: <20251106180914.768502-1-macroalpha82@gmail.com>
 <20251106180914.768502-3-macroalpha82@gmail.com>
 <2301926.irdbgypaU6@phil>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2301926.irdbgypaU6@phil>
X-ClientProxiedBy: SA0PR11CA0090.namprd11.prod.outlook.com
 (2603:10b6:806:d2::35) To SN6PR1901MB4654.namprd19.prod.outlook.com
 (2603:10b6:805:b::18)
X-Microsoft-Original-Message-ID: <aQ0zU-oBhj2MCERz@wintermute.localhost.fail>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR1901MB4654:EE_|SJ0PR19MB6583:EE_
X-MS-Office365-Filtering-Correlation-Id: 763ad166-c284-468f-fa85-08de1d8eb57b
X-MS-Exchange-SLBlob-MailProps: znQPCv1HvwUykhYCLh9DY9coCVULpTnXa0hl8a9ky1K2NPEUTM2wQdSiDAYp4ZmmFKlL6di5dzq4C6zhF2cMnTb9TiHl7jA132UHoodR6ku8ST6e6YTcuRcXWYecFbLTqz+MPk1xLn6glYAb0rKr9qw9pYPQ899GCzWprfTIjiyo5vd07i9yqklIpmGYApLk9rWLhye38HOx19tSIuen/URHOqzMnLTiUp7QCo/fo8G8/Geo70za8tTQX3FhYTJ+oXAhyULRw6wdzLQyxFsh0L/Vb5n0coTtZZbN2sX5prpcCQfjc07PfErgtkfZXHk5bXfXoBmEd1vE1rdi3sBhexai2t/AXbF+1wmfje3bdtANN64pZBpwhBu0T8ygpgZGyy+23iZwlpb7+3eWtutv2rWdysIcjqZ5QydsCIEyqYFnXk1fnyU6N+tBLNLR4p9nBJBJ6BMJYv89JuN5vLI2MeSyo0ppOXlI13Ung/d4AY2LvW5erxu/vKJNwxFhN5+B15OPRAzfBgzc3SdV2RkZYylqSQJYX/adGTTDZKLmwi1/dlp2shMgmZnOARIt1Y8crM3M5b2SSpks8rdoh+MXSPIl4irKkgGQrNZWFMXWSKDkJPCG7flOskcl+QVZSCtpq5aIiHTLnzBRSAiDY5O7F7kLxke+M7FpTs0a1JmqVK7VeMhSelYb1pyj2sAjNQ6Th8jrCo4L29wC9GU5htjZi+eH2Fs97hUWxGZ9be9MWTf8o9OUylBIUQc1Wk/mRsJADbi6xJzsmwE=
X-Microsoft-Antispam: BCL:0;
 ARA:14566002|41001999006|23021999003|5072599009|461199028|6090799003|19110799012|21061999006|15080799012|8060799015|13031999003|40105399003|41105399003|53005399003|440099028|3412199025;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?QzNlZ5BwIElWTmkeDz2lDhWoOomgROOEEUzCTYrvIA/+TcAeA/Z6OZuBxq?=
 =?iso-8859-1?Q?Fz/bn9coLoeqT60SBq1qL/DSd4k3RWRtkJbV7pVd03Xc1ZN8bz/2URN2WC?=
 =?iso-8859-1?Q?RmMvbmLosN4Xt/Unc/3VXOEHFAfW+t72cGMqxoW1X2shyI3QyZvXPFmchy?=
 =?iso-8859-1?Q?6KOMSH8Skszvvnf9LkshW8QbXdJjITiHik7gCKkq4eVyKT9/TF6aLixyzz?=
 =?iso-8859-1?Q?SjeEN4FmutegoiDUoMGECTc1RfzLXgrGwJABtIaErZb0o687SkWlL0Orw7?=
 =?iso-8859-1?Q?EW+iaTFkWuRn4T8FwOJXlrkzoSkOtZhDBmSwH29YbRiR6NRwOD69KgwH+v?=
 =?iso-8859-1?Q?qBg0pEJ8vXH7ul1XICQANnRwDkEcS0BO4Wq8c+WDPmDmJh7KV7VVq6EBVK?=
 =?iso-8859-1?Q?JbQD1Qz//ZInTNf49kRZF7skeS5qy94yFK71lh8Y+ywxBA6MhwxD1xGLkd?=
 =?iso-8859-1?Q?+uL92SWghfgMzHREjrku5XLamgRSStJ6hnmyVQHbRqgkngpWJjMT2cWOiN?=
 =?iso-8859-1?Q?7QzzZcGvXgqNuIC6rAnkNyzNk15N971PQMgrXcmK5t406rTJwLyEN1jSFR?=
 =?iso-8859-1?Q?JvXyP6HNtYSHU2KygoV2E7c7AVgw3paeZVEJxhGUBUmk4pME39TM/VGvl1?=
 =?iso-8859-1?Q?euJrRPoPfkW98QcvLXOA9QZHW4C9LdzBps6AK6n0JvJynosXuob9Z4gHuX?=
 =?iso-8859-1?Q?iXuonyE2omwYEX3QQjpycaBJGDt0TDb6lXxABWbZBULzkhIn+/eiB7SJUN?=
 =?iso-8859-1?Q?YvFlT1hlKxLg7kFE6sEuZm7GQdYJH9s2Fwqa7LtZFBqWFUMBLj5iEbbYHs?=
 =?iso-8859-1?Q?rMOyXTnntHw/0a2h7uIFbbao4whqxeX0rNLVwZ01RZlYguAK9PdGDy3kdS?=
 =?iso-8859-1?Q?ixqjdfgZqGyo308HovStgAXocv1qB06z0S8GReQ7NHWUeNil+T73EhlrU1?=
 =?iso-8859-1?Q?mUCVhzLqdG1r6fI739Iy64LTdqranQYHCU9KDXHxZ5zzx8JKQ10ybaDZF4?=
 =?iso-8859-1?Q?AxuzLs8jU9nzuE4NjirFTgwi85g9Aq2LBjNY/bofCxSCfN5enN83Cj9w9D?=
 =?iso-8859-1?Q?wreJdr2DVgQoSfel0NUuVRLyCb0xYCe5mc4A8nRKy97CKhkT0pgJCXxMez?=
 =?iso-8859-1?Q?CaZsmpsltimnv7yOxvZA81QQxTX2p3xjo1CfBzjlr1a4dhtp2DvJYtel11?=
 =?iso-8859-1?Q?Kdsk4tUFGtWv3COH29QTCLjpyhdHgDURAWvBa0WemBgWUdVaPzkytvbIG/?=
 =?iso-8859-1?Q?tUGFvPI2pPpwKuzpekTv9Jc/WMhDxT4k2oS+N97AU++nQ1tIew2sSSRoIG?=
 =?iso-8859-1?Q?TrvC9OrrMY6EDSnvEnSeHPR81FhMH9xINJNgTa+u3srbs62rqwKlQ/ZNtJ?=
 =?iso-8859-1?Q?rexGjaORyUjk5EuYKgHtsdDSTyMUeK9A=3D=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?6ZlsryzJfJs2qr4NoeKB7pVrVslh4fuw91yLVubeRh2ZG8yevmmwakJV5V?=
 =?iso-8859-1?Q?wcdClcmy68q+sF4hX6SIm4Eu2XpzWfsB03Y50VUK3tA0BrhoLLW/zAQbuO?=
 =?iso-8859-1?Q?fYIbWBvA6vDLDtcHHHHiNBsjJmD0uquiPSiG2sLrGh8m8It2Z8vSQ3Hy7W?=
 =?iso-8859-1?Q?/sZaVlfaNedKZ1+niGFXQkw+zjzuSdZBLWg+6lTDMvJ0mQlDJ85DPtRgDY?=
 =?iso-8859-1?Q?wJA7kbAehoYnQaALLC2r31PFPy6DIkCZtwBjXOSbhN7NlOXdAYLwfoMg5t?=
 =?iso-8859-1?Q?ClXFe1cI+0PXL4kRuzBbin0CX7GKuqrrcApjf5cKdkz17HmZ7lYnOo8bEK?=
 =?iso-8859-1?Q?8OpeJCd3BsUYT4GBMZXnBThqKCzWa5E1b2qnAW6XD9oa4ofBcLsUD67E9L?=
 =?iso-8859-1?Q?wDvJJCQFdDB5bIiEA3xsPsZKTngZIT+SA4T6iaGke1I4LtcMxWETmAFT/b?=
 =?iso-8859-1?Q?SGXKP0AHZFySpv5gbPvh956FWW7t2NvRCqK/Lp4xmAcp2SogFdTql1d9QS?=
 =?iso-8859-1?Q?RXtI5OEXWDIpihtG1LwLe98lrGmplL8zVEbSUHlrPbtpIs7WyG0phwPhVu?=
 =?iso-8859-1?Q?meXBkPcJtLHmoxJ4fB2bpPTxgknyycXl+7fwy/1TJUMzvStgIdk8vhmCyH?=
 =?iso-8859-1?Q?toMCTXqujgTR15I1Q1srStfUBU+9061tVAqSlCcBH+L6WYoViiUOu/vM7N?=
 =?iso-8859-1?Q?e49+ur4c3rueThUYKTAOZkOqmj41AIOUXnGLKiFuLALBB65LlYB23bBkeO?=
 =?iso-8859-1?Q?FptnH3jt1kmxYPlHv2UH8UdpQXFdZRXzKP535o+DyBuToDWsqj4rylYiN/?=
 =?iso-8859-1?Q?HVAWbSzXEPpGGWbkofU/p7YsD2pRqWkPHIDNiNOZSzkLyAu2m0cPzziiDg?=
 =?iso-8859-1?Q?uE5HUYoz59NkMUNnh3/4jK8xLxstsGtcEFAkNG9ZtfTYjQKy82NrEjcMt6?=
 =?iso-8859-1?Q?Kc6uhdMpLMVISf9sIIQpKzPc2XjsTLEtiNIuwzOsy+zpV8cRAOqTNCZOF2?=
 =?iso-8859-1?Q?I/Cj5C0I4pj3AJRQwwJTE627dgOIO1/hpcenH6HUmwbauzMG5Mi/Km2Mnv?=
 =?iso-8859-1?Q?SNMNfsMrED5JePu/looZ9guK933H6th/Yjrn6amO4iINyxH7Z2dOnMdK72?=
 =?iso-8859-1?Q?Ti/6KuopiybvmSJKHnnsqdyFmXjCU329Ahfiq+W/5aD7y7LlgsA1olV5yk?=
 =?iso-8859-1?Q?E+fIw0u+wS4XrszRNv48X8GBDdazbQn+5RDV4NcrbSn2SU4jNwZpjlQqQ/?=
 =?iso-8859-1?Q?LdaZjBD4kJ7Qcr98hAdDahG+eNiBK/ainCMi83tEY84QB/L3LwLjlnX1A8?=
 =?iso-8859-1?Q?sA/BeeYsgJxa8LM12aXRmDHeosombAF7t1MaB/qPcNVD/GKn8jPUD3q3Sf?=
 =?iso-8859-1?Q?uGgw7Vv7ds?=
X-OriginatorOrg: sct-15-20-9115-0-msonline-outlook-15bf1.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 763ad166-c284-468f-fa85-08de1d8eb57b
X-MS-Exchange-CrossTenant-AuthSource: SN6PR1901MB4654.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2025 23:46:30.4947 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR19MB6583
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

On Thu, Nov 06, 2025 at 08:40:55PM +0100, Heiko Stuebner wrote:
> Am Donnerstag, 6. November 2025, 19:09:13 Mitteleuropäische Normalzeit schrieb Chris Morgan:
> > From: Chris Morgan <macromorgan@hotmail.com>
> > 
> > Add support for the dw-hdmi-qp driver to handle devices with missing
> > HPD pins.
> > 
> > Since in this situation we are now polling for the EDID data via i2c
> > change the error message to a debug message when we are unable to
> > complete an i2c read, as a disconnected device would otherwise fill
> > dmesg with i2c read errors.
> > 
> > Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> 
> > @@ -1074,12 +1095,18 @@ struct dw_hdmi_qp *dw_hdmi_qp_bind(struct platform_device *pdev,
> >  	if (ret)
> >  		return ERR_PTR(ret);
> >  
> > +	if (of_property_present(pdev->dev.of_node, "no-hpd"))
> > +		hdmi->no_hpd = 1;
> > +	else
> > +		hdmi->no_hpd = 0;
> > +
> 
> what is the argument against
> 
> hdmi->no_hpd = of_property_read_bool(pdev->dev.of_node, "no-hpd")); ?
> 

I'm a self taught and not always that efficient? :-p
I'll make the change for the next version.

Thank you,
Chris

> 
> 
> 
> 
