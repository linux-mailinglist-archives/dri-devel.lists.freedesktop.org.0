Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C7B9A5516A
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 17:39:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BE5A10EA0F;
	Thu,  6 Mar 2025 16:39:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="iihMIT3Q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A05210EA0F
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Mar 2025 16:39:53 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-549662705ffso985092e87.0
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Mar 2025 08:39:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741279192; x=1741883992; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=FBPYVaLi/uKYGxgimpo2QNuRdBqjr1WrILf7lC0MLjw=;
 b=iihMIT3QqUW5nIlTnX/oNAzpQh8ljw16iBPsckYbsXpcqqnVrLxvlaekc7Ko6cjPn6
 Vu0khp0Vl1GfKcQxQ21YodUpIyjYnbYeayu0EmH721DtDfM8+1rBtX5kGjkS7nKzrEIt
 VHnrrMb4IImC6x02zm87tp4qlwV+kZh+PP1nmZGlul5NZr6llz+CT5ybEGJwiaPLdniV
 3bGWrBcx15Wbn0RxeE2Yk7dss5ooeicAE5ZsuvmeguigNa3YdAaANeQtLe2L7q0co/Gb
 6CnIOyqlX8kIegEmNKvdpslejfh6pxiFSTcvKzU207qvO1Zj8eRVhK8TGN0VEoH67Qj2
 Zxjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741279192; x=1741883992;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FBPYVaLi/uKYGxgimpo2QNuRdBqjr1WrILf7lC0MLjw=;
 b=u40Cs0PV3erH/m+C4nXEt1/iihSyKlGS3vMshum2ZhJl3nni/368CCSA8OGTX9x/Wd
 TRm1vAXoxjrrnAPa8yn8dGprNza+n/OhExipfxJc72aMZxFqTvGyceNY12rYoV7vM8Up
 WpNukbTmkBddppdlhYJiTyq0GMbckiOd5zMR5TUU0bevo4/kvpw44IXJ86RroebEN/gx
 ChERbuzmiBbAox6NAShysnXPnKCmH4PIF5cuHYZ32zRrxBswRdwG4tQzc3frcl+EGVzn
 BLqj+CLV0aDN3wXJsZH9KlWpnMWGSVG0KPIQwI8Hn//WFoJP116/FaYfr/nWGK6Fjcg5
 awdQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUJJzYEMsOK+Qzfu0bxhxx+2WY/3DDFHJJiDm0qgUe5YHpzMx/txB+yxXkSiAGzjakRsU5a7eva8+k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwmQuw2fHAH0qrjG9WkobtG1kyWyilbML1emtOVdVDJnV0FFtSY
 1ryzqiQZZTDm85WWzrZw2R6DwJrVyWriNLKSyirY3kIWQRRsTmmpTBlYUTk8tPo=
X-Gm-Gg: ASbGncuHqrN0rj2FHIpXBdgk0Re9M8pptgesH3JUa6uo9zH+YY2twk73AS10y4AlYzi
 DxomRoTStO7xm7VqxYheBy/LkaXEq6E6GrcY0A444EhLx2FeU1MR2cb61bLjHkFpCt5IApNPYco
 vxceSXOA4lr1q3oKmTxKdA8tb6EFyh9Q1YdkdlX2wr43vXB73ECAPD/tJiOKTPnqqbwtP1Nhmdp
 7zNtI1iVMfuMuhCrNxM6VxT/F+EOCN9Ahy78zg4V6to0TzxLqLbNQHAgULzIjwgQc8Kkh/gMX3+
 iBXQ8CqkDfApqDJ0SkJ9Qua9mkgFk+NfOUIZ4OeDv9wRR/amo+Vo98+kNKcHNigeWBhDUszXB30
 eLcNcsAoj1G6n/vqZH7yeCSrH
X-Google-Smtp-Source: AGHT+IHt8WQLWAGDWHo3md1Ffan9Wx7URm1t0MnTSAc9qQkPKqnAbToODyzMc5O6JoOi7DfCRhZZiA==
X-Received: by 2002:a05:6512:2391:b0:549:9078:dd45 with SMTP id
 2adb3069b0e04-5499078ddd8mr7463e87.28.1741279191737; 
 Thu, 06 Mar 2025 08:39:51 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5498b1c3c0esm227438e87.248.2025.03.06.08.39.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Mar 2025 08:39:51 -0800 (PST)
Date: Thu, 6 Mar 2025 18:39:48 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Yan <andyshrk@163.com>
Cc: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>, heiko@sntech.de, 
 neil.armstrong@linaro.org, sebastian.reichel@collabora.com,
 devicetree@vger.kernel.org, 
 hjc@rock-chips.com, mripard@kernel.org, linux-kernel@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, yubing.zhang@rock-chips.com,
 dri-devel@lists.freedesktop.org, 
 Andy Yan <andy.yan@rock-chips.com>, krzk+dt@kernel.org, robh@kernel.org, 
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 0/6] Add support for RK3588 DisplayPort Controller
Message-ID: <zybxwxxkua2zqukcd7tn2z4uwbqjbxt2fdtnrmpsov4hy55tzn@moxuyfxtyagb>
References: <25401bfa.291d.19564244e54.Coremail.andyshrk@163.com>
 <75189787-28E1-4FC2-8E10-4960B3877A6F@gmail.com>
 <28b0d3fc.bb3.19568f6b5f8.Coremail.andyshrk@163.com>
 <44213B17-FE14-4FB8-8319-1E31BBF6EAA0@gmail.com>
 <74c154b6.8c50.1956aa8c8d2.Coremail.andyshrk@163.com>
 <1573D5D6-AFED-4D92-8112-B0C6BB52D5FF@gmail.com>
 <46c0d239.a4f5.1956b619b97.Coremail.andyshrk@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <46c0d239.a4f5.1956b619b97.Coremail.andyshrk@163.com>
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

On Thu, Mar 06, 2025 at 08:15:13PM +0800, Andy Yan wrote:
> Hi Piotr,
> 
> 在 2025-03-06 19:47:31，"Piotr Oniszczuk" <piotr.oniszczuk@gmail.com> 写道：
> >
> >> Wiadomość napisana przez Andy Yan <andyshrk@163.com> w dniu 6 mar 2025, o godz. 09:53:
> >> 
> >> 
> >> Hi,
> >> 
> >> 在 2025-03-06 16:42:00，"Piotr Oniszczuk" <piotr.oniszczuk@gmail.com> 写道：
> >>> 
> >>> 
> >>>> Wiadomość napisana przez Andy Yan <andyshrk@163.com> w dniu 6 mar 2025, o godz. 01:59:
> >>>> 
> >>>> 
> >>>> 
> >>>> 
> >>>> Both of the two config options should be enabled.
> >>>> andy@Pro480:~/WorkSpace/linux-next$ rg DW_DP .config
> >>>> 4044:CONFIG_ROCKCHIP_DW_DP=y
> >>> 
> >>> here i’m a bit lost….
> >>> greping on full kernel sources (with applied https://patchwork.kernel.org/project/linux-rockchip/list/?series=936784) gives me no single appearance of ROCKCHIP_DW_DP…
> >>> Do i miss something?
> >> 
> >> see PATCH 3/6:   
> >> 
> >> 
> >> diff --git a/drivers/gpu/drm/rockchip/Kconfig b/drivers/gpu/drm/rockchip/Kconfig
> >> index 26c4410b2407..c8638baf9641 100644
> >> --- a/drivers/gpu/drm/rockchip/Kconfig
> >> +++ b/drivers/gpu/drm/rockchip/Kconfig
> >> @@ -8,6 +8,7 @@ config DRM_ROCKCHIP
> >> select DRM_PANEL
> >> select VIDEOMODE_HELPERS
> >> select DRM_ANALOGIX_DP if ROCKCHIP_ANALOGIX_DP
> >> + select DRM_DW_DP if ROCKCHIP_DW_DP
> >> select DRM_DW_HDMI if ROCKCHIP_DW_HDMI
> >> select DRM_DW_HDMI_QP if ROCKCHIP_DW_HDMI_QP
> >> select DRM_DW_MIPI_DSI if ROCKCHIP_DW_MIPI_DSI
> >> @@ -58,6 +59,12 @@ config ROCKCHIP_CDN_DP
> >>  RK3399 based SoC, you should select this
> >>  option.
> >> 
> >> +config ROCKCHIP_DW_DP
> >> + bool "Rockchip specific extensions for Synopsys DW DP"
> >> + help
> >> +  Choose this option for Synopsys DesignWare Cores DisplayPort
> >> +  transmit controller support on Rockchip SoC.
> >> 
> >> https://lore.kernel.org/linux-rockchip/047EECFC-7E55-44EC-896F-13FE04333E4D@gmail.com/T/#m178a325ea0ebc64187aae474d77c3f7a9e0bc93d
> >>> 
> >
> >
> >Ah my bad!
> >One patch patch was commented - so not all dp code was applied.
> >
> >Now it is much better:
> >
> >root@myth-frontend-56b0f018b5e0:~ # dmesg | grep drm
> >[    9.795380] panthor fb000000.gpu: [drm] clock rate = 198000000
> >[    9.796257] panthor fb000000.gpu: [drm] mali-g610 id 0xa867 major 0x0 minor 0x0 status 0x5
> >[    9.796262] panthor fb000000.gpu: [drm] Features: L2:0x7120306 Tiler:0x809 Mem:0x301 MMU:0x2830 AS:0xff
> >[    9.796265] panthor fb000000.gpu: [drm] shader_present=0x50005 l2_present=0x1 tiler_present=0x1
> >[    9.851869] panthor fb000000.gpu: [drm] Firmware protected mode entry not be supported, ignoring
> >[    9.851921] panthor fb000000.gpu: [drm] Firmware git sha: 814b47b551159067b67a37c4e9adda458ad9d852
> >[    9.852127] panthor fb000000.gpu: [drm] CSF FW using interface v1.1.0, Features 0x0 Instrumentation features 0x71
> >[    9.852436] [drm] Initialized panthor 1.3.0 for fb000000.gpu on minor 0
> >[   10.003108] rockchip-drm display-subsystem: bound fdd90000.vop (ops vop2_component_ops)
> >[   10.004705] rockchip-drm display-subsystem: bound fde60000.dp (ops dw_dp_rockchip_component_ops)
> >[   10.006085] rockchip-drm display-subsystem: bound fdea0000.hdmi (ops dw_hdmi_qp_rockchip_ops)
> >[   10.006679] [drm] Initialized rockchip 1.0.0 for display-subsystem on minor 1
> >[   10.006737] rockchip-drm display-subsystem: [drm] Cannot find any crtc or sizes
> >[   10.007663] rockchip-drm display-subsystem: [drm] Cannot find any crtc or sizes
> >
> >Unfortunately still nothing on screen
> >
> >dri state: https://gist.github.com/warpme/5e971dfd2e9fd52fae76641831cebe46
> >
> >and kernel dmesg https://termbin.com/r0m3
> >
> >i’m not sure what is missing (some dts enablement or….)
> 
> From your dts,  I find you use gpio for hpd, I'm not sure how to handle it  with upstream  code now.
> 
> 
> &dp1 {
> 	status = "okay";
> 	pinctrl-names = "default";
> 	pinctrl-0 = <&dp1_hpd>;
> 	hpd-gpios = <&gpio3 RK_PD5 GPIO_ACTIVE_HIGH>;

If this GPIO is handled by the DP controller itself, it should be a part
of DP's node. Otherwise please move it to the correctponding
dp-connector node.

> };
> 
> I suggest a change like this:
> 
> &dp1 {
> 	status = "okay";
> 	pinctrl-names = "default";
>         pinctrl-0 = <&dp1m0_pins>;
> 
> };
> 
> And also remove dp1_hpd pinctrl in your dts.
> 
> Then when you DP cable plugin, you can run command as bellow to see if the driver detects the HPD:
> 
> # cat /sys/class/drm/card0-DP-1/status 
> connected
> # 

-- 
With best wishes
Dmitry
